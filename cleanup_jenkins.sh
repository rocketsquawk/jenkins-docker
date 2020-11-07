#!/bin/bash
. ./env_vars.sh;
#
# By default, this script will remove all traces
# of the container and image, but leave the jenkins_home
# volume. Useful when you just want to tweak casc.yaml or
# plugins.txt in the image (but keep all build and config data). 
#
docker stop $CONTAINER_NAME
docker container rm $CONTAINER_NAME
docker rmi $IMAGE_NAME
#
# THIS LINE WILL DELETE ALL DATA IN JENKINS_HOME DIR!
# Uncomment if you want to start afresh.
# E.g. When you just want to tweak casc.yaml or plugins.txt
# (but keep all build and config data)
#
#docker volume rm jenkins_home
