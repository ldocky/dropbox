FROM ubuntu:focal
MAINTAINER ldocky 


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget psmisc curl libatomic1 libglib2.0-0 libglapi-mesa  libxdamage1 libxfixes3 libxcb-glx0 libxcb-dri2-0 libxcb-dri3-0 libxcb-present0 libxcb-sync1 libxshmfence1 libxxf86vm1
RUN wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf /tmp/dropbox-dist
RUN wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /temp/dropbox-cli 


ENTRYPOINT ["/temp/dropbox-dist/dropboxd"] 
