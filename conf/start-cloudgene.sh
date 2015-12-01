#!/bin/bash

CMD=${1:-"exit 0"}
if [[ "$CMD" == "--repository" ]];
then
	git clone $2 /opt/cloudgene/applications
fi

CMD=$3
if [[ "$CMD" == "--mvn" ]];
then
for d in /opt/cloudgene/applications/*;
 do 
 if [  -f $d/pom.xml ]
then
  echo "File exist."
 cd $d;mvn install
fi
done
fi

# Connect repository to Cloudgene
sudo cp /opt/cloudgene/applications/config/settings.yaml -R /opt/cloudgene/config/settings.yaml

# Start Hadoop
sudo /usr/bin/start-hadoop.sh

# Start Cloudgene
cd /opt/cloudgene; sudo ./cloudgene -u cloudgene -p 8082 -a start -j /usr/lib/jvm/java-7-oracle -d
