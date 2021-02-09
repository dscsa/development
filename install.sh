#!/bin/bash
# Preinstall script for dscsa/development to setup the proper folder structure

#replace installs with git repos.  Since we are in development we need to leave before deleting
cd ../
rm -R development && sudo git clone https://github.com/dscsa/development
rm -R client && sudo git clone https://github.com/dscsa/client
rm -R server && sudo git clone https://github.com/dscsa/server
rm -R pouch && sudo git clone https://github.com/dscsa/pouch
rm -R csv && sudo git clone https://github.com/dscsa/csv

#installing with bash put permission to root only, update to all users
# sudo chmod -R 777 ./node_modules

#provide npm run server, npm run client, and npm test to parent directory
cp development/npm.json ../package.json

# downloading protractor doesn't update automatically
# sudo ./protractor/node_modules/webdriver-manager/bin/webdriver-manager update
