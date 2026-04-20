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

def texesc:
  s
  | gsub("\\\\"; "\\\\textbackslash{}")
  | gsub("&"; "\\\\&")
  | gsub("%"; "\\\\%")
  | gsub("\\$"; "\\\\\\$")
  | gsub("#"; "\\\\#")
  | gsub("_"; "\\\\_")
  | gsub("\\{"; "\\\\{")
  | gsub("\\}"; "\\\\}")
  | gsub("~"; "\\\\textasciitilde{}")
  | gsub("\\^"; "\\\\textasciicircum{}");

def join_safe($sep):
  arr | map(texesc) | join($sep);

def field($k):
  .[$k] | texesc;

def item:
  "\\section*{" + (.number | s) + ". " + (.title | texesc) + "}\n\n"
  + "\\textbf{Date}: " + (.date | texesc) + " (" + (.day | texesc) + ")\\\\\n"
  + "\\textbf{Index}: " + (.index | texesc) + "\\\\\n"
  + "\\textbf{Expression (JA)}: " + (.["expression-ja"] | texesc) + "\\\\\n"
  + "\\textbf{Romanization}: " + (.["roman-ja"] | texesc) + "\\\\\n"
  + "\\textbf{Expression (EN)}: " + (.["expression-en"] | texesc) + "\n\n"

  + "\\textbf{Variants (JA)}: " + ((.["variants-ja"]) | join_safe(" / ")) + "\\\\\n"
  + "\\textbf{Variants (EN)}: " + ((.["variants-en"]) | join_safe(" / ")) + "\n\n"

  + "\\textbf{Intent (JA)}: " + ((.["intent-ja"]) | join_safe(", ")) + "\\\\\n"
  + "\\textbf{Intent (EN)}: " + ((.["intent-en"]) | join_safe(", ")) + "\n\n"

  + "\\textbf{Tags (JA)}: " + ((.["tags-ja"]) | join_safe(", ")) + "\\\\\n"
  + "\\textbf{Tags (EN)}: " + ((.["tags-en"]) | join_safe(", ")) + "\n\n"

  + "\\textbf{Adjusted Expression (JA)}:\\\\\n"
  + (.["adjusted-expression-ja"] | texesc) + "\\\\\n"
  + "\\textbf{Adjusted Expression (EN)}:\\\\\n"
  + (.["adjusted-expression-en"] | texesc) + "\n\n"

  + "\\textbf{Example (JA)}:\\\\\n"
  + (.["example-ja"] | texesc) + "\\\\\n"
  + "\\textbf{Example (EN)}:\\\\\n"
  + (.["example-en"] | texesc) + "\n\n"

  + "\\textbf{Notes (JA)}:\\\\\n"
  + (.["notes-ja"] | texesc) + "\n\n"
  + "\\textbf{Notes (EN)}:\\\\\n"
  + (.["notes-en"] | texesc) + "\n\n"

  + "\\newpage\n";

"\\documentclass[12pt,a5paper]{article}\n"
+ "\\usepackage{xeCJK}\n"
+ "\\usepackage{fontspec}\n"
+ "\\usepackage[margin=18mm]{geometry}\n"
+ "\\usepackage{parskip}\n"
+ "\\setCJKmainfont{Noto Serif CJK JP}\n"
+ "\\setmainfont{TeX Gyre Termes}\n"
+ "\\pagestyle{plain}\n"
+ "\\begin{document}\n\n"
+ (map(item) | join("\n"))
+ "\\end{document}\n"
