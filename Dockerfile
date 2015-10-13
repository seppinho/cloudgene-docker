FROM seppinho/cdh5-hadoop-mrv1

MAINTAINER Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at>

#Root Dir
WORKDIR /

# install jsvc to start a process as a daemon
RUN sudo apt-get install jsvc -y

# Get Cloudgene currently as a jar
WORKDIR /opt
RUN wget http://cloudgene.uibk.ac.at/downloads/cloudgene-docker/cloudgene-1.11.0-assembly.tar.gz -O cloudgene.tar.gz
RUN mkdir cloudgene
RUN tar xvfz cloudgene.tar.gz -C cloudgene
RUN sudo chmod +x /opt/cloudgene/cloudgene