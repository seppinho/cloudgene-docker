# Cloudgene - A Hadoop Workflow System  
Cloudgene is a workflow system for managing Hadoop jobs graphically. The Cloudgene website can be found [here](http://cloudgene.uibk.ac.at). A introduction to Cloudgene can be found in this [blog post](http://seppinho.github.io/cloudgene/hadoop/2015/08/27/cloudgene/).
This repository installs Hadoop and Cloudgene in a Docker Image. Choose an app and get started!


## Available apps

- WordCount 
    
    	sudo docker run --privileged -it -p 8082:8082 seppinho/cloudgene-docker run-wordcount.sh
-
 mtDNA-Server
		
		sudo docker run --privileged -it -p 8082:8082 seppinho/cloudgene-docker run-mtDNA-Server.sh