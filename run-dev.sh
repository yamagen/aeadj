#!/bin/bash

# 既存コンテナを止めて削除
docker stop aead-search-dev 2>/dev/null
docker rm aead-search-dev 2>/dev/null

# ボリュームマウントで開発用に起動
docker run -d \
  --name aead-search-dev \
  -p 8080:80 \
  -v $(pwd)/public:/var/www/html \
  -v $(pwd)/aead.json:/var/www/aeadj/aead.json \
  php:8.2-apache

# ログを表示
docker logs -f aead-search-dev
