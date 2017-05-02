#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure
echo ensure couchDB is running on your local computer

#replace installs with git repos
rm -R ../development && sudo git clone https://github.com/dscsa/development ../development
rm -R ../client && sudo git clone https://github.com/dscsa/client ../client
rm -R ../server && sudo git clone https://github.com/dscsa/server ../server
rm -R ../pouch && sudo git clone https://github.com/dscsa/pouch ../pouch
rm -R ../csv && sudo git clone https://github.com/dscsa/csv ../csv

#start the server and client
npm start

echo test that both http://localhost and http://localhost:9000 now serve the app
