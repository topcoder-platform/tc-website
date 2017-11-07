track_error()
{
   if [ $1 != "0" ]; then
        echo "$2 exited with error $1"
        exit $1
   fi
}


mv /data/tc-website/run.conf /home/web/jboss-4.0.4.GA/bin/
track_error $? "Run.conf move"
mv /data/tc-website/topcoder.jar /data/tc-website/package/
track_error $? "topcoder.jar move"
cd /data/tc-website/package
jar xvf topcoder.jar
track_error $? "Jar Extraction"
ant -f build_tc.xml expand
track_error $? "Ant deployment"
cd ..
rm -rf /data/tc-website/package
