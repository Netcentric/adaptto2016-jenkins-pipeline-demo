##
# The MIT License
#
# Copyright (c) 2015, CloudBees, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
##

FROM jenkinsci/workflow-demo:2.3

USER root

RUN apt-get update
RUN apt-get install -y sudo dos2unix
RUN adduser jenkins sudo
RUN echo 'Defaults !authenticate' >> /etc/sudoers

# Minimum for docker-workflow. Docker server does not accept a client newer than itself (older is OK).
RUN wget -O /usr/bin/docker --no-check-certificate https://get.docker.com/builds/Linux/x86_64/docker-1.4.0
RUN chmod a+x /usr/bin/docker

RUN git config --global user.email "change-me@sling.org" && git config --global user.name "AdaptTo Sling Pipeline Demo"

# Run commands identical to those in Pipeline script to warm up the cache:

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN dos2unix /usr/share/jenkins/plugins.txt
RUN cd /usr/share/jenkins/ref/plugins/; \
  install-plugins.sh `cat /usr/share/jenkins/plugins.txt`

ADD JENKINS_HOME /usr/share/jenkins/ref
RUN mkdir /root/.ssh
COPY id_rsa /root/.ssh/id_rsa
RUN chmod 600 /root/.ssh/id_rsa

COPY run-demo.sh /usr/local/bin/run-demo.sh
COPY run.sh /usr/local/bin/run.sh
RUN chmod a+x /usr/local/bin/run.sh

CMD /usr/local/bin/run-demo.sh

