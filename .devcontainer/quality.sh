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
    clear
    echo " "

    # Construct the URL
    URL="https://${CODESPACE_NAME}-6080.app.github.dev/?autoconnect=true&password=vscode"

    # Output the entire URL in bold
    bold "The Cypress GUI can be found at: $URL"

    npx cypress open &> /dev/null
    echo " "
else
    echo "Cypress cache not found. Verify that Tecumseh activation was successful."
fi