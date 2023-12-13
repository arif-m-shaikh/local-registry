echo "==========================> Download and check"
docker pull hello-world
docker tag hello-world localhost:5000/hello-world
docker images
docker login localhost:5000 --username='test' --password-stdin <<<'best'
docker push localhost:5000/hello-world
curl --insecure --cacert ./certs/servercert.pem --user test:best https://localhost:5000/v2/_catalog

echo "==========================> Remove downloaded images"
docker rmi hello-world
docker rmi localhost:5000/hello-world
docker login localhost:5000 --username='test' --password-stdin <<<'best'
docker pull localhost:5000/hello-world
docker images
docker rmi localhost:5000/hello-world

echo "==========================> Test Registry....DONE"