#!/bin/bash
set +x

function bold {
    tput bold
    echo -n "$@"
    tput sgr0  # This turns off all attributes
}

# Define the Cypress cache directory
CYPRESS_CACHE_DIR="/workspaces/Tecumseh-Boilerplate/.cypress-caching"

# Check if the Cypress cache directory exists
if [ -d "$CYPRESS_CACHE_DIR" ]; then
    echo "Cypress cache found. Opening Cypress..."
    echo "The Cypress GUI can be found at: https://${CODESPACE_NAME}-6080.app.github.dev/?autoconnect=true&password=vscode"
    npx cypress open
else
    echo "Cypress cache not found. Something may have gone wrong during Tecumseh activation."
fi