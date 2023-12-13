echo "==========================> Copying certificates"
mkdir -p certs
cp ../2.create-certificate/certificates/cacert.pem ./certs/
cp ../2.create-certificate/certificates/cakey.pem ./certs/

cp ../2.create-certificate/certificates/servercert.pem ./certs/
cp ../2.create-certificate/certificates/serverkey.pem ./certs/

echo "==========================> Convert Certificates"
openssl x509 -outform der -in ./certs/servercert.pem -out ./certs/servercert.crt
openssl x509 -in ./certs/servercert.crt -text -noout

echo "==========================> Init....DONE"