package com.topcoder.util.informixinit;

import org.jboss.system.ServiceMBean;

public interface InitialiseInformixJDBCMBean extends ServiceMBean {
    /********************************************************
     * Determine whether the connections initialised
     * properly or not.
     *
     * @return <code>True</code> if the connections have
     * 	been initialised properly; <code>False</code>
     * 	otherwise.
     *******************************************************/
    public Boolean isInitialised();

    /********************************************************
     * Obtain a descriptive name for this MBean
     *
     * @return the name of this MBean
     *******************************************************/
    public void manualRefresh() throws Exception;

    /********************************************************
     * Obtain a descriptive name for this MBean
     *
     * @return the name of this MBean
     *******************************************************/
    public String getInitStatus();
}
