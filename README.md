## Cloudgene - A Hadoop Workflow System

### Introduction to Cloudgene
This repository provides a ready-to-use Docker image for Cloudgene and installs all requirements, especially Apache Hadoop (CDH5).
[Cloudgene](http://cloudgene.uibk.ac.at) is a workflow system for managing Hadoop jobs graphically. Hadoop workflows (or simple "apps") can be connected to Cloudgene. The idea of Cloudgene is summarized [here](http://seppinho.github.io/cloudgene/hadoop/2015/08/27/cloudgene/).

### Connecting Apps to Cloudgene
When starting a new Cloudgene Docker container, a repository with apps need to be specified. By default, we connect our [repository](https://github.com/seppinho/cloudgene-apps-docker) including the following apps:

- WordCount: The "Hello World" of Hadoop 
- mtDNA-Server: A contamination and heteroplasmy pipeline, available also as a [service](http://mtdna-server.uibk.ac.at). 
- Michigan Imputation Server: Currently only available as a [service](https://imputationserver.sph.umich.edu/), but soon on Docker!
		
### Pull & Start Cloudgene	

	docker pull seppinho/cloudgene-docker	
	
### Start Cloudgene with remote repository

	sudo docker run --privileged -it -p 8082:8082 -p 50030:50030 -p 50060:50060  seppinho/cloudgene-docker start-cloudgene.sh --repository https://github.com/seppinho/cloudgene-apps-docker
	
### Start Cloudgene with local repository

	sudo docker run --privileged -it -p 8082:8082 -p 50030:50030 -p 50060:50060 -v <local-app-repository>:/opt/cloudgene/apps/ seppinho/cloudgene-docker start-cloudgene.sh
