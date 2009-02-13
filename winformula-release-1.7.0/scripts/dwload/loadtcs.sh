CP=$CP:/home/web/web/resources
CP=$CP:/home/web/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/web/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/web/web/build/classes

nohup sh /home/web/web/scripts/dwload/loadtcsscript.sh >> /home/web/web/scripts/dwload/tcs_load.log 2>&1 &
