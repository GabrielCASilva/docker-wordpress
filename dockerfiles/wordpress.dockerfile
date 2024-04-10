FROM wordpress:php8.3-apache

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

#RUN chown -R www-data:www-data /var/www/html && \
#    chmod -R 755 /var/www/html

#COPY dockerfiles/wordpress/php.ini /usr/local/etc/php/php.ini

# Install WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp