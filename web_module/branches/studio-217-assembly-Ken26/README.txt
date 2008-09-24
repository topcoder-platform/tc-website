SVN TAG : 

#==================================================================================#
# DEPLOYMENT
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

** Purpose: make Cockpit JBoss 4.2.2GA application server compatible 
			with EJB3 lookup from studio JBoss 4.0.4GA application server
   Impacted file(s): /home/cockpit/jboss-4.2.2.GA/bin/run.sh
   Description: define environment variable in Cockpit JBoss launch shell script
   				JAVA_OPTS="-Djboss.remoting.pre_2_0_compatible=true $JAVA_OPTS"
   Ref: - http://www.jboss.org/jbossremoting/docs/guide/2.2/html/ch12.html
  		- http://forums.topcoder.com/?module=Thread&threadID=624305&start=0&mc=27


** Purpose: perform correct authentication process in Cockpit JBoss before EJB3 invocation
   Impacted file(s): /home/studio/jboss-4.0.4.GA/server/default/conf/login-config.xml
   Description: add new application policy for 'cockpitDomain' in Studio JBoss login-config.xml file
	    <application-policy name="cockpitDomain">
	       <authentication>
	          <login-module code="org.jboss.security.ClientLoginModule" flag="required" />
	       </authentication>
	    </application-policy>
   Ref: jboss_login_module-2.0.0 specification document page 13, JBoss_Login_Module_Component_Specification.pdf

    
** Purpose: add necessary jars in build and runtime classpath for Studio application environment
   Impacted file(s): /home/studio/web/lib/jars/jboss-add/
   					 /home/studio/web/lib/jars/jboss-add/
   Description: mainly 3 'families' of jars
   					- JBoss EJB3 compilation/execution jars
   					- StudioService interface jar
   					- StudioService dependency jars
   				many EJB3 libraries... the jbossall-client.jar ignored because of hibernate conflicts
   				when copied to <studio-webapp>/WEB-INF/lib/ 
   Ref: N/A

   
** Purpose: configure additional jars in automated ant build/deploy scripts
   Impacted file(s): /home/studio/web/build_studio.xml
   Description: 
   Ref: N/A


   
** other impacted files
/home/studio/web/src/main/com/topcoder/web/studio/controller/request/admin/AddSubmissionPrize.java
/home/studio/web/src/main/com/topcoder/web/studio/util/ApplicationServer.java
/home/studio/web/src/main/com/topcoder/web/studio/util/StudioServiceLocator.java
/home/studio/web/resources/ApplicationServer.properties
   
   
#==================================================================================#
# LIMITATIONS / BUGS
#==================================================================================#
- Java XML/WS annotations not commented in StudioService beans ? 
  Impact, Studio compilation dependencies with jaxb-api.jar, jaxws-api...etc.
  Could be avoided if XML/WS not used.

- Not Serialized Object exceptions thrown by StudioService EJB3 bean. 
  Should apply patch to StudioService in order to implement interface Serializable
  For instance, when calling 'StudioService.getContest(id)' with unknown contest id. 	
		java.io.NotSerializableException: com.topcoder.service.studio.ejb.ContestNotFoundFault
	        at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1081)
	        at java.io.ObjectOutputStream.defaultWriteFields(ObjectOutputStream.java:1375)
	        at java.io.ObjectOutputStream.writeSerialData(ObjectOutputStream.java:1347)
	        
	        