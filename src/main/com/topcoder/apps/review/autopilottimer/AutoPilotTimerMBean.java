package com.topcoder.apps.review.autopilottimer;

import org.jboss.system.ServiceMBean;

public interface AutoPilotTimerMBean extends ServiceMBean {
    /********************************************************
     * Determine whether the AutoPilotTimer initialized
     * properly or not.
     *
     * @return <code>True</code> if the CacheRefresher has
     * 	been initialised properly; <code>False</code>
     * 	otherwise.
     *******************************************************/
    public Boolean isInitialised();

    /********************************************************
     * Obtain the init status for this MBean
     *
     * @return init status for this MBean
     *******************************************************/
    public String getInitStatus();
}
