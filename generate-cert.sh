#!/usr/bin/env bash

HOST=$1

if [ -z "$HOST" ]; then
    echo 'Argument required...'
    exit 1
fi

if [ ! -d ./nuts-development-network-ca ]; then
    echo 'Nuts development network certificate authority was not found.'
    exit 1
fi

if [ ! -d ./nuts/certs ]; then
    mkdir -p ./nuts/certs
fi

pushd ./nuts-development-network-ca
./issue-cert.sh stable $HOST

mv ./$HOST-stable.key ../nuts/certs/certificate-stable.key
mv ./$HOST-stable.pem ../nuts/certs/certificate-stable.pem
mv ./truststore-stable.pem ../nuts/certs/truststore-stable.pem
