package com.topcoder.server.email;

import java.util.*;
import java.net.*;
import java.lang.*;
import java.io.*;

import javax.naming.*;
import org.apache.log4j.Category;
import com.topcoder.server.util.*;
import com.topcoder.server.ejb.EmailServices.*;

/**
 * The EmailJobScheduler is responsible for periodically checking
 * the database for email jobs and running them when found.
 * 
 * The EmailJobScheduler can be started from the command line and
 * remains resident until it is requested that it stop.
 *
 * Email jobs are run in separate threads from the scheduler, so 
 * multiple jobs may be processed in parallel.
 *
 * @author   Eric Ellingson
 * @version  $Revision$
 * @internal Log of Changes:
 *           $Log$
 *           Revision 1.1.2.12  2002/05/06 03:38:41  sord
 *           Added some informational log messages.
 *
 *           Revision 1.1.2.11  2002/05/06 03:33:29  sord
 *           Fixed max_email_per_second_per_job config variable name.
 *
 *           Revision 1.1.2.10  2002/05/06 03:30:32  sord
 *           Moved all configuration stuff to EmailJobScheduler.
 *
 *           Revision 1.1.2.9  2002/05/06 03:07:24  sord
 *           Handle case where configuration matches default.
 *
 *           Revision 1.1.2.8  2002/05/06 03:05:40  sord
 *           Log configuration when it is changed.
 *
 *           Revision 1.1.2.7  2002/05/06 03:00:54  sord
 *           Modified how the configuration is reloaded.
 *
 *           Revision 1.1.2.6  2002/05/06 01:59:47  sord
 *           Added configuration options for thread control and resource limits.
 *
 *           Revision 1.1.2.5  2002/04/28 05:23:45  sord
 *           Mark jobs as incomplete if they have passed their time.
 *
 *           Revision 1.1.2.4  2002/04/27 07:27:56  sord
 *           Copy the contex for the sub-processes so that they don't get closed when the function exits.
 *
 *           Revision 1.1.2.3  2002/04/25 07:26:59  sord
 *           Fixed config reader bug.
 *
 *           Revision 1.1.2.2  2002/04/25 05:59:54  sord
 *           Additional functionallity.
 *
 *           Revision 1.1.2.1  2002/04/25 04:54:20  sord
 *           Initial version.
 *
 */
public class EmailJobScheduler {

    private static final String CONTEXT_FACTORY = "weblogic.jndi.WLInitialContextFactory";
    private static final String CONTEXT_PROVIDER = "t3://172.16.20.140:8020";

    private static boolean configRead = false;
    private static String contextFactory = CONTEXT_FACTORY;
    private static String contextProvider = CONTEXT_PROVIDER;
    private static int pollingInterval_msec = 60000;
    private static int maxWorkerThreads = 10;
    private static int maxEmailsPerSec = 100;

    private static boolean stopRequested = false;
    private static Thread waitThread = null;

    private static Category trace = Category.getInstance( EmailJobScheduler.class.getName() );
    
 /**
  * Main scheduler loop.  Cycles through, reading the profile, 
  * checking the schedule, and waiting.
  */
    public static void main(String [] args) {
     /**
      * check if a stop command was requested and stop the 
      * scheduler if it was, otherwise start the scheduler.
      */
        if (args.length > 0
         && args[0].equals("stop")) {
            stopScheduler();
        } else {
            if (waitThread != null) {
                String msg = "It appears that there is already a schedule service"
                        + " running. Please stop it before starting another.";
                System.out.println(msg);
                trace.error(msg);
                return;
            }
            runScheduler();
        }
    }

 /**
  * This function is the main scheduler loop.
  * Cycles repeatedly, reading the profile, 
  * checking the schedule, and waiting for the next cycle.
  */
    public static void runScheduler() {
     /**
      * Read the profile, initialize any scheduler resources that will
      * be used throughout the life-cycle of the scheduler, and clear
      * any active jobs on the assumption that they must have been left
      * in the queue when the last scheduler abruptly terminated.
      */
        readProfile();
        clearActiveJobs();
        
     /**
      * Until the stopRequested flag is set, loop continuouly
      * reading the profile, check the schedule, and then wait
      * for the next cycle.
      */
        for ( ; !stopRequested; ) {
            readProfile();
            checkSchedule();
            pause();
        }
        
     /**
      * Last chance to cleanup before exiting.
      */
        shutdown();
    }
    
 /**
  * This function is used to stop the scheduler.
  * It sets the stopRequested flag and interrupts the 
  * pause function so the stopRequest can be processed.
  */
    public static void stopScheduler() {
        stopRequested = true;
        waitThread.interrupt();
    }

 /**
  * This function pauses for the configured polling interval.
  */
    public static void pause() {
        try {
            waitThread.sleep(pollingInterval_msec);
        } catch (Exception ignore) {}
    }

 /**
  * This funtion initialize resources that are used 
  * throughout the life-cycle of the scheduler.
  */
    public static void startup() {
        stopRequested = false;
        waitThread = Thread.currentThread();
        StageQueue.start(maxWorkerThreads);
        trace.info("Started EmailJobScheduler");
    }
    
 /**
  * This function read the profile from the configuration 
  * file and stores the results in static variables.
  * If the profile has changed, the function also detects
  * and handles the change.
  */
    public static void readProfile() {
        ResourceBundle resource = null;
        try { 
            resource = ResourceBundle.getBundle("Email");
        } catch (Exception e) {
            trace.warn("Failed to find the Email resource file: " + e.getMessage());
        }
        String newContextFactory = readConfig(resource, "context_factory", contextFactory);
        String newContextProvider = readConfig(resource, "context_provider", contextProvider);
        int newPollingInterval = readConfig(resource, "polling_interval_msec", pollingInterval_msec);
        int newWorkerThreads = readConfig(resource, "max_worker_threads", maxWorkerThreads);
        int newMaxEmailsPerSec = readConfig(resource, "max_emails_per_second_per_job", maxEmailsPerSec);
        
        // force values into a resonable range or warn for values that don't seem right.
        if (newPollingInterval < 1000) newPollingInterval = 1000;
        if (newPollingInterval > 36000 && newPollingInterval != pollingInterval_msec) {
            String msg = "WARNING: polling_interval_msec has been configured"
                    + " to a very long interval (~" 
                    + (newPollingInterval+18000)/36000 + " hours)";
            System.out.println(msg);
            trace.warn(msg);
        }
        if (newWorkerThreads < 1) newWorkerThreads = 1;
        if (newWorkerThreads > 1000 && newWorkerThreads != maxWorkerThreads) {
            String msg = "WARNING: max_worker_threads has been configured to"
                    + " a very large value (" + newWorkerThreads + ")";
            System.out.println(msg);
            trace.warn(msg);
        }
        if (newMaxEmailsPerSec < 1) newMaxEmailsPerSec = 1;
        
        if (!configRead
         || !newContextFactory.equals(contextFactory)
         || !newContextProvider.equals(contextProvider)
         || newWorkerThreads != maxWorkerThreads
         || newPollingInterval != pollingInterval_msec
         || newMaxEmailsPerSec != maxEmailsPerSec) {
            // profile changed
            if (configRead)
                shutdown();
            configRead = true;
            contextFactory = newContextFactory;
            contextProvider = newContextProvider;
            maxWorkerThreads = newWorkerThreads;
            pollingInterval_msec = newPollingInterval;
            maxEmailsPerSec = newMaxEmailsPerSec;
            trace.debug("Email configuration updated.");
            trace.debug("Email context_factory: " + contextFactory);
            trace.debug("Email context_provider: " + contextProvider);
            trace.debug("Email polling_interval_msec: " + pollingInterval_msec);
            trace.debug("Email max_worker_threads: " + maxWorkerThreads);
            trace.debug("Email max_emails_per_second_per_job: " + maxEmailsPerSec);
            startup();
        }
    }
    
 /**
  * Access member for EmailJobScheduler to get the maxEmailsPerSecond config variable
  */
    public static int getMaxEmailsPerSecond() {
        return maxEmailsPerSec;
    }

 /**
  * readConfig reads a value from the configuration file, using a default value
  * if the name is not found.
  */
    public static int readConfig(ResourceBundle resource, String name, int defaultValue) {
        String newValue = readConfig(resource, name, null);
        try {
            return Integer.parseInt(newValue);
        } catch (Exception ignore) {
            return defaultValue;
        }
    }
    
 /**
  * readConfig reads a value from the configuration file, using a default value
  * if the name is not found.
  */
    public static String readConfig(ResourceBundle resource, String name, String defaultValue) {
        try {
            return resource.getString(name);
        } catch (Exception ignore) {
            return defaultValue;
        }
    }
    
 /**
  * This function changes the state of any active job to ready.
  * The active state indicates that the job is running. 
  * When this function is called, the scheduler is just starting
  * up, so it is not possible that the jobs are already running.
  * Instead, we must assume that the job were left in a invalid
  * state due to an abrupt termination of the scheduler.
  */
    public static void clearActiveJobs() {
        Context ctx = null;
        Hashtable ht = new Hashtable();
        ht.put(Context.INITIAL_CONTEXT_FACTORY, contextFactory);
        ht.put(Context.PROVIDER_URL, contextProvider);
        try {
            ctx = new InitialContext(ht);
            EmailServerHome home = (EmailServerHome) ctx.lookup("com.topcoder.server.ejb.EmailServices.EmailServer");
            EmailServer email = home.create();

            Set jobs = email.getJobs(email.ACTIVE, email.ANYRANGE);
            Iterator jobItr = jobs.iterator();
            for ( ; jobItr.hasNext(); ) {
                int jobId = ((Integer)jobItr.next()).intValue();
                email.setJobStatus(jobId, email.READY);
                trace.debug("Changed job " + jobId + " status to Ready (was Active)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ctx != null) { try { ctx.close(); } catch (Exception ignore) {} }
        }
    }
    
 /**
  * This function checks the database for jobs that are ready to
  * be run. If there are any, it changes the state to active and 
  * adds the job to the queue.Read the profile from the configuration file and store the
  * results in the static variables.
  */
    public static void checkSchedule() {
        Context ctx = null;
        Hashtable ht = new Hashtable();
        ht.put(Context.INITIAL_CONTEXT_FACTORY, contextFactory);
        ht.put(Context.PROVIDER_URL, contextProvider);
        try {
            ctx = new InitialContext(ht);
            EmailServerHome home = (EmailServerHome) ctx.lookup("com.topcoder.server.ejb.EmailServices.EmailServer");
            EmailServer email = home.create();

            Set jobs = email.getJobs(email.READY, email.AFTERRANGE);
            Iterator jobItr = jobs.iterator();
            for ( ; !stopRequested && jobItr.hasNext(); ) {
                // for each ready job that has expired, mark job as incomplete.
                int jobId = ((Integer)jobItr.next()).intValue();
                trace.debug("Marking as incomplete job " + jobId);
                email.setJobStatus(jobId, email.INCOMPLETE);
            }

            jobs = email.getJobs(email.READY, email.INRANGE);
            jobItr = jobs.iterator();
            for ( ; !stopRequested && jobItr.hasNext(); ) {
                // for each ready job, create job task, mark job active and add to queue.
                int jobId = ((Integer)jobItr.next()).intValue();
                trace.debug("Preparing to queue job " + jobId);
                email.setJobStatus(jobId, email.ACTIVE);
                StageQueue.addTask(new SendEmailTask((Context)(ctx.lookup(new CompositeName())), jobId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ctx != null) { try { ctx.close(); } catch (Exception ignore) {} }
        }
    }
    
 /**
  * This function shuts down resources that are used 
  * throughout the life-cycle of the scheduler.
  */
    public static void shutdown() {
        trace.info("Shutting down EmailJobScheduler");
        if (waitThread == Thread.currentThread()) waitThread = null;
        StageQueue.stop();
    }
    
}

