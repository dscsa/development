#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure
echo ensure couchDB is running on your local computer

mv node_modules/development/npm.json ../../package.json

#replace installs with git repos
cd ../
rm -R development && sudo git clone https://github.com/dscsa/development
rm -R client && sudo git clone https://github.com/dscsa/client
rm -R server && sudo git clone https://github.com/dscsa/server
rm -R pouch && sudo git clone https://github.com/dscsa/pouch
rm -R csv && sudo git clone https://github.com/dscsa/csv

#start the server and client
cd ../
npm start

echo test that both http://localhost and http://localhost:9000 now serve the app
