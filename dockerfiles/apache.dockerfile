FROM php:7.3-apache
WORKDIR /var/www/html
# required php extensions for moodle
RUN docker-php-ext-install pdo pdo_mysql
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y libxml2-dev
RUN apt-get update && apt-get install -y libzip-dev zip
RUN apt-get update && apt-get install -y libpng-dev
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-configure zip && docker-php-ext-install zip
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN docker-php-ext-install gd
RUN docker-php-ext-install -j$(nproc) xmlrpc
RUN docker-php-ext-install soap
RUN docker-php-ext-install opcache
# exif extension required by moodle
RUN apt-get -yqq update
RUN apt-get -yqq install exiftool
RUN docker-php-ext-configure exif
RUN docker-php-ext-install exif
RUN docker-php-ext-enable exif
# Copy moodle inside container
COPY moodle .
# required ownership for this folders/files
RUN chown -R www-data:www-data * /var/www 
