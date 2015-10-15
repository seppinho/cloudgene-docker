#!/bin/bash

CMD=${1:-"exit 0"}
if [[ "$CMD" == "--repository" ]];
then
	git clone $2 /opt/cloudgene/applications
else
	echo "Currently only the --repository flag is implemented!"
fi

# Connect repository to Cloudgene
sudo cp /opt/cloudgene/applications/config/settings.yaml -R /opt/cloudgene/config/settings.yaml

# Start Hadoop
sudo /usr/bin/start-hadoop.sh

# Start Cloudgene
cd /opt/cloudgene; sudo ./cloudgene -u cloudgene -p 8082 -a start -j /usr/lib/jvm/java-7-oracle -d