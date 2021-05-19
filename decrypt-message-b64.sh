#!/bin/bash

PRIVKEY="${PRIVKEY:-privkey.pem}"
INPUT="${INPUT:-message.enc}"

base64 -d "${INPUT}".b64 > "${INPUT}"
base64 -d "${INPUT}".key.b64 | openssl rsautl -decrypt -inkey "${PRIVKEY}" | openssl enc -d -aes-256-cbc -in "${INPUT}" -pass stdin -pbkdf2
