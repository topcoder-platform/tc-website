package com.topcoder.apps.review.autopilottimer;

import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBeanSupport;


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
    private static final int DELAY = 5;
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

    /**
     * The RefreshTask updates the RefreshableCache.
     */
    private class RefreshTask extends TimerTask {
        public void run() {
            logger.debug("AUTO PILOT TIMER FIRED");
        }
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#startService()
     */
    public void startService() throws Exception {
        try {
    
            timer = new Timer();
            timer.schedule(new RefreshTask(), DELAY * 60 * 1000, //initial delay
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
