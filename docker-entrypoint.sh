#!/bin/bash

# デフォルトPORT
PORT=${PORT:-10000}

# Apache設定ファイルを書き換え
sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:${PORT}>/" /etc/apache2/sites-enabled/000-default.conf

# ServerName警告を抑制
echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Apache起動
apache2-foreground
