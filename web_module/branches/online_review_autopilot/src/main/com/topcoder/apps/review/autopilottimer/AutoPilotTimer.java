package com.topcoder.apps.review.autopilottimer;

import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBeanSupport;

import com.topcoder.apps.review.projecttracker.SecurityEnabledUser;
import com.topcoder.security.TCSubject;
import com.topcoder.security.RolePrincipal;

import com.topcoder.apps.review.projecttracker.*;
import com.topcoder.apps.review.EJBHelper;

import com.topcoder.apps.review.projecttracker.UserProjectInfo;


/********************************************************************
 * This class creates a timer that will perform auto pilot logic.
 * This functionality is implemented as a JBoss-specific MBean.
 *
 * @author rfairfax
 *******************************************************************/
public class AutoPilotTimer
        extends ServiceMBeanSupport
        implements AutoPilotTimerMBean {
    /**
     * Number of minutes between refreshes.
     */
    private static final int DELAY = 1;
    private static Logger logger = Logger.getLogger(AutoPilotTimer.class);
    private static final String NAME = "AutoPilotTimer";
    private Boolean isInitialised = Boolean.FALSE;
    private static String status = "Not Initialised";

    private Timer timer;

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#stopService()
     */
    protected void stopService() throws Exception {
        super.stopService();
        timer.cancel();
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBean#getName()
     */
    public String getName() {
        return NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.cacherefresher.CacheRefresherMBean#isInitialised()
     */
    public Boolean isInitialised() {
        return isInitialised;
    }

    /* (non-Javadoc)
     * @see com.topcoder.apps.review.cacherefresher.CacheRefresherMBean#getInitStatus()
     */
    public String getInitStatus() {
        return status;
    }

    private class SubmissionTask extends TimerTask {
        public void run() {
            logger.debug("AUTO PILOT TIMER FIRED");
            
            try {
                //setup user
                TCSubject user = new TCSubject(100129);
                user.addPrincipal(new RolePrincipal("Administrator", 1));

                //get projects that are in submission phase and have submission end time > current
                ProjectTrackerLocal projectTracker = EJBHelper.getProjectTracker(); 

                UserProjectInfo[] projs = projectTracker.getProjectInfo(user);
                
                for(int i = 0; i < projs.length;i++) {
                    if(projs[i].getCurrentPhaseInstance().getPhase().getId() == Phase.ID_SUBMISSION) {
                        if(projs[i].getCurrentPhaseInstance().getEndDate().getTime() <= System.currentTimeMillis()) {
                            logger.debug("SELECTED: " + projs[i].getProjectName());
                        }
                    } 
                }
            } catch(Exception e) {
                logger.error(e.getMessage());
            }
        }
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#startService()
     */
    public void startService() throws Exception {
        try {
    
            timer = new Timer();
            timer.schedule(new SubmissionTask(), 0, //initial delay
                    DELAY * 60 * 1000); //subsequent rate
            isInitialised = Boolean.TRUE;
        } catch (Exception e) {
            logger.error("AutoPilotTimer: Exception on init: " + e);
            status = "Exception on init: " + e;
            throw e;
        }
        status = "Initialized";
    }
}
