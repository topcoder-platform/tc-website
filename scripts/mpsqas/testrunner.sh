#!/bin/ksh
while ((1))
do
  print "SHELL: Starting tester"
  java com.topcoder.mpsqas.tester.Tester
  print "SHELL: The tester has finished executing and is starting up again..."
done
