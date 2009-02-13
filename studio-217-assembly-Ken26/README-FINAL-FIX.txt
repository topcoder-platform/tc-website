#==================================================================================#
# DEPLOYMENT (same procedure as the previous one, 
#             so first steps can be skipped if already done)
#==================================================================================#

** Pre-requisites : switch to the correct SVN branch in order to perform a checkout in your test environment
   SVN Branch = https://coder.topcoder.com/internal/web_module/branches/studio-217-assembly-Ken26

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

- /home/studio/web/src/main/com/topcoder/web/studio/util/ApplicationServer.java file 
  has not been merged to existing /home/studio/shared/src/main/com/topcoder/shared/util/ApplicationServer.java.
  2 reasons : (I should have mentionned it during the appeals phase: to be discussed)
     -> I followed the existing packaging model for dde and review. Just notice that there are 2 other ApplicationServer files located in:
            - /home/studio/web/src/main/com/topcoder/dde/util/ApplicationServer.java
            - /home/studio/web/src/main/com/topcoder/apps/review/ApplicationServer.java
        Maybe, we should not merge specific parameters into the "more generic" ApplicationServer shared file ?...
     -> Also, ApplicationServer file located in /home/studio/shared/src/main/com/topcoder/shared/util/ is outside the svn branch provided for this contest.
        The svn branch points to /home/studio/web and we were not supposed to modify code outside this scope.
        
   Of course, it can be discussed.
   
- Logging has been added to AddSubmissionPrize

- Comments added to AddSubmissionPrize.java and ApplicationServer.java



 
