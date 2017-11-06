mv /data/tc-website/run.conf /home/web/jboss-4.0.4.GA/bin/
mv /data/tc-website/topcoder.jar /data/tc-website/package/
cd /data/tc-website/package
jar xvf topcoder.jar
ant -f build_tc.xml expand
cd ..
rm -rf /data/tc-website/package
