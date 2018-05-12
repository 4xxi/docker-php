FROM php:7.2.2-fpm-alpine3.7

RUN apk update && apk add \
    git \
    zlib-dev \
    libicu-dev \
    zlib1g-dev

RUN docker-php-ext-install \
    bcmath \
    intl \
    opcache \
    pdo \
    zip

# https://getcomposer.org/doc/03-cli.md#composer-allow-superuser
ENV COMPOSER_ALLOW_SUPERUSER 1
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
