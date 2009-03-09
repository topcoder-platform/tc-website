package com.topcoder.apps.review.cacherefresher;

import org.jboss.system.ServiceMBean;

public interface CacheRefresherMBean extends ServiceMBean {
    /********************************************************
     * Determine whether the CacheRefresher initialized
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
