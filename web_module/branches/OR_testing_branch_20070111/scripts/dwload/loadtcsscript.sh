CP=""
CP=$CP:/home/onlinereview/TC_testing_branch_20070111/web/resources
CP=$CP:/home/onlinereview/TC_testing_branch_20070111/web/lib/jars/log4j-1.2.7.jar
CP=$CP:/home/onlinereview/TC_testing_branch_20070111/web/lib/jars/ifxjdbc.jar
CP=$CP:/home/onlinereview/TC_testing_branch_20070111/web/build/classes

java -cp $CP com.topcoder.shared.util.dwload.TCLoadUtility -xmlfile /home/onlinereview/TC_testing_branch_20070111/web/scripts/dwload/loadtcs.xml

java -cp $CP com.topcoder.shared.util.dwload.CacheClearer
