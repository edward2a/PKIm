#!/bin/bash

PRIVKEY="${PRIVKEY:-privkey.pem}"
INPUT="${INPUT:-message.enc}"

openssl rsautl -decrypt -inkey "${PRIVKEY}" -in "${INPUT}".key | openssl enc -d -aes-256-cbc -in message.enc -pass stdin -pbkdf2
