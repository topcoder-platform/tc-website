#!/bin/sh
# makeJava.sh
#
# This shell script is a quick way to compile all the source in 
# the source directory into the classes directory.
# It uses the javaunix.list file to give the list of files
# to be compiled to javac.  

echo "Compiling all CoolForum source code..."
javac -sourcepath ./source -d ./classes @javaunix.list
