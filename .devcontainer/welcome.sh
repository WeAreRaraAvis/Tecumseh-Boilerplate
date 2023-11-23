set +x
function bold {
    tput bold
    echo -n "$@"
    # bold can't be turned off by itself so this
    # turns off all attributes
    tput sgr0
}
clear 
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
