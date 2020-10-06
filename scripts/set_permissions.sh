#!/bin/bash
cd /var/www/html
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
find var vendor pub/static pub/media app/etc -type f -exec chmod g+w {} \;
find var vendor pub/static pub/media app/etc -type f -exec chmod g+w {} \;
chown -R 1000:1000 ./
chmod u+x bin/magento