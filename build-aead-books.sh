#!/bin/bash
set -euo pipefail

mkdir -p build

max=$(
  jq '[.[] | select(type=="object" and .number != null) | (.number | tonumber)] | max' aead.json
)

for first in $(seq 1 100 "$max"); do
  last=$((first + 99))

  if (( first > max )); then
    break
  fi

  if (( last > max )); then
    last="$max"
  fi

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
  ' aead.json \
    | jq -r -f aead-book-html-license.jq \
    > "build/${out}.html"

  echo "Building ${out}.pdf"

  npx --offline @vivliostyle/cli build "build/${out}.html" \
    -s B5 \
    -o "build/${out}.pdf" \
    --timeout 900
done

./make-index.sh
