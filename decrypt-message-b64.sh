#!/bin/bash

PRIVKEY="${PRIVKEY:-privkey.pem}"
INPUT="${INPUT:-message.enc.b64}"

base64 -d "${INPUT}" > "${INPUT/.b64}"
base64 -d "${INPUT/.b64}".key.b64 | openssl rsautl -decrypt -inkey "${PRIVKEY}" | openssl enc -d -aes-256-cbc -in "${INPUT/.b64}" -pass stdin -pbkdf2
