#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');

const USAGE = `
Usage: node parse-schema.js <schema.sql> [--out-dir path] [--index] [--log]

  <schema.sql>    Path to MariaDB/MySQL dump file (schema-only or full)
  --out-dir path  Output directory for table .md files  (default: wiki/tables)
  --index         Also regenerate wiki/index.md
  --log           Also append an entry to wiki/log.md
`.trim();

const args = process.argv.slice(2);
if (args.length === 0 || args.includes('--help')) {
  console.log(USAGE);
  process.exit(0);
}

const inputFile = args[0];
const flagIndex = args.includes('--index');
const flagLog = args.includes('--log');

let outputDir = path.join(__dirname, 'wiki', 'tables');
const outIdx = args.indexOf('--out-dir');
if (outIdx !== -1 && args[outIdx + 1]) outputDir = path.resolve(args[outIdx + 1]);

const TODAY = new Date().toISOString().slice(0, 10);

// ── Helpers ──────────────────────────────────────────────

function camelToSnake(str) {
  return str
    .replace(/([a-z0-9])([A-Z])/g, '$1_$2')
    .replace(/([A-Z])([A-Z][a-z])/g, '$1_$2')
    .toLowerCase();
}

// ── SQL Parsing ──────────────────────────────────────────

function extractCreateTableBlocks(sql) {
  const blocks = [];
  const regex = /CREATE TABLE `([^`]+)` \(([\s\S]*?)\)\s*ENGINE=(\w+)(?:\s+AUTO_INCREMENT=(\d+))?\s+DEFAULT CHARSET=(\w+)(?:\s+COLLATE=(\w+))?/g;
  let m;
  while ((m = regex.exec(sql)) !== null) {
    blocks.push({
      name: m[1],
      body: m[2],
      engine: m[3],
      autoIncrement: m[4] ? parseInt(m[4], 10) : null,
      charset: m[5],
      collation: m[6] || null,
    });
  }
  return blocks;
}

function parseColumn(line) {
  line = line.trim().replace(/,\s*$/, '');
  const nameMatch = line.match(/^`(\w+)`\s+/);
  if (!nameMatch) return null;

  const name = nameMatch[1];
  let rest = line.slice(nameMatch[0].length);

  let type;
  const enumMatch = rest.match(/^((?:enum|set)\([^)]+\))/i);
  if (enumMatch) {
    type = enumMatch[1];
    rest = rest.slice(type.length).trim();
  } else {
    const modMatch = rest.match(
      /^(.*?)(?:\s+(?:NOT NULL|NULL|DEFAULT|AUTO_INCREMENT|COMMENT|ON UPDATE|GENERATED|INVISIBLE|VIRTUAL|STORED|AS)\b)/i
    );
    if (modMatch) {
      type = modMatch[1].trim();
      rest = rest.slice(modMatch[1].length).trim();
    } else {
      type = rest.trim();
      rest = '';
    }
  }

  const notNull = /\bNOT NULL\b/i.test(rest);
  const autoIncrement = /\bAUTO_INCREMENT\b/i.test(rest);

  let defaultValue = null;
  const defMatch = rest.match(
    /DEFAULT\s+('(?:[^'\\]|\\.)*'|NULL|TRUE|FALSE|CURRENT_TIMESTAMP(?:\(\))?|\d+(?:\.\d+)?|b'[01]+')/i
  );
  if (defMatch) defaultValue = defMatch[1];

  let enumValues = null;
  const evMatch = type.match(/^enum\((.+)\)$/i);
  if (evMatch) {
    enumValues = (evMatch[1].match(/'([^']*)'/g) || []).map((v) => v.replace(/'/g, ''));
  }

  return { name, type, nullable: !notNull, defaultValue, autoIncrement, enumValues };
}

function parseTableBody(body) {
  const lines = body.split('\n').map((l) => l.trim()).filter(Boolean);
  const columns = [];
  const indexes = [];
  const foreignKeys = [];
  let primaryKey = [];

  for (const line of lines) {
    if (line.startsWith('PRIMARY KEY')) {
      const cols = [...line.matchAll(/`(\w+)`/g)].map((m) => m[1]);
      primaryKey = cols;
      indexes.push({ name: 'PRIMARY', type: 'PRIMARY', columns: cols });
      continue;
    }

    if (line.startsWith('CONSTRAINT')) {
      const fk = line.match(
        /CONSTRAINT `(\w+)` FOREIGN KEY \(([^)]+)\) REFERENCES `(\w+)` \(([^)]+)\)/
      );
      if (fk) {
        const fkCols = [...fk[2].matchAll(/`(\w+)`/g)].map((m) => m[1]);
        const refCols = [...fk[4].matchAll(/`(\w+)`/g)].map((m) => m[1]);
        const onDel = line.match(/ON DELETE (CASCADE|RESTRICT|SET NULL|SET DEFAULT|NO ACTION)/);
        const onUpd = line.match(/ON UPDATE (CASCADE|RESTRICT|SET NULL|SET DEFAULT|NO ACTION)/);
        foreignKeys.push({
          name: fk[1],
          columns: fkCols,
          refTable: fk[3],
          refColumns: refCols,
          onDelete: onDel ? onDel[1] : null,
          onUpdate: onUpd ? onUpd[1] : null,
        });
      }
      continue;
    }

    const idxMatch = line.match(/^(UNIQUE KEY|KEY|FULLTEXT KEY)\s+`(\w+)`\s+\(([^)]+)\)/);
    if (idxMatch) {
      const cols = [...idxMatch[3].matchAll(/`(\w+)`/g)].map((m) => m[1]);
      const typeMap = { 'UNIQUE KEY': 'UNIQUE', KEY: 'INDEX', 'FULLTEXT KEY': 'FULLTEXT' };
      indexes.push({ name: idxMatch[2], type: typeMap[idxMatch[1]], columns: cols });
      continue;
    }

    if (line.startsWith('`')) {
      const col = parseColumn(line);
      if (col) columns.push(col);
    }
  }

  return { columns, indexes, foreignKeys, primaryKey };
}

// ── Relationship Graph ───────────────────────────────────

function buildGraph(tables) {
  const graph = {};
  const tableNames = new Set(tables.map((t) => t.name));

  for (const t of tables) graph[t.name] = { ...t, referencedBy: [], implicitRefs: [] };

  for (const t of tables) {
    for (const fk of t.foreignKeys) {
      if (graph[fk.refTable]) {
        graph[fk.refTable].referencedBy.push({
          fromTable: t.name,
          fromColumns: fk.columns,
          toColumns: fk.refColumns,
          onDelete: fk.onDelete,
          onUpdate: fk.onUpdate,
        });
      }
    }

    const fkColNames = new Set(t.foreignKeys.flatMap((fk) => fk.columns));
    for (const col of t.columns) {
      if (
        col.name.endsWith('_id') &&
        col.name !== 'id' &&
        !fkColNames.has(col.name)
      ) {
        const guessedTable = col.name.replace(/_id$/, '');
        if (tableNames.has(guessedTable)) {
          graph[t.name].implicitRefs.push({
            column: col.name,
            probableTable: guessedTable,
            probableColumn: 'id',
          });
        }
      }
    }
  }

  return graph;
}

function detectPolymorphic(table) {
  const results = [];
  for (const col of table.columns) {
    if (!col.enumValues) continue;
    if (!col.name.endsWith('_class') && col.name !== 'object_class') continue;

    const base = col.name.replace(/_class$/, '');
    const idCol = table.columns.find(
      (c) => c.name === `${base}_id` || c.name === 'object_id'
    );
    if (!idCol) continue;

    results.push({
      classColumn: col.name,
      idColumn: idCol.name,
      enumValues: col.enumValues,
      tables: col.enumValues.map((v) => camelToSnake(v)),
    });
  }
  return results;
}

// ── Markdown Generation ──────────────────────────────────

function generateTableMd(name, graph) {
  const t = graph[name];
  const poly = detectPolymorphic(t);

  const related = new Set();
  t.foreignKeys.forEach((fk) => related.add(fk.refTable));
  t.referencedBy.forEach((r) => related.add(r.fromTable));
  t.implicitRefs.forEach((r) => related.add(r.probableTable));
  poly.forEach((p) => p.tables.forEach((pt) => related.add(pt)));
  related.delete(name);

  const lines = [];
  const push = (s = '') => lines.push(s);

  // ── Frontmatter
  push('---');
  push('type: entity');
  push('subtype: database-table');
  push(`created: ${TODAY}`);
  push(`updated: ${TODAY}`);
  push('sources: ["[[schema-dump]]"]');
  push('tags: [database]');
  push(`engine: ${t.engine}`);
  push(`charset: ${t.charset}`);
  if (t.collation) push(`collation: ${t.collation}`);
  if (t.autoIncrement) push(`row_estimate: ${t.autoIncrement}`);
  push(`columns_count: ${t.columns.length}`);
  push(`relations_out: ${t.foreignKeys.length}`);
  push(`relations_in: ${t.referencedBy.length}`);
  push('---');
  push();

  // ── Title + Description
  push(`# ${name}`);
  push();
  push('## Description');
  push();
  push('*Purpose and business context to be documented.*');
  push();

  // ── Columns
  push('## Columns');
  push();
  push('| # | Column | Type | Nullable | Default | Extra |');
  push('|---|--------|------|----------|---------|-------|');
  t.columns.forEach((col, i) => {
    const pk = t.primaryKey.includes(col.name) ? 'PK' : '';
    const ai = col.autoIncrement ? 'AUTO_INCREMENT' : '';
    const extra = [pk, ai].filter(Boolean).join(', ');
    let def = col.defaultValue ?? '';
    if (def === '' && col.nullable && !col.autoIncrement) def = 'NULL';
    const nul = col.nullable ? 'YES' : 'NO';
    const typ = col.type.replace(/\|/g, '\\|');
    push(`| ${i + 1} | \`${col.name}\` | \`${typ}\` | ${nul} | ${def} | ${extra} |`);
  });
  push();

  // ── Enum values
  const enums = t.columns.filter((c) => c.enumValues);
  if (enums.length > 0) {
    push('## Enum Values');
    push();
    for (const col of enums) {
      push(`**\`${col.name}\`:** ${col.enumValues.map((v) => `\`${v}\``).join(', ')}`);
      push();
    }
  }

  // ── Indexes
  if (t.indexes.length > 0) {
    push('## Indexes');
    push();
    push('| Name | Type | Columns |');
    push('|------|------|---------|');
    for (const idx of t.indexes) {
      push(`| \`${idx.name}\` | ${idx.type} | ${idx.columns.map((c) => `\`${c}\``).join(', ')} |`);
    }
    push();
  }

  // ── Relations
  const hasRel =
    t.foreignKeys.length > 0 ||
    t.referencedBy.length > 0 ||
    t.implicitRefs.length > 0 ||
    poly.length > 0;

  if (hasRel) {
    push('## Relations');
    push();

    if (t.foreignKeys.length > 0) {
      push('### References (outbound)');
      push();
      for (const fk of t.foreignKeys) {
        const acts = [];
        if (fk.onDelete) acts.push(`ON DELETE ${fk.onDelete}`);
        if (fk.onUpdate) acts.push(`ON UPDATE ${fk.onUpdate}`);
        const actStr = acts.length ? ` *(${acts.join(', ')})*` : '';
        push(
          `- \`${fk.columns.join(', ')}\` → [[${fk.refTable}]].\`${fk.refColumns.join(', ')}\`${actStr}`
        );
      }
      push();
    }

    if (t.referencedBy.length > 0) {
      push('### Referenced by (inbound)');
      push();
      for (const ref of t.referencedBy) {
        push(
          `- [[${ref.fromTable}]].\`${ref.fromColumns.join(', ')}\` → \`${ref.toColumns.join(', ')}\``
        );
      }
      push();
    }

    if (poly.length > 0) {
      push('### Polymorphic associations');
      push();
      for (const p of poly) {
        push(`Via \`${p.classColumn}\` + \`${p.idColumn}\`:`);
        push();
        for (let i = 0; i < p.enumValues.length; i++) {
          push(`- \`${p.enumValues[i]}\` → [[${p.tables[i]}]]`);
        }
        push();
      }
    }

    if (t.implicitRefs.length > 0) {
      push('### Implicit references');
      push();
      push('> Columns named `*_id` without explicit FK — probable joins.');
      push();
      for (const r of t.implicitRefs) {
        push(`- \`${r.column}\` → [[${r.probableTable}]].\`${r.probableColumn}\``);
      }
      push();
    }
  }

  // ── See also
  if (related.size > 0) {
    push('## See also');
    push();
    for (const rt of [...related].sort()) push(`- [[${rt}]]`);
    push();
  }

  return lines.join('\n');
}

// ── Index & Log ──────────────────────────────────────────

function generateIndex(tables, graph) {
  const lines = [];
  const push = (s = '') => lines.push(s);

  push('# Index');
  push();
  push(`> Last updated: ${TODAY} | Pages: ${tables.length} | Tables: ${tables.length}`);
  push();

  push('## Sources');
  push('| Page | Summary | Date |');
  push('|------|---------|------|');
  push(`| [[schema-dump]] | MariaDB schema dump database | ${TODAY} |`);
  push();

  push('## Tables');
  push('| Table | Columns | FK out | FK in | Engine |');
  push('|-------|---------|--------|-------|--------|');
  for (const t of tables) {
    const g = graph[t.name];
    push(
      `| [[${t.name}]] | ${t.columns.length} | ${t.foreignKeys.length} | ${g.referencedBy.length} | ${t.engine} |`
    );
  }
  push();

  push('## Entities');
  push('| Page | Type | Summary |');
  push('|------|------|---------|');
  push('| *No entities yet.* | | |');
  push();

  push('## Concepts');
  push('| Page | Summary |');
  push('|------|---------|');
  push('| *No concepts yet.* | |');
  push();

  push('## Analyses');
  push('| Page | Summary | Date |');
  push('|------|---------|------|');
  push('| *No analyses yet.* | | |');
  push();

  return lines.join('\n');
}

function generateSourcePage(tables, inputFilename) {
  const totalFKs = tables.reduce((s, t) => s + t.foreignKeys.length, 0);
  const totalCols = tables.reduce((s, t) => s + t.columns.length, 0);
  const lines = [];
  const push = (s = '') => lines.push(s);

  push('---');
  push('type: source');
  push(`created: ${TODAY}`);
  push(`updated: ${TODAY}`);
  push('sources: []');
  push('tags: [database, schema, mariadb]');
  push('---');
  push();
  push('# Schema Dump');
  push();
  push('## Description');
  push();
  push(`MariaDB/MySQL schema dump of the database, parsed from \`${inputFilename}\`.`);
  push();
  push('## Key facts');
  push();
  push(`- **Tables:** ${tables.length}`);
  push(`- **Total columns:** ${totalCols}`);
  push(`- **Total foreign keys:** ${totalFKs}`);
  push(`- **Server:** MySQL 8.0`);
  push(`- **Default engine:** InnoDB`);
  push();
  push('## See also');
  push();
  push('All table pages reference this source:');
  push();
  for (const t of tables.slice(0, 10)) push(`- [[${t.name}]]`);
  if (tables.length > 10) push(`- *...and ${tables.length - 10} more tables*`);
  push();

  return lines.join('\n');
}

function generateLogEntry(tables) {
  const lines = [];
  lines.push(`## [${TODAY}] ingest | Database schema (${tables.length} tables)`);
  lines.push(`- Created: ${tables.length} table pages in wiki/tables/`);
  lines.push(`- Updated: [[index]]`);
  lines.push(`- Notes: Initial schema import via parse-schema.js`);
  lines.push('');
  return lines.join('\n');
}

// ── Main ─────────────────────────────────────────────────

function main() {
  if (!fs.existsSync(inputFile)) {
    console.error(`File not found: ${inputFile}`);
    process.exit(1);
  }

  console.log(`Reading ${inputFile}...`);
  const sql = fs.readFileSync(inputFile, 'utf-8');

  console.log('Parsing CREATE TABLE statements...');
  const blocks = extractCreateTableBlocks(sql);
  console.log(`Found ${blocks.length} tables.`);

  if (blocks.length === 0) {
    console.error('No CREATE TABLE statements found. Is this a valid MySQL/MariaDB dump?');
    process.exit(1);
  }

  const tables = blocks.map((b) => ({ name: b.name, ...b, ...parseTableBody(b.body) }));
  const graph = buildGraph(tables);

  fs.mkdirSync(outputDir, { recursive: true });

  let written = 0;
  for (const t of tables) {
    const md = generateTableMd(t.name, graph);
    fs.writeFileSync(path.join(outputDir, `${t.name}.md`), md);
    written++;
  }
  console.log(`Wrote ${written} table files to ${outputDir}/`);

  const sourcesDir = path.join(__dirname, 'wiki', 'sources');
  fs.mkdirSync(sourcesDir, { recursive: true });
  const sourcePage = generateSourcePage(tables, path.basename(inputFile));
  fs.writeFileSync(path.join(sourcesDir, 'schema-dump.md'), sourcePage);
  console.log(`Wrote wiki/sources/schema-dump.md`);

  if (flagIndex) {
    const indexPath = path.join(__dirname, 'wiki', 'index.md');
    fs.writeFileSync(indexPath, generateIndex(tables, graph));
    console.log(`Updated ${indexPath}`);
  }

  if (flagLog) {
    const logPath = path.join(__dirname, 'wiki', 'log.md');
    const existing = fs.existsSync(logPath) ? fs.readFileSync(logPath, 'utf-8') : '# Log\n';
    fs.writeFileSync(logPath, existing + '\n' + generateLogEntry(tables));
    console.log(`Appended to ${logPath}`);
  }

  const totalFKs = tables.reduce((s, t) => s + t.foreignKeys.length, 0);
  const totalCols = tables.reduce((s, t) => s + t.columns.length, 0);
  const totalInbound = tables.reduce((s, t) => s + graph[t.name].referencedBy.length, 0);
  const totalImplicit = tables.reduce((s, t) => s + graph[t.name].implicitRefs.length, 0);

  console.log(`\n── Summary ──`);
  console.log(`  Tables:              ${tables.length}`);
  console.log(`  Total columns:       ${totalCols}`);
  console.log(`  Explicit FK:         ${totalFKs}`);
  console.log(`  Inbound references:  ${totalInbound}`);
  console.log(`  Implicit FK (guess): ${totalImplicit}`);
  console.log(`  Avg columns/table:   ${(totalCols / tables.length).toFixed(1)}`);
}

main();
