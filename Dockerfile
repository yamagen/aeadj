FROM php:8.2-apache

WORKDIR /var/www/html

RUN a2enmod rewrite

# public を Apache の公開ディレクトリに配置
COPY public/ /var/www/html/

# JSONファイルは上階層に保持（PHPから ../aeadj/aead.json で読めるように）
COPY aead.json /var/www/aeadj/aead.json

RUN chown -R www-data:www-data /var/www && \
    chmod -R 755 /var/www

EXPOSE 80
CMD ["apache2-foreground"]
