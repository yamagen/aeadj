#!/bin/bash

# イメージをビルド
docker build -t aead-search .

# 既存コンテナを止めて削除（もし同じ名前で立ち上げていたら）
docker stop aead-search-test 2>/dev/null
docker rm aead-search-test 2>/dev/null

# 新しいコンテナを起動
docker run -d \
  --name aead-search-test \
  -e PORT=8080 \
  -p 8080:8080 \
  aead-search

# ログを表示
docker logs -f aead-search-test
