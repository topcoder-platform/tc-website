directoryname=$1
classname=$1
jarname=$1

echo 'Creating EJB for '$directoryname

. $WL3_HOME/setEnv.sh

MYCLASSPATH=$CLASSPATH
BEAN_HOME=/export/home/track/WEB-RENDER/build/ejb_jars

# Create the build directory, and copy the deployment descriptors into it
cd $directoryname

#remove existing build directory 
#rm -r build

#create new build directory and copy deployment descriptors to it
echo 'building directory and coping deployment descriptors...'
mkdir -p build build/META-INF
cp -f ejb-jar.xml weblogic-ejb-jar.xml weblogic-cmp-rdbms-jar.xml build/META-INF

# Make a standard ejb jar file, including XML deployment descriptors
echo 'Creating jar...'
(cd build; jar cv0f "$jarname".jar META-INF com)

# Run ejbc to create the deployable jar file
rm $BEAN_HOME/"$jarname".jar
echo 'Running ejbc...'
echo $BEAN_HOME
java -classpath $MYCLASSPATH \
   -Dweblogic.home=$WL_HOME weblogic.ejbc \
    -compiler javac build/"$jarname".jar \
    $BEAN_HOME/"$jarname".jar 

