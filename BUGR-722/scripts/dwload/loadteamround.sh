CP=""
CP=$CP:/home/branch3/web/resources
CP=$CP:/home/branch3/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/branch3/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/branch3/web/build/classes

nohup java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile loadteamround.xml > ./nohup.out 2>&1 &
tail -f nohup.out
