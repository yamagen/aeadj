#!/bin/bash
set -euo pipefail

out="build/index.html"

cat > "$out" <<'HTML'
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>An Expression A Day (AEAD)</title>
<style>
body {
  max-width: 860px;
  margin: 2.5rem auto;
  padding: 0 1.5rem;
  font-family: serif;
  line-height: 1.7;
}
h1 {
  line-height: 1.25;
  margin-bottom: 0.3em;
}
.subtitle {
  font-size: 1.15rem;
  color: #555;
  margin-top: 0;
}
.meta {
  margin-top: 1.5rem;
  padding: 1rem 1.2rem;
  background: #f5f5f5;
  border: 1px solid #ddd;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 1.5rem;
}
th, td {
  border-bottom: 1px solid #ddd;
  padding: 0.55rem 0.35rem;
  text-align: left;
}
th {
  background: #f7f7f7;
}
a {
  text-decoration: none;
}
a:hover {
  text-decoration: underline;
}
.footer {
  margin-top: 2.5rem;
  font-size: 0.9rem;
  color: #555;
}
.code {
  font-family: monospace;
}
</style>
</head>
<body>

<h1>An Expression A Day (AEAD)</h1>

<p class="subtitle">
A Structured Collection of Immediate Expressions in Japanese
</p>

<div class="meta">
  <p><strong>Author:</strong> Hilofumi Yamamoto, Institute of Science Tokyo</p>
  <p><strong>Version:</strong> v1.0.0</p>
  <p><strong>DOI:</strong> <a href="https://doi.org/10.5281/zenodo.20782438">10.5281/zenodo.20782438</a></p>
  <p><strong>License:</strong> Creative Commons Attribution 4.0 International (CC BY 4.0)</p>
</div>

<p>
An Expression A Day (AEAD) is a structured collection of immediate expressions in Japanese.
Each entry includes Japanese forms, romanization, English equivalents, example dialogues,
usage notes, variants, communicative intentions, and tags.
</p>

<p>
The HTML files provide a browser-readable edition. The PDF files provide fixed booklet editions
for citation, archiving, and distribution.
</p>

<table>
  <thead>
    <tr>
      <th>Entries</th>
      <th>HTML</th>
      <th>PDF</th>
    </tr>
  </thead>
  <tbody>
HTML

for html in build/AEAD-*.html; do
  base=$(basename "$html" .html)
  range=${base#AEAD-}
  pdf="${base}.pdf"

  if [[ -f "build/$pdf" ]]; then
    cat >> "$out" <<HTML
    <tr>
      <td>${range}</td>
      <td><a href="${base}.html">Read HTML</a></td>
      <td><a href="${pdf}">Download PDF</a></td>
    </tr>
HTML
  else
    cat >> "$out" <<HTML
    <tr>
      <td>${range}</td>
      <td><a href="${base}.html">Read HTML</a></td>
      <td>PDF not found</td>
    </tr>
HTML
  fi
done

cat >> "$out" <<'HTML'
  </tbody>
</table>

<div class="footer">
  <p>
    Recommended citation:
    Yamamoto, H. (2026).
    <em>An Expression A Day (AEAD): A Structured Collection of Immediate Expressions in Japanese</em>
    (v1.0.0). Zenodo.
    <a href="https://doi.org/10.5281/zenodo.20782438">https://doi.org/10.5281/zenodo.20782438</a>
  </p>

  <p>
    File naming convention:
    <span class="code">AEAD-001-100.html</span> /
    <span class="code">AEAD-001-100.pdf</span>.
  </p>
</div>

</body>
</html>
HTML

echo "Wrote $out"
