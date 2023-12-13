#!/bin/bash
set -x

rm -rf certificates
mkdir certificates
cd certificates

echo "Server CA Certificate ===================> Creating the CA cert"
openssl req -x509 -batch -config ../openssl-ca.cnf -newkey rsa:4096 -sha256 -nodes -out ./cacert.pem -outform PEM

echo "Server CA Certificate ===================> Verifying the CA cert"
openssl x509 -in ./cacert.pem -text -noout

echo "Server CA Certificate ===================> Checking the purpose of CA cert"
openssl x509  -purpose -in ./cacert.pem -inform PEM
