CP=$CP:/home/tc/web/resources
CP=$CP:/home/tc/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/tc/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/tc/web/build/classes
CP=$CP:/home/tc/jboss-4.0.4.GA/client/jbossall-client.jar
CP=$CP:/home/tc/jboss-4.0.4.GA/server/all/conf/cache.properties

nohup sh /home/tc/web/scripts/dwload/loadtcsscript.sh >> /home/tc/web/scripts/dwload/tcs_load.log 2>&1 &
