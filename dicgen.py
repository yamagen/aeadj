# dicgen.py
# AEAD (An Expression A Day) の JSON 辞書を LaTeX に変換（index順）

import json

# JSON ファイル読み込み
with open("aead.json", "r", encoding="utf-8") as f:
    data = json.load(f)

# "index" を小文字化してアルファベット順にソート
sorted_entries = sorted(data, key=lambda x: x.get("index", "").lower())

# LaTeX 出力開始
with open("aead_dictionary.tex", "w", encoding="utf-8") as f:
    f.write(r"""\documentclass[12pt]{article}
\usepackage{geometry}
\usepackage{titlesec}
\usepackage{hyperref}
\usepackage{longtable}
\geometry{a5paper, margin=2cm}
\titleformat*{\section}{\large\bfseries}
\begin{document}
""")

    for entry in sorted_entries:
        # expression-ja がなければスキップ
        if "expression-ja" not in entry:
            continue

        f.write(f"\\section*{{{entry['expression-ja']}}}\n")

        f.write(f"\\textbf{{Roman:}} {entry.get('roman-ja', '')}\n\n")
        f.write(f"\\textbf{{English:}} {entry.get('expression-en', '')}\n\n")

        f.write(f"\\textbf{{Intent:}} {', '.join(entry.get('intent-ja', []))} / {', '.join(entry.get('intent-en', []))}\n\n")
        f.write(f"\\textbf{{Tags:}} {', '.join(entry.get('tags-ja', []))} / {', '.join(entry.get('tags-en', []))}\n\n")

        f.write(f"\\textbf{{Adjusted Expression:}} {entry.get('adjusted-expression-ja', '')} / {entry.get('adjusted-expression-en', '')}\n\n")

        # バリアントがある場合
        if entry.get("variants-ja") or entry.get("variants-en"):
            f.write(f"\\textbf{{Variants:}} {', '.join(entry.get('variants-ja', []))} / {', '.join(entry.get('variants-en', []))}\n\n")

        # 会話例（英語のダブルクォートに注意）
        if entry.get("example-ja") or entry.get("example-en"):
            f.write("\\textbf{Example:}\n\n")

            example_ja = entry.get("example-ja", "")
            if isinstance(example_ja, str):
                example_ja = example_ja.replace("」", "」\\\\")
                f.write(example_ja + "\n\n")

            example_en = entry.get("example-en", "")
            if isinstance(example_en, str):
                example_en = example_en.replace('"', "''")  # LaTeXでは " → ''
                f.write(example_en + "\n\n")

        # ノート
        if entry.get("notes-ja") or entry.get("notes-en"):
            f.write("\\textbf{Notes:}\n\n")

            notes_ja = entry.get("notes-ja", "")
            if isinstance(notes_ja, str):
                notes_ja = notes_ja.replace("。", "。\\\\")
            else:
                notes_ja = ""
            f.write(notes_ja + "\n\n")

            notes_en = entry.get("notes-en", "")
            if isinstance(notes_en, str):
                notes_en = notes_en.replace(".", ".\\\\").replace('"', "''")
            else:
                notes_en = ""
            f.write(notes_en + "\n\n")

        f.write("\\bigskip\n\\hrule\n\\bigskip\n")

    f.write("\\end{document}\n")
