WEB_APP=query
WAR_HOME=/export/home/apps/web/build/wars
CP=$CLASSPATH:${WAR_HOME}/${WEB_APP}.war

SOURCE_PATH=/export/home/apps/web/src/main/com/topcoder/web/${WEB_APP}/servlet/jsp
OUTPUT_PATH=${WAR_HOME}/WEB-INF/_tmp_war_${WEB_APP}

find ${SOURCE_PATH} -name "*.jsp" | xargs \
java weblogic.jspc \
-docroot ${SOURCE_PATH} \
-compiler javac \
-classpath ${CP} \
-d ${OUTPUT_PATH} \
-verbose \
-neverStale \
-keepgenerated \

