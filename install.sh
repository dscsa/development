#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure
echo installation almost complete...
echo ensure couchDB is running on your local computer,
echo then run 'sudo npm run server' and 'npm run client'
echo sudo is necessary for the server to bind to port 80
echo test both http://localhost and http://localhost:9000 work

#replace installs with git repos.  Since we are in development we need to leave before deleting
cd ../
rm -R development && sudo git clone https://github.com/dscsa/development
rm -R client && sudo git clone https://github.com/dscsa/client
rm -R server && sudo git clone https://github.com/dscsa/server
rm -R pouch && sudo git clone https://github.com/dscsa/pouch
rm -R csv && sudo git clone https://github.com/dscsa/csv

#go back to development folder so npm run server, npm run client, and npm test all work
cd development
