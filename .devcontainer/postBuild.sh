#!/bin/bash
set +ex

draw_progress_bar() {
    local progress=$1
    local total=$2
    local filled=$(( progress * 40 / total ))
    local empty=$(( 40 - filled ))

    printf -v bar '%*s' "$filled"
    bar=${bar// /█}
    printf -v empty_bar '%*s' "$empty"
    empty_bar=${empty_bar// /-}

    printf "\rProgress: [%s%s]" "$bar" "$empty_bar"
}

total_steps=11
current_step=0

update_progress() {
    draw_progress_bar $((current_step++)) $total_steps
}

clear
echo " "
echo "======== Configuring Tecumseh ========"
update_progress
ddev config global --omit-containers=ddev-router &> /dev/null

update_progress
ddev debug download-images &> /dev/null

update_progress
ddev poweroff &> /dev/null

update_progress
ddev start -y &> /dev/null

update_progress
ddev composer install &> /dev/null

update_progress
ddev npm install &> /dev/null

# To Pull Existing Database -- TODO

# install craft via CLI 
update_progress
ddev craft install/craft \
  --interactive=0 \
  --username=RaraAdmin \
  --password=MyDaedalus2023^ \
  --email=creative@raraavis.design \
  --site-name=TecumsehBoilerplate &> /dev/null

update_progress
chmod +x ./.devcontainer/welcome.sh &> /dev/null

update_progress
./.devcontainer/welcome.sh &> /dev/null

update_progress
npx cypress install &> /dev/null

# Final step
draw_progress_bar $total_steps $total_steps

chmod +x ./.devcontainer/welcome.sh 

./.devcontainer/welcome.sh 