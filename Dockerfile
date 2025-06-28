FROM php:8.2-apache

WORKDIR /var/www/html

RUN a2enmod rewrite

# public を Apache の公開ディレクトリに配置
COPY public/ /var/www/html/

# JSONファイルは上階層に保持
COPY aead.json /var/www/aeadj/aead.json

RUN chown -R www-data:www-data /var/www && \
    chmod -R 755 /var/www

# デフォルトポート（RenderがPORT環境変数を渡さない場合用）
ENV PORT=10000

# Apache設定を書き換え（ビルド時に値を埋め込む）
RUN sed -i "s/80/${PORT}/g" /etc/apache2/ports.conf && \
    sed -i "s/:80/:${PORT}/g" /etc/apache2/sites-enabled/000-default.conf

EXPOSE ${PORT}

CMD ["apache2-foreground"]
