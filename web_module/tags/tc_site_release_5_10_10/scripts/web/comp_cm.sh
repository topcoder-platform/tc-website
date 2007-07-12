directoryname=$1

echo $directoryname

#compile java files
javac -deprecation  com/topcoder/web/render/ejb/*.java -d /home/steveb/build/classes

