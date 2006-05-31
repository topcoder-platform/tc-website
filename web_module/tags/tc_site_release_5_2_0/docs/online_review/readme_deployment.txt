Deployment of Online Review Application
---------------------------------------

1. Install jboss

2. Modify jboss/bin/run.sh or jboss/bin/run.bat so that
   jboss/server/default/conf is in JBOSS_CLASSPATH.

3. Get and install cactus by unpacking it.
   (http://jakarta.apache.org/builds/jakarta-cactus/release/v1.4.1/jakarta-cactus-13-1.4.1.zip)

4. Modify build.xml, the interesting properties are:
      cvsuser    - cvs user, for retrieving libraries
      cvsip      - cvs ip, for retrieving libraries
      jbossip    - ip for jboss
      jbossport  - port for jboss
      jbossdir   - directory where jboss is installed
      cactusdir  - directory where cactus is unpacked

      jbosssubmissionsip - ip used to generate links(submissionurl) for downloading submissions
      submissiondir - directory where to store submissions
      submissionurl - the prefix for the url to access the files in the submissions-dir

      dbip       - ip for database
      dbname     - name of database
      dbuser     - db user to connect to database
      dbpassword - db password to connect to database
   These are at the moment set up for running on dev(65.112.118.206).
   The buildfile first checks if there's a localbuild.properties where
   these options can be overrided, so
   MAKE SURE that this file doesn't override wanted options from build.xml!!

5. Some config-files need to be changed:
     conf/business_logic_config/business_logic_config.properties  - This file
           is filtered by the ant-script and
           later put in conf/com/topcoder/apps/review/business_logic_config.properties.
           The options that are interesting:
           weekly_notifications_weekday, weekly_notifications_time
           weekly_notifications_user, weekly_notifications_password
     
     conf/com/topcoder/message/email/EmailEngine.xml  - set mail-server properties

     conf/com/topcoder/servlet/request/FileUpload.xml  - set directory where downloads
            are stored initially before they are renamed and put in submissiondir
     MAKE SURE THAT THIS DIRECTORY EXISTS IN THE FILESYSTEM!

6. The cvsuser has to login to cvs-server before running the buildscript.

7. Configure jboss by running: ant jbossconf

8. Start Jboss (have to be started after running ant jbossconf).

9. Initialize database for testing by running: ant dbddl dbtest
   (The first times these are run they will show errors for the
    drop table-statements, which is ok.)
   To define what scorecard-templates should be used, you have to
   modify build.xml(beofre running ant dbtest), target "dbtest"
   and choose what template-sql-files should be executed.

10. Convert existing data by updating subURL and subOut and running ant run_converter.

11. Execute the statements in indeces.sql.

10. Deploy(and compile) with: ant deploy


Testing
-------
For testing to work, junit.jar must be in the CLASSPATH!

(11). For Persistence Layer testing a clean db is needed,
   so first run:
       ant dbddl
   and then:
       ant test_pl
   This runs the target deploy_tests to deploy an ear with
   the tests included.

(12). tests for Front End and Business Logic layer:
       ant test_fe
       ant test_bl
