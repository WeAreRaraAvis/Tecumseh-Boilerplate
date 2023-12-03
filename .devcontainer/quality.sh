#!/bin/bash
set +x
function bold {
    tput bold
    echo -n "$@"
    # bold can't be turned off by itself so this
    # turns off all attributes
    tput sgr0
}

# Define the Cypress cache directory
CYPRESS_CACHE_DIR="/workspaces/Tecumseh-Boilerplate/.cypress-caching"

# Check if the Cypress cache directory exists
if [ -d "$CYPRESS_CACHE_DIR" ]; then
    echo "Cypress cache found. Opening Cypress..."
    npx cypress open
else
    echo "Cypress cache not found. Installing Cypress..."
    npx cypress install
    clear
    echo " "
    echo " "
    echo " "
    cat ./.devcontainer/bird.txt 
    echo " "
    echo " "
    echo " "
    echo "============= $(bold Cypress Installation Completed. Please re-enter 'quality' to start using Cypress.)"
    echo -e "\033[0;33mNote: To access the cypress dashboard, you will need to navigate to the URL associated with port 6080 in the 'ports' tab.\033[0m"
    echo -e "\033[0;33mNote: When prompted, the password is 'vscode'\033[0m"
    echo " "
fi