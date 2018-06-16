#!/bin/sh

docker-compose exec -u web php bash -c 'cd /var/www/sftest1 ; php app/console server:run 0.0.0.0:8000'
