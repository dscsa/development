#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure
echo ensure couchDB is running on your local computer

 #install the development environment
sudo npm install dscsa/development

#replace symlinks with git repos
sudo rm -R client && sudo git clone https://github.com/dscsa/client
sudo rm -R server && sudo git clone https://github.com/dscsa/server
sudo rm -R pouch && sudo git clone https://github.com/dscsa/pouch
sudo rm -R csv && sudo git clone https://github.com/dscsa/csv

#start the server and client
sudo npm start

echo test that both http://localhost and http://localhost:9000 now serve the app
