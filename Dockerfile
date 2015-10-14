FROM seppinho/cdh5-hadoop-mrv1

MAINTAINER Cloudgene-Team: Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at> and Lukas Forer <lukas.forer@i-med.ac.at>

#Change to root dir
WORKDIR /

# install git and jsvc (to start a process as a daemon process)
RUN sudo apt-get install jsvc git -y


# copy scripts for executing apps
ADD apps /usr/bin/
RUN sudo chmod +x /usr/bin/*

# Get Cloudgene [currently as a JAR]
RUN wget http://cloudgene.uibk.ac.at/downloads/cloudgene-docker/cloudgene-1.11.0-assembly.tar.gz -O /opt/cloudgene.tar.gz

# Create structure
RUN mkdir /opt/cloudgene
RUN mkdir /opt/cloudgene/apps
RUN tar xvfz /opt/cloudgene.tar.gz -C /opt/cloudgene
RUN sudo rm /opt/cloudgene.tar.gz

# Make the daemon executable
RUN sudo chmod +x /opt/cloudgene/cloudgene

## Clone all Cloudgene apps
RUN git clone https://github.com/seppinho/cloudgene-apps-docker.git /opt/cloudgene/apps

RUN sudo chown cloudgene -R /opt/cloudgene