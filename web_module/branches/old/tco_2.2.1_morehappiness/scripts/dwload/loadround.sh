CP=""
CP=$CP:/home/coder/web/resources
CP=$CP:/home/coder/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/coder/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/coder/web/build/classes

nohup java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile loadround.xml > ./nohup.out 2>&1 &
tail -f nohup.out
