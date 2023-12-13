mkdir -p auth
docker run --entrypoint htpasswd registry:2.7.0 -Bbn test best > ./auth/htpasswd
cat ./auth/htpasswd