#!/bin/bash

# This script will pull the last version of the website in github, build the static website, and copy it to the nginx server. It will do for both the spanish and the english versions.
# I'm using absolute paths because this script will mostly be executed via ssh, and it makes things easier that way.

# Delete old repos, to ensure we have a clean copy
#rm -rf english/repo
#rm -rf spanish/repo

# Get repos, you only need this the first time

#git clone https://github.com/aetherdocks/website-hugo english/repo
#git clone -b spanish https://github.com/aetherdocks/website-hugo spanish/repo

# English website deploy

#cd /home/delta/docker/nginx/english/repo/ # go to repo directory
#hugo # build the public folder
#rsync -a --update /home/delta/docker/nginx/english/repo/public/ /home/delta/docker/nginx/english/config-en/www/ # send that to the website

# Spanish website deploy

#cd /home/delta/docker/nginx/spanish/repo/ # go to repo directory
#hugo # build the public folder
#rsync -a --update /home/delta/docker/nginx/spanish/repo/public/ /home/delta/docker/nginx/spanish/config-es/www/ # send that to the website

#echo "Deployed, enjoy"

echo "wrong machine to run this on"
