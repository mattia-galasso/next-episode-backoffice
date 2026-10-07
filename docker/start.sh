#!/bin/sh
set -e

# Render assegna la porta tramite la variabile PORT
PORT="${PORT:-80}"
sed -i "s/Listen 80/Listen ${PORT}/" /etc/apache2/ports.conf
sed -i "s/:80>/:${PORT}>/" /etc/apache2/sites-available/000-default.conf

# Copia il certificato di Aiven in un punto leggibile da Apache
if [ -f /etc/secrets/ca.pem ]; then
  cp /etc/secrets/ca.pem /var/www/html/storage/ca.pem
  chmod 644 /var/www/html/storage/ca.pem
else
  echo "ATTENZIONE: /etc/secrets/ca.pem non trovato"
fi

php artisan package:discover --ansi
php artisan storage:link || true

exec apache2-foreground