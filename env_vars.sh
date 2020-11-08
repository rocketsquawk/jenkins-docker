#!/bin/bash
#
# CHANGE THESE TO SUIT YOUR NEEDS!
#
IMAGE_NAME=rocketsquawk/jenkins-docker
CONTAINER_NAME=jenkins-docker
#
# SUPER IMPORTANT!
#   HOST_DOCKER_UID: UID of user in docker group *ON THE HOST* 
#   HOST_DOCKER_GID: GID of docker group *ON THE HOST*
#
# To find these values, use the id command on the host
#  (as a user with in the docker group). E.g.:
#   rocket@ubuntu:~$ id
#   uid=1000(rocket) groups=1000(rocket),1001(docker)
#
HOST_DOCKER_UID=1000
HOST_DOCKER_GID=1001
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
