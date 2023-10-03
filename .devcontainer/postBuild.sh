#!/bin/bash
set -ex

echo "======== DDEV Configuration ========"
# This file is called in three scenarios:
# 1. fresh creation of devcontainer
# 2. rebuild
# 3. full rebuild

# ddev default commands
# see: https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/#github-codespaces

# https://github.com/ddev/ddev/pull/5290#issuecomment-1689024764
ddev config global --omit-containers=ddev-router

# download images beforehand
ddev debug download-images

# avoid errors on rebuilds
ddev poweroff

# start ddev project
ddev start -y

# DDEV will automatically set the codespaces preview URL in .env. 
# If this is not working in future, you can use this snippet for replacement:
# ddev exec 'sed -i "/PRIMARY_SITE_URL=/c APP_URL=$DDEV_PRIMARY_URL" .env'

echo "======== Installing Project Specific Dependencies Within DDEV Container ========"
# normal project setup
ddev composer install 
ddev npm install

# To Pull Existing Database -- TODO

# install craft via CLI
ddev craft install/craft \
  --interactive=0 \
  --username=RaraAdmin \
  --password=MyDaedalus2023^ \
  --email=creative@raraavis.design \
  --site-name=TecumsehBoilerplate

set +x
function bold {
    tput bold
    echo -n "$@"
    # bold can't be turned off by itself so this
    # turns off all attributes
    tput sgr0
}
clear 
chmod +x ./.devcontainer/bird.txt
echo " "
echo " "
echo " "
cat ./.devcontainer/bird.txt 
echo " "
echo " "
echo " "
echo "============= $(bold Tecumseh Boilerplate Configuration Complete) ========"
echo "============= As a first step, please change the login credentials within the Craft CMS control panel relative to the project you're working on."
echo "============= From there, configure your project within our Servd account accordingly. Please note, once you've pushed up your changes - you will also need to do"
echo "============= a database dump and import/sync it in Servd's control panel. If you do not, your project URL will claim that Craft CMS is not installed."
echo " "
