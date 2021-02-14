FROM php:7.4-fpm-alpine

ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1

COPY ./scripts/pecl-redis.sh /tmp
COPY ./scripts/wait-for-it.sh /opt

# Single RUN command reduced 330Mb

# Install dev dependencies
RUN apk --update add --no-cache --virtual .build-deps \
      $PHPIZE_DEPS \
      curl-dev \
      imagemagick-dev \
      libtool \
      libxml2-dev \
      postgresql-dev \
      sqlite-dev \
 # Install production dependencies
 && apk add --no-cache \
      bash \
      curl \
      freetype-dev \
      g++ \
      gcc \
      git \
      icu-dev \
      icu-libs \
      imagemagick \
      libc-dev \
      libjpeg-turbo-dev \
      libpng-dev \
      libzip-dev \
      make \
      autoconf \
      mysql-client \
      nodejs \
      nodejs-npm \
      oniguruma-dev \
      yarn \
      openssh-client \
      postgresql-libs \
      rsync \
      zlib-dev \
   && rm -rf /var/cache/apk/* \

   # Install PECL and PEAR extensions
   && pecl install \
      imagick \
      xdebug \
   && chmod +x /tmp/pecl-redis.sh \
   && /tmp/pecl-redis.sh \

   # Enable PECL and PEAR extensions
   && docker-php-ext-enable \
      imagick \
      xdebug \

   # Configure php extensions
   && docker-php-ext-configure gd --with-freetype --with-jpeg \
   
   # Install php extensions
   && docker-php-ext-install \
      bcmath \
      calendar \
      curl \
      exif \
      gd \
      iconv \
      intl \
      mbstring \
      pdo \
      pdo_mysql \
      pdo_pgsql \
      pdo_sqlite \
      pcntl \
      tokenizer \
      xml \
      zip \

   # Install composer
   && curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer \

   # Cleanup dev dependencies   
   && apk del -f .build-deps

# Setup working directory
WORKDIR /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]