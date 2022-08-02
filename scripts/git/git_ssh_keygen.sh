#!/bin/bash

if [ $# -ne 2 ]
then
	echo "provide github username[1] and email[2]"
	exit 1
fi

ssh_key_file="~/.ssh/github_ssh_key_for_$1"

mkdir -p ~/.ssh
ssh-keygen -t ed25519 -C "$2" -f "$ssh_key_file"

echo "
Host $1 github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/$ssh_key_file" \
>> ~/.ssh/config

cat ~/.ssh/$ssh_key_file.pub
