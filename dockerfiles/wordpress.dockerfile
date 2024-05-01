FROM wordpress:php8.3-apache

RUN apt update && apt install -y unzip

# Install Composer:
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN if ! php -m | grep -q 'xdebug'; then pecl install xdebug && docker-php-ext-enable xdebug; fi

# Configurar ServerName para suprimir a mensagem de aviso do Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install WP-CLI
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp