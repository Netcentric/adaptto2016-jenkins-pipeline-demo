
# Demo adaptTo(2016)

## Structure

jenkins - Jenkins container
proxy - Docker local repository container

## How to

### Prepare Jenkins Credentials
Multibranch is working based on Git observation. To enable this, you need to add your credentials for Jenkins:

In `jenkins/JENKINS_HOME/credentials.xml` update the following with your information

	<username>${your_github_user}</username>
	<password>${your_github_personal_access_token}</password>

	<passphrase>${key_passphrase}</passphrase>

Replace `jenkins/id_rsa` by your git personal key. This key will be copied into the Docker container.

### Build and start Jenkins 
Start docker container as

    $ docker-compose build
    $ docker-compose up
 
Port `8080` will be used your localhost.

## Enjoy

PRs to https://github.com/Netcentric/adaptto2016-slingshot will be created as Pipeline jobs
