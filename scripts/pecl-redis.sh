#!/bin/sh
mkdir -p /tmp/pear/temp
cd /tmp/pear/temp
pecl bundle redis
cd redis
phpize
./configure --with-php-config=/usr/local/bin/php-config --enable-redis-igbinary=no --enable-redis-lzf=no --enable-redis-zstd=no
make
make install
docker-php-ext-enable redis
rm -rf /tmp/pear