#!/bin/bash
set -e

if [ -n "$OWNCLOUD_BASE_PATH" ]; then
	echo "deploy at $OWNCLOUD_BASE_PATH"
fi
if [ ! -e '/var/www/html${OWNCLOUD_BASE_PATH}/version.php' ]; then
	mkdir -p /var/www/html$OWNCLOUD_BASE_PATH
	cd /var/www/html$OWNCLOUD_BASE_PATH
	tar cf - --one-file-system -C /usr/src/owncloud . | tar xf -
	chown -R www-data:root /var/www/html
fi

exec "$@"
