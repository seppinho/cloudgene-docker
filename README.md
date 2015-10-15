# Cloudgene - A Hadoop Workflow System on Docker 

## Introduction to Cloudgene
This repository provides a ready-to-use Docker image for Cloudgene and installs all requirements, especially Apache Hadoop (CDH5).
[Cloudgene](http://cloudgene.uibk.ac.at) is a workflow system for managing Hadoop jobs graphically. Hadoop workflows (or simple "apps") can be connected to Cloudgene. The idea of Cloudgene is summarized [here](http://seppinho.github.io/cloudgene/hadoop/2015/08/27/cloudgene/).

## Connecting apps to Cloudgene
When starting a new Cloudgene Docker container, a repository with apps need to be specified. By default, we connect our (repository)[https://github.com/seppinho/cloudgene-apps-docker] including the following apps:

- WordCount: The "Hello World" of Hadoop 
- mtDNA-Server: A contamination and heteroplasmy pipeline, available also as a (service)[http://mtdna-server.uibk.ac.at]
		
## Start Cloudgene

	sudo docker run --privileged -it -p 8082:8082 seppinho/cloudgene-docker --repository https://github.com/seppinho/cloudgene-apps-docker