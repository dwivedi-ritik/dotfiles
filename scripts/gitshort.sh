#!/usr/bin/bash

echo "Lets roll git"

git add .

git commit -m "${1}"

git push "${2}" #${3}
