# Jenkins with Docker
## What is this?
This is a Dockerfile and set of helper scripts to get Jenkins CI server with a Docker-in-Docker configuration up and running on your local workstation with a minimum of hassle (and security!) With this configuration, you can easily use Docker images as an execution environment in your Pipelines. For example:
```
pipeline {
    agent {
        docker { image 'node:alpine' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
```
This allows you to use any Docker container for build steps or pipelines without needing to install dependencies on your workstation or in a custom Jenkins image.

## What does "minimum of hassle (and security)" mean?
It means:
* The Jenkins setup wizard is skipped.
* NO SECURITY IS ENABLED! Great for use on your local workstation, but NOT suitable if you want to expose this to a LAN or WAN.
* A common set of plugins is installed by default, but you can easily customise them be editing `config/plugins.txt`.
* The Code as Configuration plugin is enabled and a customisable basic config is provided.
* HTTP (not HTTPS).

## How to use this repo
1. Clone the repo.
2. Edit `env_vars.sh` to your liking. 
3. Run `build_and start_jenkins.sh` like so:
```
$ sh ./build_and start_jenkins.sh
```
4. Access the Jenkins UI at http://locahost:8080 (unless you changed the vars in `env_vars.sh`)

## How do I tweak stuff?
After the first run of `build_and start_jenkins.sh`, a persistent volume is created for the Jenkins home dir (where all build and job config data is stored). So, to add or delete plugins or change any other config, you can use the Jenkins UI as normal. Any changes you make will be persisted across restarts of the container. However, if you ever delete the volume, all your changes will be lost (along with any jobs and builds).

If you want to bake changes into the image, just run `cleanup_jenkins.sh` to stop and remove the container. Then, hack away; the scripts are fairly-well commented. To change the list of default plugins, simply edit `config/plugins.txt` and rebuild the image.

## Prerequisites
Ensure you've got a recent (18.09+) Docker Desktop or Docker Engine installation.

## Credit and next steps
Most of this repo comes from the article at https://www.digitalocean.com/community/tutorials/how-to-automate-jenkins-setup-with-docker-and-jenkins-configuration-as-code. Read the article if you want to learn how to automate a user and build credentials to further secure your container.