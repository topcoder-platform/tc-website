package com.topcoder.utilities.pacts;


public interface ExpireOldAffidavitsAndPaymentsMBean {
    /********************************************************
     * Obtain the init status for this MBean
     *
     * @return init status for this MBean
     *******************************************************/
    String getInitStatus();
        
    String getRunningTime();

	void setRunningTime(String runningTime);
    
    void startSingleton();

    boolean isMasterNode();

    void stopSingleton();
}
