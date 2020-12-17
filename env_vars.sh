#!/bin/bash
#  ___ __  __ ____   ___  ____ _____  _    _   _ _____ _ 
# |_ _|  \/  |  _ \ / _ \|  _ \_   _|/ \  | \ | |_   _| |
#  | || |\/| | |_) | | | | |_) || | / _ \ |  \| | | | | |
#  | || |  | |  __/| |_| |  _ < | |/ ___ \| |\  | | | |_|
# |___|_|  |_|_|    \___/|_| \_\|_/_/   \_\_| \_| |_| (_)
#
# SUPER IMPORTANT!
#   HOST_DOCKER_UID: UID of user in docker group *ON THE HOST* 
#   HOST_DOCKER_GID: GID of docker group *ON THE HOST*
#
# To find these values, use the id command on the host
# (as a user that's been added to the docker group). E.g.:
#   rocket@ubuntu:~$ id
#   uid=1000(rocket) groups=1000(rocket),1001(docker)
#
HOST_DOCKER_UID=1000
HOST_DOCKER_GID=998
#
# Change these to your liking.
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
JENKINS_UI_BASE_URL=0.0.0.0
