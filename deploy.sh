#!/bin/bash

#
# Shell script for remote deployment.
#
# Notes:
# - Yarn is assumed
# - Yarn install is assumed
# - react-scripts package is assumed
# - dotenv-cli package is assumed
# - .env.alpha.local is assumed
# - .env.beta.local is assumed
# - .env.development.local is assumed
# - .env.production.local is assumed
# - Windows host and Cygwin environment is assumed
# - UNIX target environment with SSH+rsync is assumed
#

ORIGIN_DIRECTORY="build"

# Answer to continue
echo
echo -n "Do you want to deploy on production or pre production environment?. (pro/pre/dev): "
read -r answer

if [ "$answer" = "pro" ] ; then
    echo
    echo "Production environment"
    ENVIRONMENT="build"
    SSH_DIRECTORY="[user]@[ip]:/[path]"
    SSH_PORT="22"

    echo "Not deploy"
    exit
elif [ "$answer" = "pre" ] ; then
    echo
    echo "Pre production environment"
    ENVIRONMENT="build:beta"
    SSH_DIRECTORY="[user]@[ip]:/[path]"
    SSH_PORT="22"
elif [ "$answer" = "dev" ] ; then
    echo
    echo "Development environment"
    ENVIRONMENT="build:alpha"
    SSH_DIRECTORY="[user]@[ip]:/[path]"
    SSH_PORT="22"
else
    echo
    echo "Bad selection"
    echo "Good bye!"
    exit
fi

# Execute NPM
echo
echo "Execute NPM"
if [ "$answer" = "pro" ] ; then
    yarn gulp:prod --verbose
elif [ "$answer" = "pre" ] ; then
    yarn gulp:prod --verbose
elif [ "$answer" = "dev" ] ; then
    yarn gulp:dev --verbose
fi

if [ "$?" != "0" ] ; then
    echo
    echo "ERROR: NPM install."
    rm -rf "$ORIGIN_DIRECTORY"
    exit
fi

# Execute yarn install and build
echo
echo "Execute Yarn command for transpiling"
yarn "$ENVIRONMENT" --verbose

if [ "$?" != "0" ] ; then
    echo
    echo "ERROR: Yarn install"
    rm -rf "$ORIGIN_DIRECTORY"
    exit
fi

# Copy .htaccess to build directory
echo
echo "Copy .htaccess to build directory"
cp ".htaccess" "$ORIGIN_DIRECTORY/.htaccess"

if [ "$?" != "0" ] ; then
    echo
    echo "ERROR: Copy .htaccess"
    rm -rf "$ORIGIN_DIRECTORY"
    exit
fi

# Deploy local to production environment
echo
echo "Deploying with dry-run"
rsync --delete --progress -avzh "$ORIGIN_DIRECTORY/" -e "ssh -p $SSH_PORT" "$SSH_DIRECTORY" --dry-run

if [ "$?" != "0" ] ; then
    echo
    echo "ERROR: Deploying with --dry-run."
    rm -rf "$ORIGIN_DIRECTORY"
    exit
fi

# Answer to continue
echo
echo "Deploying with dry-run successfully"
echo -n "Do you want to continue the execution without dry-run? (y/n)? "
read -r answer

if [ "$answer" != "${answer#[Yy]}" ] ; then
    echo "Yes! senseless! cross your fingers and wait"
    sleep 5
else
    rm -rf "$ORIGIN_DIRECTORY"
    echo "Good bye!"
    exit
fi

# Deploy local to production environment
echo
echo "Deploying..."
rsync --delete --progress -avzh "$ORIGIN_DIRECTORY/" -e "ssh -p $SSH_PORT" "$SSH_DIRECTORY"

if [ "$?" != "0" ] ; then
    echo
    echo "ERROR: Deploying"
    rm -rf "$ORIGIN_DIRECTORY"
    exit
fi

# Delete the temporal directory
echo
echo "Delete the temporal directory"
rm -rf "$ORIGIN_DIRECTORY"

# Finish
echo
echo "Finish"
exit
