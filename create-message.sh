#!/bin/bash

OUTPUT="${OUTPUT:-message.enc}"
KEY="$(openssl rand -hex 64)"
PUBKEY="${PUBKEY:-pubkey.pem}"

export KEY

if [[ -n "$1" && -f "$1" ]]; then
    cat "$1" | openssl enc -aes-256-cbc -salt -out "${OUTPUT}" -pass env:KEY -pbkdf2
else
    openssl enc -aes-256-cbc -salt -out "${OUTPUT}" -pass env:KEY -pbkdf2
fi
echo -n "${KEY}" | openssl rsautl -encrypt -inkey "${PUBKEY}" -pubin -out "${OUTPUT}".key

