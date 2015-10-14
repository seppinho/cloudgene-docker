#!/bin/bash

# start HDFS
for x in `cd /etc/init.d ; ls hadoop-hdfs-*` ; do sudo service $x start ; done

# init HDFS
sudo /usr/bin/init-hdfs.sh

# start MapReduce service with adapted configuration
sudo /usr/bin/adapt-mapred-config.sh

# start Jobtracker and Tasktracker
for x in `cd /etc/init.d ; ls hadoop-0.20-mapreduce-*` ; do sudo service $x start ; done