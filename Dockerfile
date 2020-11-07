#
# Use latest by default
# "jenkins/jenkins:lts" is long term support
#
FROM jenkins/jenkins
#FROM jenkins/jenkins:lts
#
# Disable setup wizard on Jenkins first startup
# and specify Config as Code 
#
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml
#
# Install typical plugins and copy CasC
#
COPY config/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
COPY config/casc.yaml /var/jenkins_home/casc.yaml
#
# Need root for apt operations
#
USER root
#
# Install latest Docker CE binaries and add user `jenkins` to the docker group
#
RUN apt-get update && \
    apt-get -y --no-install-recommends install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > \
      /tmp/dkey; \
      apt-key add /tmp/dkey && \
      add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
   apt-get update && \
   apt-get -y --no-install-recommends install docker-ce && \
   apt-get clean && \
   usermod -aG docker jenkins
#
# Back to the jenkins user
#
USER jenkins
