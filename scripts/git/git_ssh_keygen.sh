#!/bin/bash

if [ $# -ne 2 ]
then
	echo "provide github [1]username and [2]email"
	exit 1
fi

mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "$2" -f "id_ed25519_$1"

echo "
Host $1 github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_ed25519_$1" \
>> ~/.ssh/config

cat ~/.ssh/id_ed25519_$1.pub
