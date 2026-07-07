#!/bin/bash
set -euo pipefail

mkdir -p build

max=$(
  jq '[.[] | select(type=="object" and .number != null) | (.number | tonumber)] | max' aead.json
)

first=$((((max - 1) / 100) * 100 + 1))
last="$max"

out=$(printf "AEAD-%03d-%03d" "$first" "$last")

echo "Building ${out}.html"

jq --argjson first "$first" --argjson last "$last" '
  [
    .[]
    | select(type == "object")
    | select(.number != null)
    | select((.number | tonumber) >= $first and (.number | tonumber) <= $last)
  ]
  | sort_by(.number | tonumber)
' aead.json | jq -r -f aead-book-html-license.jq >"build/${out}.html"

echo "Building ${out}.pdf"

npx --offline @vivliostyle/cli build "build/${out}.html" \
  -s B5 \
  -o "build/${out}.pdf" \
  --timeout 900

./make-index.sh

echo "Done: build/${out}.html"
echo "Done: build/${out}.pdf"
