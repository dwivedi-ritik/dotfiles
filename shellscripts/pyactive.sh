#!/usr/bin/bash

#A shell script to activate virtualenv

envname=$1

if [[ -z envname ]] ; then
	echo "No arg are passed Environment will be create with .env"
	envname=".env"
fi

python -m virtualenv $envname

source $envname/bin/activate

echo "Environment has been activated 🍷"


