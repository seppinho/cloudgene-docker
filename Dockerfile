FROM seppinho/cdh5-hadoop-mrv1

MAINTAINER Cloudgene-Team: Sebastian Schoenherr <sebastian.schoenherr@i-med.ac.at> and Lukas Forer <lukas.forer@i-med.ac.at>

#Install Prerequistes
RUN echo "deb http://lib.stat.cmu.edu/R/CRAN/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
RUN gpg --keyserver keyserver.ubuntu.com --recv-key 51716619E084DAB9

# install requirements
RUN sudo apt-get update -y
RUN sudo apt-get install jsvc git r-base maven -y --force-yes

# Install R Packages
COPY conf/r-packages.R /usr/bin/r-packages.R
RUN sudo R CMD BATCH /usr/bin/r-packages.R

# Get Cloudgene [currently as a tar.gz, later from Github]
ENV CLOUDGENE_VERSION cloudgene-1.11.0
RUN wget http://cloudgene.uibk.ac.at/downloads/cloudgene-docker/$CLOUDGENE_VERSION-assembly.tar.gz -O /opt/cloudgene.tar.gz

# Create structure and set permissions
RUN mkdir /opt/cloudgene
RUN mkdir /opt/cloudgene/applications
RUN tar xvfz /opt/cloudgene.tar.gz -C /opt/cloudgene
RUN sudo rm /opt/cloudgene.tar.gz
RUN sudo chown cloudgene -R /opt/cloudgene

# Make the daemon executable
RUN sudo chmod +x /opt/cloudgene/cloudgene

# copy scripts
ADD conf /usr/bin/
RUN sudo chmod +x /usr/bin/*


ENTRYPOINT ["/usr/bin/start-cloudgene.sh"]

