CP=""
CP=$CP:/home/coder/web/resources
CP=$CP:/home/coder/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/coder/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/coder/web/build/classes

nohup sh /home/coder/web/scripts/dwload/loadtcsscript.sh >> /home/coder/web/scripts/dwload/tcs_load.log 2>&1 &
