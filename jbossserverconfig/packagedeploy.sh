track_error()
{
   if [ $1 != "0" ]; then
        echo "$2 exited with error $1"
        exit $1
   fi
}


mv /data/tc-website/run.conf /home/web/jboss-4.0.4.GA/bin/
track_error $? "Run.conf move"
mv /data/tc-website/lib.zip /data/tc-website/package/
track_error $? "lib.zip move"
mv /data/tc-website/resources.zip /data/tc-website/package/
track_error $? "resources.zip move"
mv /data/tc-website/topcoder.jar /data/tc-website/package/
track_error $? "topcoder.jar move"
cd /data/tc-website/package
unzip lib.zip
track_error $? "lib.zip Extraction"
unzip resources.zip
track_error $? "resources.zip Extraction"
jar xvf topcoder.jar
track_error $? "Jar Extraction"
mkdir -p lib/jars/tcs/tc_cache/1.0.0/
mv ../tc_cache.jar lib/jars/tcs/tc_cache/1.0.0/
track_error $? "topcoder.jar move"
#calling ant goal
mv /home/web/jboss-4.0.4.GA/server/all/conf/LDAP.properties /data/tc-website/
ant -f build_tc.xml expand
track_error $? "Ant deployment"
mv /data/tc-website/LDAP.properties /home/web/jboss-4.0.4.GA/server/all/conf/
cd ..
rm -rf /data/tc-website/package
