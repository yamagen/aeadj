#!/bin/bash
sed \
  -e 's/"expression":/"expression-ja":/g' \
  -e 's/"roman":/"roman-ja":/g' \
  -e 's/"English":/"expression-en":/g' \
  aead.json > aead_updated.json
