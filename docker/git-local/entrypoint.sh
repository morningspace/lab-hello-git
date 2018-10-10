#!/bin/sh
set -e

cat WELCOME
cat ~/.ssh/id_rsa.pub

exec "$@"
