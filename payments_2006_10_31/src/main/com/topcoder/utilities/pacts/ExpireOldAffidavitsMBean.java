package com.topcoder.utilities.pacts;

import org.jboss.system.ServiceMBean;

public interface ExpireOldAffidavitsMBean extends ServiceMBean {
    /********************************************************
     * Obtain the init status for this MBean
     *
     * @return init status for this MBean
     *******************************************************/
    public String getInitStatus();
        
    public String getRunningTime();

	public void setRunningTime(String runningTime);
}
