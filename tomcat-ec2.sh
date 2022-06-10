#!bin/bash
sudo yum install java-1.8.0-openjdk -y
cd /opt
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.63/bin/apache-tomcat-9.0.63.tar.gz
tar -xvzf apache-tomcat-9.0.63.tar.gz
mv apache-tomcat-9.0.63 tomcat
cd tomcat/
cd bin
./startup.sh
