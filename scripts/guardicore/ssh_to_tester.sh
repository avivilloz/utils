#!/bin/bash

if [ $# -ne 1 ]; then
    echo "please provide thin env number"
    exit 1
fi

ssh root@$1.thin.env
