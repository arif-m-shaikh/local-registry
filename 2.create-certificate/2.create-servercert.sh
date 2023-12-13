#!/bin/bash
set -x

cd certificates
touch index.txt
echo "01" > serial.txt

echo "Server CA Certificate ===================> Creating the Server Signing Request"
openssl req -batch -config ../openssl-server.cnf -newkey rsa:2048 -sha256 -nodes -out ./servercert.csr -outform PEM

echo "Server CA Certificate ===================> Verifying the Server Signing Request"
openssl req -text -noout -verify -in ./servercert.csr

echo "Server CA Certificate ===================> Creating the Server Certificate using Server Signing Request"
openssl ca -batch -config ../openssl-ca2.cnf -policy signing_policy -extensions signing_req -out ./servercert.pem -infiles ./servercert.csr

echo "Server CA Certificate ===================> Verifying the Server Certificate"
openssl x509 -in ./servercert.pem -text -noout

