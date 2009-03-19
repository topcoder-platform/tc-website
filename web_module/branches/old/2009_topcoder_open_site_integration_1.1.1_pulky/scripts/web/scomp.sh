MOVE=$1

#compile java files
javac -deprecation  com/topcoder/servlet/*.java -d /home/steveb/WEB-INF/classes
if [ "$MOVE" = "move" ]
then
(
cd /home/steveb/WEB-INF/classes
mv *.class servlet
jar cvf s.jar com servlet
rm -r com
ftp 172.16.1.152
)
fi
