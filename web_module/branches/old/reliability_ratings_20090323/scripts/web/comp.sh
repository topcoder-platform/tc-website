directoryname=$1

echo $directoryname

#compile java files
javac -deprecation  com/topcoder/ejb/$directoryname/*.java -d /home/steveb/build/classes

