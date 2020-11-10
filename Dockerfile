FROM ubuntu:focal
MAINTAINER ldocky 


ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /tmp/dropbox-dist && mkdir /tmp/dropbox-cli
RUN apt-get update && apt-get install -y wget psmisc curl libatomic1 libglib2.0-0 libglapi-mesa  libxdamage1 libxfixes3 libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present0 libxcb-sync1 libxshmfence1 libxxf86vm1
RUN wget -O /tmp/dropbox-dist/dropbox.tar.gz "http://www.dropbox.com/download/?plat=lnx.x86_64"
RUN wget -O /tmp/dropbox-cli/dropbox.py "https://www.dropbox.com/download?dl=packages/dropbox.py"
RUN cd /tmp/dropbox-dist && tar -xvzf dropbox.tar.gz
RUN rm /tmp/dropbox-dist/dropbox.tar.gz


VOLUME /tmp/dropbox-dist/.dropbox
VOLUME /tmp/dropbox-dist/Dropbox

ENTRYPOINT ["/temp/dropbox-dist/dropboxd"] 
