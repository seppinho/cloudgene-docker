#!/bin/bash
# Start Hadoop
sudo /usr/bin/run-hadoop-initial.sh

# >>> user space starts here <<<<

# Run Wordcount App
sudo cp /opt/cloudgene/apps/wordcount/config/settings.yaml -R /opt/cloudgene/config/settings.yaml
cd /opt/cloudgene; sudo ./cloudgene -u cloudgene -a start -j /usr/lib/jvm/java-7-oracle