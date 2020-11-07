#!/bin/bash
#
# You only need to run this script ONCE!
# Whenever you want to start Jenkins in the future,
# you just need to run `docker run jenkins-docker`
# (or whatever you set CONTAINER_NAME to before
# running this script).
#
# CHANGE THESE TO SUIT YOUR NEEDS!
#
IMAGE_NAME=rocketsquawk/jenkins-docker
CONTAINER_NAME=jenkins-docker
#
# Port to map for both container and host.
# Jenkins UI will be exposed here.
#
JENKINS_UI_PORT=8080 
#
# URL can be your workstation LAN IP if you want others to have access,
# BUT HERE BE DRAGONS!!! Jenkins is completely unsecured by default!
#
JENKINS_UI_BASE_URL=localhost
