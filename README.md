:toc: macro
:toc-title: Table of Contents

# aeadj: An expression a day: Japanese

🗓️ Last change: 2025/06/14-19:40:54.

- [`aead.json`](./aead.json)

A bilingual dictionary of Japanese expressions based on the project _An Expression a Day: Japanese_

> Expressions that arise in the moment, one each day—recorded with immediacy and insight.

- [Render](https://aead-search.onrender.com/):
  A string searchable digital dictionary of Japanese expressions.

---

## 📘 Overview

**aeadj** is a digital dictionary of Japanese expressions, one recorded each day.  
Each entry includes immediate and adjusted forms, along with bilingual translations, usage examples, and interpretive notes.

---

## 🔍 Intended Uses

- Japanese learners: Discovering expressions used naturally in real-life speech
- Linguists: Studying immediacy, ellipsis, sentence-final structures, and expression patterns
- Developers: Applying expression patterns to language models or dialogue systems
- Educators: Introducing immediacy in language and communication styles

---

## 📐 Format

All expressions are stored in a single file: [`aead.json`](./aead.json).  
Each entry is a JSON object representing one Japanese expression, annotated with bilingual metadata, usage, grammar, and optional cultural notes.

| Key                      | Description                                                                 |
| ------------------------ | --------------------------------------------------------------------------- |
| `date`                   | Date of entry (e.g., `"2025.04.17"`)                                        |
| `day`                    | Day of the week (e.g., `"Thu"`)                                             |
| `number`                 | Serial number of the entry                                                  |
| `index`                  | Unique index label (for referencing)                                        |
| `title`                  | Title of the expression                                                     |
| `expression-ja`          | Expression in Japanese (with optional ruby annotation)                      |
| `roman-ja`               | Romanized Japanese reading                                                  |
| `expression-en`          | English translation of the expression                                       |
| `img-sub`                | Image file name (e.g., `"kigakiteru01.png"`)                                |
| `example-ja`             | Example sentence in Japanese                                                |
| `example-en`             | Example sentence in English                                                 |
| `notes-ja`               | Linguistic notes in Japanese (meaning, usage, grammar, immediacy, etc.)     |
| `notes-en`               | Linguistic notes in English                                                 |
| `column-ja`              | Cultural or anecdotal note in Japanese (optional)                           |
| `column-en`              | Cultural or anecdotal note in English (optional)                            |
| `adjusted-expression-ja` | Adjusted (non-immediate or polite) form in Japanese                         |
| `adjusted-expression-en` | Adjusted (non-immediate or polite) form in English                          |
| `tags-ja`                | Tags in Japanese                                                            |
| `tags-en`                | Tags in English (e.g., `"immediate grammar"`, `"ellipsis"`, `"evaluation"`) |
| `intent-ja`              | Communicative intention in Japanese                                         |
| `intent-en`              | Communicative intention in English (e.g., `"gratitude"`, `"request"`)       |

### 🧩 Notes vs Column

- **notes** are for linguistic or grammatical insights (meaning, pragmatics, immediate grammar)
- **column** offers cultural background, anecdotes, or emotional context

## 📌 Example

```json
  {
    "date": "2024.12.03",
    "day": "Tue",
    "number": 240,
    "index": "oniisan",
    "title": "Oniisan",
    "expression-ja": "お(兄:にい)さん",
    "roman-ja": "Oniisan",
    "English": "Big brother",
    "img-sub": "oniisan01.png",
    "example-ja": "お(兄:にい)さん、(手伝:てつだ)ってくれる？",
    "example-en": "Big brother, can you help me?",
    "notes-en": "\"Oniisan\" means \"big brother\" in Japanese. It is used to refer to an older brother or a young man who is older than the speaker even if he is not a brother. It is better not to use it for someone you don't know, you are regarded as a vulgar person. Of course, \"oneesan\" is the same.",
    "notes-ja": "\"お兄さん\"は、日本語で「お兄さん」という意味です。年上の兄弟や、兄弟でなくても年上の男性を指すときに使われます。あまり親しくない間や見ず知らずの人に対して、使うとあなたが下品な人として見做されるので、知らない人には使わない方がよい。もちろん、「お姉さん」も同様です。"
  },
```

> Note: Earlier entries may use "roman" instead of "roman-ja". These will be unified in future revisions.

---

## ⚖️ License

- This repository is licensed under the MIT License.
- The expressions (`aead.json`) are published under CC-BY-SA 4.0.
  - https://creativecommons.org/licenses/by-sa/4.0/

---

## 🔮 Future Plans

- Expansion to 500+ expressions
- Export to LaTeX/Markdown formats
- Publication as an open-access digital book
- Web-based search and display
- DOI-based versioning on Zenodo

---

## 👤 Author

- Hilo Yamamoto, Ph.D., Institute of Science Tokyo
