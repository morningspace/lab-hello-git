#!/bin/sh
set -e

echo Howdy! Welcome to MorningSpace Lab: Hello Git
echo
echo Before you start to explore, You can add below pub key
echo to your remote git, into /home/git/.ssh/authorized_keys
echo
cat ~/.ssh/id_rsa.pub

exec "$@"
