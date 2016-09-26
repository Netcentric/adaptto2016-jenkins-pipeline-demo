#!/bin/bash

sudo chmod a+rw /var/run/docker.sock


# Remove the base workflow-demo "cd" job
rm -rf /usr/share/jenkins/ref/jobs/cd /var/jenkins_home/jobs/cd

# Create known_hosts
mkdir /root/.ssh
touch /root/.ssh/known_hosts
# Add github (or your git server) fingerprint to known hosts
ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

/usr/local/bin/run.sh
