#!/bin/bash
create_enc_message(){
    local KEY
    KEY="$(openssl rand -hex 64)"
    PUBKEY=${PUBKEY:-pubkey.pem}

    export KEY

    echo -ne "Message:\n$(openssl enc -aes-256-cbc -salt -pass env:KEY -pbkdf2 | base64)\n"
    echo -ne "Key:\n$(echo -n ${KEY} | openssl rsautl -encrypt -inkey ${PUBKEY} -pubin | base64)\n"
}

create_enc_message
