#!/bin/bash

# Define the Cypress cache directory
CYPRESS_CACHE_DIR="/workspaces/Tecumseh-Boilerplate/.cypress-caching"

# Check if the Cypress cache directory exists
if [ -d "$CYPRESS_CACHE_DIR" ]; then
    echo "Cypress cache found. Opening Cypress..."
    npx cypress open
else
    echo "Cypress cache not found. Installing Cypress..."
    npx cypress install
    echo "Cypress Installation Completed. Please re-enter 'quality' to start Cypress on this container."
fi