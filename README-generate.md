# AEAD: Generation and Release Procedure

This document describes how to generate the HTML/PDF booklets for **An Expression A Day (AEAD)** and how to prepare a milestone release for Zenodo.

## 1. Files used for generation

The main source data are stored in:

```text
aead.json
```

The following scripts are used to generate the publication files:

```text
build-aead-last.sh
build-aead-books.sh
make-index.sh
```

HTML booklets are generated using:

```text
aead-book-html-license.jq
```

PDF files are generated from the HTML files with Vivliostyle.

Generated files are stored in:

```text
build/
```

---

## 2. Normal incremental generation

During ordinary AEAD work, only the most recent 100-entry booklet needs to be regenerated.

For example, while entries 801–900 are being accumulated, run:

```bash
./build-aead-last.sh
```

The script determines the largest `.number` in `aead.json` automatically.

If the current maximum is 900, it generates:

```text
build/AEAD-801-900.html
build/AEAD-801-900.pdf
```

If the current maximum is 889, it generates:

```text
build/AEAD-801-889.html
build/AEAD-801-889.pdf
```

The script also runs:

```bash
./make-index.sh
```

automatically.

### Check the current maximum entry

Before making a milestone release, the current maximum can be checked with:

```bash
jq '[.[] | .number? // empty | tonumber] | max' aead.json
```

---

## 3. Important: milestone releases

For a milestone such as **AEAD 900**, the maximum entry in `aead.json` must be exactly the milestone number when `build-aead-last.sh` is run.

For example, if entry 901 has already been added but the intended release is AEAD 1–900:

1. Temporarily remove or move entry 901 from `aead.json`.
2. Confirm that the maximum is 900.
3. Run:

```bash
./build-aead-last.sh
```

This produces:

```text
AEAD-801-900.html
AEAD-801-900.pdf
```

After the release files have been generated, entry 901 can be restored to `aead.json`.

This separates:

```text
Published release: AEAD 001–900
Working data:      AEAD 901–
```

---

## 4. Remove an obsolete partial booklet

`build-aead-last.sh` does not remove an earlier partial booklet automatically.

For example, after generating:

```text
AEAD-801-900.html
AEAD-801-900.pdf
```

an older pair such as:

```text
AEAD-801-816.html
AEAD-801-816.pdf
```

may still remain in `build/`.

Remove the obsolete files:

```bash
rm build/AEAD-801-816.{html,pdf}
```

Then regenerate the index:

```bash
./make-index.sh
```

---

## 5. Rebuild all booklets

To regenerate the entire collection from `aead.json`, use:

```bash
./build-aead-books.sh
```

This divides the collection into 100-entry units automatically.

For a 900-entry collection, the result is:

```text
AEAD-001-100.html
AEAD-001-100.pdf

AEAD-101-200.html
AEAD-101-200.pdf

AEAD-201-300.html
AEAD-201-300.pdf

AEAD-301-400.html
AEAD-301-400.pdf

AEAD-401-500.html
AEAD-401-500.pdf

AEAD-501-600.html
AEAD-501-600.pdf

AEAD-601-700.html
AEAD-601-700.pdf

AEAD-701-800.html
AEAD-701-800.pdf

AEAD-801-900.html
AEAD-801-900.pdf
```

Normally this is unnecessary when only the newest entries have changed. Use `build-aead-last.sh` for routine incremental generation.

---

## 6. Generate the index

Run:

```bash
./make-index.sh
```

This generates:

```text
build/index.html
```

The index scans the generated `AEAD-*.html` files and provides links to the corresponding HTML and PDF booklets.

Before a release, check that obsolete partial booklets are not included.

---

## 7. Update the version number

Before creating a new Zenodo version, update the version number in:

```text
make-index.sh
```

There are currently **two occurrences** of the version number.

One is in the metadata:

```html
<p>
  <strong>Version:</strong>
  v1.1.0
</p>
```

The other is in the recommended citation:

```text
(Version 1.1.0). Zenodo.
```

Check them with:

```bash
grep -n 'v1\.' make-index.sh
```

After changing the version, regenerate the index:

```bash
./make-index.sh
```

Check the generated file as well:

```bash
grep -n 'v1\.' build/index.html
```

Both occurrences should show the new version.

### Future improvement

To avoid changing the version in two places, `make-index.sh` could later be modified to define the version once near the beginning, for example:

```bash
version="v1.1.0"
```

and use that variable throughout the generated HTML.

---

## 8. Final check before Zenodo

For the AEAD 900 release, `build/` should contain the nine complete booklet pairs:

```text
001–100
101–200
201–300
301–400
401–500
501–600
601–700
701–800
801–900
```

Check with:

```bash
ls build
```

Also verify:

```text
build/index.html
```

and make sure that:

- the release version is correct;
- the expected HTML/PDF pairs are present;
- no obsolete partial booklet remains;
- `index.html` links to the correct files.

---

## 9. Zenodo release

For a substantial extension of the collection, create a **new version** of the existing Zenodo record.

Do not use **Unlock files** for an entry expansion. That option is intended for correcting minor errors in an existing version.

For example:

```text
v1.0.0  → earlier release
v1.1.0  → AEAD 001–900
```

For the AEAD 900 milestone:

```text
Version: v1.1.0
Published: 2026-09-15
Entries: 001–900
```

Zenodo record:

```text
https://zenodo.org/records/22760403
```

A suitable version note is:

> **v1.1.0 — AEAD 900 milestone**
> Expanded _An Expression A Day (AEAD)_ to 900 entries. The collection now comprises nine 100-entry volumes (AEAD 001–900), provided in both HTML and PDF formats.

The description may additionally state:

> Version 1.1.0 contains 900 entries, organized into nine 100-entry booklets.

The recommended citation should contain the current release version:

```text
Yamamoto, H. (2026).
An Expression A Day (AEAD): A Structured Collection of Immediate Expressions in Japanese
(Version 1.1.0). Zenodo.
```

---

## 10. After publication

After the milestone release has been published:

1. Restore any temporarily removed next entry (e.g. 901) to `aead.json`.
2. Continue normal AEAD entry creation.
3. Do not rebuild the published 1–900 release merely because 901+ entries have been added.
4. Use `build-aead-last.sh` again when preparing or inspecting the next partial booklet.

Thus, after the AEAD 900 release:

```text
Zenodo v1.1.0
    └── AEAD 001–900 (fixed)

aead.json
    └── AEAD 001–901... (continuing)
```

## Quick reference

Routine update:

```bash
./build-aead-last.sh
```

Check maximum:

```bash
jq '[.[] | .number? // empty | tonumber] | max' aead.json
```

Full rebuild:

```bash
./build-aead-books.sh
```

Regenerate index:

```bash
./make-index.sh
```

Check versions:

```bash
grep -n 'v1\.' make-index.sh
grep -n 'v1\.' build/index.html
```

For a milestone release:

```text
fix maximum at milestone
        ↓
build-aead-last.sh
        ↓
remove obsolete partial booklet
        ↓
make-index.sh
        ↓
check version and build/
        ↓
Zenodo → New version
        ↓
publish
        ↓
restore next AEAD entry and continue
```
