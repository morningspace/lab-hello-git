#!/bin/sh
set -e

# sample git config 
user_name=${user_name:-"dev"}
user_email=${user_email:-"dev@example.com"}

git config --global user.name "$user_name" && \
git config --global user.email "$user_email" && \
ssh-keygen -q -t rsa -f ~/.ssh/id_rsa -C "$user_email" -N ""

cat WELCOME
cat ~/.ssh/id_rsa.pub

exec "$@"
