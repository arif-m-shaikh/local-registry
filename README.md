# Local Docker Registry

## Docker Installation
### install.sh
This script is used for installation of docker on ubuntu machine

### uninstall.sh
This script is used for removal of docker on ubuntu machine

## Certificate Creation
### 1.create-ca.sh
This script is used for creation of Certifying Authority that is used for signing the server certificate. It uses the openssl-ca.cnf file for the domain name and other configurations

### 2.create-servercert.sh
This script is used for creation of Server Certificate that is used for as a domain certificate for TLS connections. It uses the openssl-ca2.cnf and openssl-server.cnf file for the domain name and other configurations

## Local Registry (Basic Authentication) Installation
### 1.init.sh
This script is used for copying the certificate into local directory and converting it to CRT format that is used for local registry connection.

### 2.registry-auth.sh
This script is used for creation of the username and password database which is used by the registry for basic authentication. 
Note: Password is encrypted.

Current username: test with password: best is used. If required use this script if you want to change the username and/or password or wish to add more user for local authentication.

### 3.install-reg.sh
This script is used for local registry installation. It uses the certificate files created in script folder 2 and auth file created in script 2 of this folder.

### 4.test-reg.sh
This script is used to test the local registry installation. It download the hello-world container image. Change the tag name. Login to local registry and store the image into local registry.

It then verify the images by pulling from the local registry.

