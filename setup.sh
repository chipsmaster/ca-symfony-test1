#!/bin/sh

docker-compose exec -u web php bash -c 'cd /var/www ; composer create-project symfony/framework-standard-edition sftest1 "2.8.*"'
