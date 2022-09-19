FROM alpine
RUN apk add --no-cache curl openssl zip unzip php php-fpm php-dom php-tokenizer php-xmlwriter php-fileinfo php-phar php-mbstring php-iconv php-openssl php-xml php-pdo php-json php-ctype php-curl
RUN curl -Ss getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . /
WORKDIR /laravel-app
RUN composer install
CMD php artisan serve --host=0.0.0.0 --port=8080
EXPOSE 8080