echo "==========================> Install Certificates"
mkdir -p /etc/docker/certs.d/localhost:5000 
cp ./certs/servercert.crt /etc/docker/certs.d/localhost:5000/ca.crt
systemctl restart docker
systemctl status docker | cat

echo "==========================> Install Docker Registry"
mkdir -p registry-data
docker run -d -p 5000:5000 --name registry \
  --restart unless-stopped \
  -v $(pwd)/registry-data:/var/lib/registry -v $(pwd)/certs:/certs \
  -v "$(pwd)"/auth:/auth \
  -e "REGISTRY_HTTP_TLS_CERTIFICATE=/certs/servercert.pem" \
  -e "REGISTRY_HTTP_TLS_KEY=/certs/serverkey.pem" \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
  registry

curl --insecure --cacert ./certs/servercert.pem --user test:best https://localhost:5000/v2/_catalog

echo "==========================> Install Registry....DONE"