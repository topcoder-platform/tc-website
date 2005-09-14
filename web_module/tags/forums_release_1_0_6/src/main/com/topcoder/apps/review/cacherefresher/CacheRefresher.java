package com.topcoder.apps.review.cacherefresher;

import com.topcoder.apps.review.persistence.Common;
import com.topcoder.util.cache.refreshable.RefreshException;
import com.topcoder.util.cache.refreshable.RefreshManager;
import com.topcoder.util.cache.refreshable.RefreshableCache;
import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBeanSupport;

import java.util.Timer;
import java.util.TimerTask;

/********************************************************************
 * This class creates a timer that will update the RefreshableCache.
 * This functionality is implemented as a JBoss-specific MBean.
 *
 * @author FatClimber
 *******************************************************************/
public class CacheRefresher
        extends ServiceMBeanSupport
        implements CacheRefresherMBean {
    /**
     * Number of minutes between refreshes.
     */
    private static final int REFRESH_DELAY = 60;
    private static Logger logger = Logger.getLogger(CacheRefresher.class);
    private static final String NAME = "CacheRefresher";
/*
    private String isInitialized = String.valueOf(false);
*/
    private static String status = "Not Initialized";

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
/*
    public String isInitialized() {
        return isInitialized;
    }
*/

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
        private int refreshNr = 0;

        public void run() {
            logger.info("CacheRefresher: Starting refresh, refreshNr: " + refreshNr);
            try {
                RefreshManager manager = RefreshManager.getInstance();
                RefreshableCache cache = manager.getCache("review_cache");
                manager.refreshAll();
                logger.info("CacheRefresher: Done refreshing caches, refreshNr: " + refreshNr++);
            } catch (RefreshException e) {
                logger.error(
                        "CacheRefresher: Could not refresh caches!\n" + e);
            }
        }
    }

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBeanSupport#startService()
     */
    public void startService() throws Exception {
        try {
            Common.getFromCache("AggregationApprovalManager");
            Common.getFromCache("AggregationResponseStatusManager");
            Common.getFromCache("EvaluationManager");
            Common.getFromCache("FinalFixStatusManager");
            Common.getFromCache("ResponseTypeManager");
            Common.getFromCache("ScorecardSectionGroupManager");
            Common.getFromCache("ScorecardSectionManager");
            Common.getFromCache("TestCaseApprovalManager");

            Common.getFromCache("PaymentStatusManager");
            Common.getFromCache("PhaseManager");
            Common.getFromCache("ProjectStatusManager");
            Common.getFromCache("ProjectTypeManager");
            Common.getFromCache("ReviewerResponsibilityManager");

            timer = new Timer();
            timer.schedule(new RefreshTask(), REFRESH_DELAY * 60 * 1000, //initial delay
                    REFRESH_DELAY * 60 * 1000); //subsequent rate
/*
            isInitialized = String.valueOf(true);
*/
        } catch (Exception e) {
            logger.error("CacheRefresher: Exception on init: " + e);
            status = "Exception on init: " + e;
            throw e;
        }
        status = "Initialized";
    }
}
