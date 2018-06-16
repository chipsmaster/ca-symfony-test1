#!/bin/sh

docker-compose exec -u web -e COLUMNS="$(tput cols)" -e LINES="$(tput lines)" php bash
