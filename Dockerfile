FROM php:8.2-apache

WORKDIR /var/www/html

RUN a2enmod rewrite

COPY public/ /var/www/html/
COPY aead.json /var/www/aeadj/aead.json

RUN chown -R www-data:www-data /var/www && \
    chmod -R 755 /var/www

# 起動スクリプトを追加
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

EXPOSE 10000

CMD ["/docker-entrypoint.sh"]
