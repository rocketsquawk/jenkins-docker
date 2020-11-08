#!/bin/bash
. ./env_vars.sh;
#
# You only need to run this script ONCE!
# Whenever you want to start Jenkins in the future,
# you just need to run `docker run jenkins-docker`
# (or whatever you set CONTAINER_NAME to before
# running this script).
#
# Comment/uncomment to choose buildkit or old-style build
#
#docker build -t $IMAGE_NAME --build-arg HOST_DOCKER_UID=$HOST_DOCKER_UID --build-arg HOST_DOCKER_GID=$HOST_DOCKER_GID .
DOCKER_BUILDKIT=1 docker build -t $IMAGE_NAME --build-arg HOST_DOCKER_UID=$HOST_DOCKER_UID --build-arg HOST_DOCKER_GID=$HOST_DOCKER_GID .
#
# Run container for first time and
#   - Create jenkins_home Docker volume for Jenkins data;
#   - Give Jenkins access to host Docker engine;
#   - Set container to restart unless explicitly stopped.
#
docker run -d -p $JENKINS_UI_PORT:$JENKINS_UI_PORT -p 50000:50000 \
    --name $CONTAINER_NAME \
    -v jenkins_home:/var/jenkins_home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --restart unless-stopped \
    --env JENKINS_URL=http://$JENKINS_UI_BASE_URL:$JENKINS_UI_PORT/ \
    $IMAGE_NAME
    
