def s:
  if . == null then ""
  elif type == "string" then .
  else tostring
  end;

def arr:
  if . == null then []
  elif type == "array" then .
  else [.]
  end;

def items:
  if type == "array" then . else [.] end;

def htmlesc:
  s
  | gsub("&"; "&amp;")
  | gsub("<"; "&lt;")
  | gsub(">"; "&gt;")
  | gsub("\""; "&quot;");

# Convert AEAD ruby notation such as (覚:おぼ) into HTML ruby.
# jq does not use \1, \2 in replacement strings here, so use named captures.
def rubyhtml:
  htmlesc
  | gsub("\\((?<rb>[^():]+):(?<rt>[^():]+)\\)";
         "<ruby>" + .rb + "<rt>" + .rt + "</rt></ruby>");

def attr:
  htmlesc;

def join_safe($sep):
  arr | map(rubyhtml) | join($sep);

def chips($xs):
  $xs | arr | map("<span class=\"chip\">" + (htmlesc) + "</span>") | join("\n");

def section_if($class; $title; $body):
  if ($body | s | length) > 0 then
    "<section class=\"" + $class + "\">\n" +
    "<h2>" + $title + "</h2>\n" +
    $body + "\n" +
    "</section>\n"
  else
    ""
  end;

def variants:
  (. ["variants-ja"] | arr) as $ja |
  (. ["variants-en"] | arr) as $en |
  ([($ja | length), ($en | length)] | max) as $n |
  if $n > 0 then
    "<section class=\"variants\">\n<h2>Variants</h2>\n<ul>\n" +
    ([range(0; $n)] | map(
      "<li>" +
      (if (($ja[.] // "") | s | length) > 0 then
        "<span class=\"ja\">" + ($ja[.] | rubyhtml) + "</span>"
       else "" end) +
      (if (($en[.] // "") | s | length) > 0 then
        "<br><span class=\"en\">" + ($en[.] | htmlesc) + "</span>"
       else "" end) +
      "</li>"
    ) | join("\n")) +
    "\n</ul>\n</section>\n"
  else
    ""
  end;

def intent_tags:
  (chips(. ["intent-ja"])) as $intent_ja |
  (chips(. ["intent-en"])) as $intent_en |
  (chips(. ["tags-ja"])) as $tags_ja |
  (chips(. ["tags-en"])) as $tags_en |
  section_if("intent-tags"; "Intent / Tags";
#    (if ($intent_ja | length) > 0 then "<p><strong>Intent JA</strong><br>" + $intent_ja + "</p>\n" else "" end) +
    (if ($intent_en | length) > 0 then "<p><strong>Intent EN</strong><br>" + $intent_en + "</p>\n" else "" end) +
#    (if ($tags_ja | length) > 0 then "<p><strong>Tags JA</strong><br>" + $tags_ja + "</p>\n" else "" end) +
    (if ($tags_en | length) > 0 then "<p><strong>Tags EN</strong><br>" + $tags_en + "</p>\n" else "" end)
  );

def adjusted:
  (. ["adjusted-expression-ja"] | rubyhtml) as $ja |
  (. ["adjusted-expression-en"] | htmlesc) as $en |
  section_if("adjusted"; "Adjusted Expression";
    (if ($ja | length) > 0 then "<p class=\"ja\">" + $ja + "</p>\n" else "" end) +
    (if ($en | length) > 0 then "<p class=\"en\">" + $en + "</p>\n" else "" end)
  );

def example:
  (. ["example-ja"] | rubyhtml) as $ja |
  (. ["example-en"] | htmlesc) as $en |
  section_if("example"; "Example";
    (if ($ja | length) > 0 then "<p class=\"ja\">" + $ja + "</p>\n" else "" end) +
    (if ($en | length) > 0 then "<p class=\"en\">" + $en + "</p>\n" else "" end)
  );

def notes:
  (. ["notes-ja"] | rubyhtml) as $ja |
  (. ["notes-en"] | htmlesc) as $en |
  section_if("notes"; "Notes";
#    (if ($ja | length) > 0 then "<p class=\"ja\">" + $ja + "</p>\n" else "" end) +
    (if ($en | length) > 0 then "<p class=\"en\">" + $en + "</p>\n" else "" end)
  );

def image_block:
  (. ["img-sub"] | s) as $img |
  if ($img | length) > 0 then
    "<figure class=\"image\">\n" +
    "<img src=\"images/" + ($img | attr) + "\" alt=\"AEAD image\">\n" +
    "</figure>\n"
  else
    ""
  end;

def item:
  "<article class=\"entry\" id=\"aead-" + (.number | s | attr) + "\">\n" +
  "<header class=\"entry-header\">\n" +
  "<p class=\"meta\">" + (.date | htmlesc) + " " + (.day | htmlesc) + " / No. " + (.number | s | htmlesc) + " / " + (.index | htmlesc) + "</p>\n" +
  "<h1>" + (.title | htmlesc) + "</h1>\n" +
  "</header>\n" +
  "<main>\n" +
  "<p class=\"expression-ja\">" + (. ["expression-ja"] | rubyhtml) + "</p>\n" +
  "<p class=\"roman\">" + (. ["roman-ja"] | htmlesc) + "</p>\n" +
  "<p class=\"expression-en\">" + (. ["expression-en"] | htmlesc) + "</p>\n" +
  # image_block +
  variants +
  adjusted +
  example +
  notes +
  intent_tags +
  "</main>\n" +
  "</article>\n";

def css:
"@page {
  size: B5;
  margin: 16mm 14mm 18mm 14mm;
  @bottom-center {
    content: counter(page);
    font-size: 9pt;
    color: #666;
  }
}

@page:first {
  @bottom-center { content: none; }
}

* { box-sizing: border-box; }

body {
  margin: 0;
  font-family: \"Noto Serif CJK JP\", \"Noto Serif JP\", \"Hiragino Mincho ProN\", serif;
  line-height: 1.72;
  color: #222;
  overflow-wrap: anywhere;
}

.cover {
  min-height: 215mm;
  display: flex;
  flex-direction: column;
  justify-content: center;
  break-after: page;
}

.cover h1 {
  font-size: 28pt;
  line-height: 1.2;
  margin: 0 0 0.25em 0;
}

.cover .subtitle {
  font-size: 13pt;
  margin: 0 0 2em 0;
}

.cover .range {
  font-size: 10pt;
  color: #555;
}

.cover .author {
  font-size: 14pt;
  margin: 2.2em 0 0.4em 0;
}

.cover .license {
  font-size: 9pt;
  color: #555;
  margin-top: 0.4em;
}

.colophon {
  break-before: page;
  min-height: 215mm;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  font-size: 9.5pt;
}

.colophon h1 {
  font-size: 16pt;
  border-bottom: 1px solid #aaa;
  padding-bottom: 0.4em;
  margin-bottom: 1em;
}

.colophon dl {
  display: grid;
  grid-template-columns: 32mm 1fr;
  gap: 0.35em 1em;
}

.colophon dt {
  font-weight: 700;
}

.colophon dd {
  margin: 0;
}

.entry {
  break-after: page;
}

.entry-header {
  margin-bottom: 1.2em;
  border-bottom: 1px solid #aaa;
  padding-bottom: 0.7em;
}

.meta {
  font-size: 8.5pt;
  color: #666;
  margin: 0 0 0.4em 0;
  letter-spacing: 0.02em;
}

h1 {
  font-size: 18pt;
  line-height: 1.25;
  margin: 0;
  font-weight: 700;
}

.expression-ja {
  font-size: 23pt;
  line-height: 1.65;
  margin: 0.8em 0 0.25em 0;
}

.roman {
  font-size: 10.5pt;
  color: #555;
  margin: 0.1em 0;
  font-style: italic;
}

.expression-en {
  font-size: 14pt;
  line-height: 1.45;
  margin: 0.4em 0 1em 0;
  font-weight: 700;
}

h2 {
  font-size: 10.5pt;
  margin: 1.1em 0 0.35em 0;
  padding-bottom: 0.12em;
  border-bottom: 1px solid #ddd;
  color: #333;
}

p {
  margin: 0.25em 0 0.55em 0;
}

.en {
  font-family: \"TeX Gyre Termes\", \"Noto Serif\", serif;
}

ul {
  margin: 0.2em 0 0.8em 1.2em;
  padding: 0;
}

li {
  margin: 0.25em 0;
}

.chip {
  display: inline-block;
  border: 1px solid #bbb;
  border-radius: 999px;
  padding: 0.05em 0.55em;
  margin: 0 0.25em 0.3em 0;
  font-size: 8.5pt;
  line-height: 1.5;
}

.image {
  margin: 0.8em 0 0.6em 0;
  text-align: center;
}

.image img {
  max-width: 70%;
  max-height: 58mm;
  object-fit: contain;
}

ruby { ruby-position: over; }
rt { font-size: 0.46em; }
";

def author: "Hilofumi Yamamoto, Ph.D.";
def license_name: "Creative Commons Attribution 4.0 International (CC BY 4.0)";

def range_text($items):
  ($items | length) as $len |
  if $len > 0 then
    ($items | map(.number | tonumber) | min | tostring) as $first |
    ($items | map(.number | tonumber) | max | tostring) as $last |
    "No. " + $first + "-" + $last + " / " + ($len | tostring) + " entries"
  else
    "No entries"
  end;

def cover($items):
  "<section class=\"cover\">\n" +
  "<h1>An Expression A Day</h1>\n" +
  "<p class=\"subtitle\">AEAD PDF Book</p>\n" +
  "<p class=\"range\">" + range_text($items) + "</p>\n" +
  "<p class=\"author\">" + (author | htmlesc) + "</p>\n" +
  "<p class=\"license\">" + (license_name | htmlesc) + "</p>\n" +
  "</section>\n";

def colophon($items):
  "<section class=\"colophon\">\n" +
  "<h1>Colophon</h1>\n" +
  "<dl>\n" +
  "<dt>Title</dt><dd>An Expression A Day</dd>\n" +
  "<dt>Author</dt><dd>" + (author | htmlesc) + "</dd>\n" +
  "<dt>Range</dt><dd>" + range_text($items) + "</dd>\n" +
  "<dt>License</dt><dd>" + (license_name | htmlesc) + "</dd>\n" +
  "<dt>Source</dt><dd>Generated from AEAD JSON data.</dd>\n" +
  "</dl>\n" +
  "</section>\n";

items | map(select(type == "object" and .number != null)) | sort_by(.number | tonumber) as $items |
"<!doctype html>\n" +
"<html lang=\"ja\">\n" +
"<head>\n" +
"<meta charset=\"utf-8\">\n" +
"<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
"<title>An Expression A Day</title>\n" +
"<style>\n" + css + "\n</style>\n" +
"</head>\n" +
"<body>\n" +
cover($items) +
($items | map(item) | join("\n")) +
colophon($items) +
"\n</body>\n" +
"</html>\n"
