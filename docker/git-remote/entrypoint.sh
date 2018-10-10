#!/bin/sh
set -e

cat WELCOME
service ssh start
service apache2 start

exec "$@"
