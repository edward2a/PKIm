#!/bin/bash
create_enc_message(){
    local KEY
    KEY="$(openssl rand -hex 64)"
    PUBKEY=${PUBKEY:-pubkey.pem}

    export KEY

    openssl enc -aes-256-cbc -salt -pass env:KEY -pbkdf2 | base64 > message.enc.b64
    echo -n "${KEY}" | openssl rsautl -encrypt -inkey "${PUBKEY}" -pubin | base64 > message.enc.key.b64
}

create_enc_message
