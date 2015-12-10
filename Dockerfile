FROM alpine:3.1

#
# Install php
#

RUN apk add --update curl php php-openssl php-phar php-json && rm -rf /var/cache/apk/*

#
# Install Composer
#

RUN curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer

#
# Install PHPUnit
#

RUN cd /tmp \
  && curl -O https://phar.phpunit.de/phpunit.phar \
  && chmod +x phpunit.phar \
  && mv phpunit.phar /usr/local/bin/phpunit

#
# Test folder
#

VOLUME ["/opt"]
WORKDIR /opt

#
# Run tests
#

ENTRYPOINT ["/usr/local/bin/phpunit"]
CMD ["--help"]
