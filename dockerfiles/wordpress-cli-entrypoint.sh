#!/bin/bash
set -euo pipefail

# Primeiro, verifique se o WordPress está instalado e instale se necessário
if ! wp core is-installed --allow-root --path=/var/www/html; then
    echo "Instalando o WordPress..."
    wp core install --url="localhost:8080" --title="Estudo" --admin_user="admin" --admin_password="admin" --admin_email="teste@example.com" --allow-root --path=/var/www/html
    echo "WordPress instalado com sucesso."
else
    echo "O WordPress já está instalado."
fi

echo "⚙️ Configurando parâmetros do Wordpress..."

# Agora que o WordPress está instalado, configure os parâmetros
wp --allow-root --path=/var/www/html option get siteurl
wp --allow-root --path=/var/www/html option update siteurl "http://localhost:8080"
wp --allow-root --path=/var/www/html option update timezone_string "America/Sao_Paulo"
wp --allow-root --path=/var/www/html option update blogdescription "Site feito com Wordpress"
wp --allow-root --path=/var/www/html rewrite structure "/%postname%/"

wp --allow-root --path=/var/www/html option update admin "admin"
wp --allow-root --path=/var/www/html option update admin_password "admin"
wp --allow-root --path=/var/www/html option update blogname "Estudo"

# Criar páginas após a instalação
wp --allow-root --path=/var/www/html post create --post_type=page --post_title="HomeDockerFile" --post_status=publish

tail -f /dev/null