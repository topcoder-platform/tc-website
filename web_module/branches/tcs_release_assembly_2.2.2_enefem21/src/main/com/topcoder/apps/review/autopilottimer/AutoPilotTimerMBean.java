package com.topcoder.apps.review.autopilottimer;

import org.jboss.system.ServiceMBean;

public interface AutoPilotTimerMBean extends ServiceMBean {
    /********************************************************
     * Determine whether the AutoPilotTimer initialized
     * properly or not.
     *
     * @return "true" if the CacheRefresher has
     * 	been initialised properly; "false"
     * 	otherwise.
     *******************************************************/
/*
    public String isInitialized();
*/

    /********************************************************
     * Obtain the init status for this MBean
     *
     * @return init status for this MBean
     *******************************************************/
    public String getInitStatus();
}
