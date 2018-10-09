#!/bin/sh
set -e

echo Howdy! Welcome to MorningSpace Lab: Hello Git
echo

service ssh start
service apache2 start

exec "$@"
