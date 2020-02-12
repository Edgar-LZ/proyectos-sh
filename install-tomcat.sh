#!/bin/bash
TOMCAT=apache-tomcat-9.0.30
TOMCAT_FILE=$TOMCAT.tar.gz
TOMCAT_URL=https://www-eu.apache.org/dist/tomcat/tomcat-9/v9.0.30/bin/$TOMCAT_FILE
TOMCAT_START=$TOMCAT/bin/startup.sh
TOMCAT_CONFIG=$TOMCAT/conf/
PORT=8005
PORT2=9090
CURRENT=$PWD
cd $HOME

#$(nc -vz localhost $PORT > output.txt 2>&1)

#REQUIRED_OUTPUT="localhost [127.0.0.1] $PORT (http-alt) open"

echo "output: $(< output.txt)"
echo $REQUIRED_OUTPUT

if [ ! -d "$TOMCAT" ]
then
	echo "$TOMCAT DOES NOT EXIST"
	echo "==============================================="
	echo "=============DOWNLOADING TOMCAT================"
	echo "==============================================="
	wget $TOMCAT_URL
	echo "==============================================="
	echo "=============UNPACKING TOMCAT=================="
	echo "==============================================="
	tar -zxf $TOMCAT_FILE
	rm $TOMCAT_FILE
else
	echo "$TOMCAT EXISTS"
fi

export JAVA_HOME=/opt/java/jdk1.8.0_241
##export PATH=$PATH:$JAVA_HOME
nc -vz localhost $PORT
if [[ $? = 0 ]]
then
	echo "PORT $PORT OPEN"
	./$TOMCAT_START
else
	echo "PORT $PORT NOT OPEN"
	echo "CHANGE $TOMCAT/conf/sever.xml FILE"

	#$(sed -i s/$PORT/$PORT2/g $TOMCAT_CONFIG)

fi

cd $CURRENT
