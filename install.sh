#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure
echo ensure couchDB is running on your local computer

#replace installs with git repos
cd ../
sudo git clone https://github.com/dscsa/development
sudo git clone https://github.com/dscsa/client
sudo git clone https://github.com/dscsa/server
sudo git clone https://github.com/dscsa/pouch
sudo git clone https://github.com/dscsa/csv

#install scripts so npm start, npm run server, npm run client, and npm test all work
ln -s development/package.json ../package.json

echo test that both http://localhost and http://localhost:9000 now serve the app
