SVN Branch = https://coder.topcoder.com/internal/web_module/branches/studio-217-assembly-Ken26

#==================================================================================#
# DEPLOYMENT (same procedure as the previous one)
#==================================================================================#

** Pre-requisites : switch to the correct SVN branch and do a checkout in your test environment

- log in with cockpit user

- modify Cockpit JBoss start shell : /home/cockpit/jboss-4.2.2.GA/bin/run.sh

- resulting modification (starting from line 178):
		# Setup JBoss specific properties
		JAVA_OPTS="-Dprogram.name=$PROGNAME $JAVA_OPTS"
		JAVA_OPTS="-Djboss.remoting.pre_2_0_compatible=true $JAVA_OPTS"

- restart JBoss server: jbb; ./kill.sh; ./start.sh; tn;
	
- log in with studio user

- svn update: cd /home/studio/web; svn up;

- build and war studio : ant -f build_studio.xml war-studio

- restart Studio JBoss server: jbb; ./kill.sh; ./start.sh; tn;

- test studio application


#==================================================================================#
# CHANGE LOG
#==================================================================================#

- studio_service.jar has been commited to SVN branch into : Studio/lib/jars/tcs/studio_service.jar
- build_studio.xml updated consequently
