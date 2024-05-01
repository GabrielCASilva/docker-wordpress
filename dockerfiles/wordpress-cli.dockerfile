FROM wordpress:cli-php8.3

USER root

RUN apk update && apk add dos2unix

COPY --from=ghcr.io/ufoscout/docker-compose-wait:latest /wait /wait

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

## Add the entrypoint script to the image
COPY wordpress-cli-entrypoint.sh /usr/local/bin/wordpress-cli-entrypoint.sh
RUN dos2unix /usr/local/bin/wordpress-cli-entrypoint.sh && chmod +x /usr/local/bin/wordpress-cli-entrypoint.sh

# COPY themes/estudo/composer.json themes/estudo/composer.lock /var/www/html/wp-content/themes/estudo/
# RUN composer install --working-dir=/var/www/html/wp-content/themes/estudo