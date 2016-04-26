FROM owncloud:9.0.1-apache
MAINTAINER cxpqwvtj

RUN apt-get update && apt-get install -y \
	libldap2-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
	&& docker-php-ext-install ldap

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
