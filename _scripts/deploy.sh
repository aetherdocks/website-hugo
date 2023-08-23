#!/bin/bash
# This script will pull the last version of the website in github, build the static website, and copy it to the nginx server. It will do for both the spanish and the english versions.
# I'm using absolute paths because this script will mostly be executed via ssh, and it makes things easier that way.


# Get repos, you only need this the first time

# git clone https://github.com/aetherdocks/website-hugo english/repo
# git clone -b spanish https://github.com/aetherdocks/website-hugo spanish/repo

# English website deploy

#cd /home/delta/docker/nginx/english/repo/ # go to repo directory
#git pull # get the latest update
#hugo # build the public folder
#cp -R ./public/* /home/delta/docker/nginx/english/config-en/www/ # send that to the website

# Spanish website deploy

#cd /home/delta/docker/nginx/english/repo/ # go to repo directory
#git pull # get the latest update
#hugo # build the public folder
#cp -R ./public/* /home/delta/docker/nginx/english/config-en/www/ # send that to the website

#echo "Deployed, enjoy"


# I'm keeping this script here just in case, it's executed in the server

echo "wrong machine to run this on"
