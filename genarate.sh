yamagen@julia ~/Dropbox/vimdir[INS]$ for first in 1 101 201 301 401 501 601 701; do  
 last=$((first + 99))               
 out=$(printf "AEAD-%03d-%03d" "$first" "$last")

 jq --argjson first "$first" --argjson last "$last" '
    [
      .[]
      | select(type == "object")
      | select(.number != null)
      | select((.number | tonumber) >= $first and (.number | tonumber) <= $last)
    ]
    | sort_by(.number | tonumber)
  ' aead.json | jq -r -f aead-book-html-license.jq > build/${out}.html

 npx @vivliostyle/cli build build/${out}.html -s B5 -o build/${out}.pdf
done
