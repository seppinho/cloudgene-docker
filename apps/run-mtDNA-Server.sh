#!/bin/bash
# Start Hadoop
sudo /usr/bin/start-hadoop.sh

# Run mtDNA-Server App
sudo cp /opt/cloudgene/apps/mtdna-server/config/settings.yaml -R /opt/cloudgene/config/settings.yaml
cd /opt/cloudgene; sudo ./cloudgene -u cloudgene -a start -j /usr/lib/jvm/java-7-oracle -d