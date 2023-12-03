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

chmod +x ./.devcontainer/welcome.sh 

./.devcontainer/welcome.sh 