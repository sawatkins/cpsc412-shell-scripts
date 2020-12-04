#!/bin/bash

GROUP="newusers"

if [ -z "$1" ]; then
	read -p "Enter username: " NAME
else
	NAME=$1
fi

if [[ $(grep -w "^$NAME:" /etc/passwd) ]]; then
	echo "User $NAME already exists!"
else
	adduser $NAME &&
	usermod -a -G $GROUP $NAME &&
	echo "User $NAME added to group $GROUP"
fi

