#!/bin/bash

CMD=${1:-"exit 0"}
if [[ "$CMD" == "--repository" ]];
then
	cd /opt/cloudgene/applications;git clone $2
	# Connect repository to Cloudgene
fi

# Compile
for d in /opt/cloudgene/applications/*;
 do 
 if [  -f $d/pom.xml ]
then
  echo "File exist."
 cd $d;mvn clean install -Dmaven.test.skip=true
fi
done


# Start Hadoop
sudo /usr/bin/start-hadoop.sh

# Execute init.sh
for d in /opt/cloudgene/applications/*;
 do
 if [  -f $d/files/config/init.sh ]
then
  echo "File exist."
 cd $d; sh $d/files/config/init.sh
fi
done

# Start Cloudgene
cd /opt/cloudgene; sudo ./cloudgene -u cloudgene -p 8082 -a start -j /usr/lib/jvm/java-8-oracle

echo ""
echo "Michigan Imputation Server on Docker is ready!"
echo "To start your imputation jobs open the following URL in your browser: http://localhost:8082 or http://<your-ipadress>:8082"
# End with bash
/bin/bash
