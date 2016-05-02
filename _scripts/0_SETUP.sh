#!/bin/bash
set -x

####################################################
#
# TRAVIS CI SETTINGS
#
####################################################

# Branch you want to deploy:
JTS_DBRANCH="master"

# Server IP:
JTS_SERV_IP="159.203.216.201"

# Server deploy path:
JTS_SERV_DP="/var/www/shadowlink-site"

# Username for Travis deploy:
JTS_TRV_USR="deploy"

# Filename of Travis key:
JTS_KEYNAME="shadowlink_deploy"

# Gmail user (DO NOT ADD '@gmail.com'):
JTS_GML_USE="ckreon"

####################################################
#
# You need to generate and encrypt an SSH key for
# Travis to connect to your server with:
# https://docs.travis-ci.com/user/encrypting-files/
#
# Update the 1_install.sh file, replacing the '@@@'
# symbols with the proper hash values.
#
####################################################