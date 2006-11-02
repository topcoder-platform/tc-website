package com.topcoder.utilities.pacts;

import java.util.Timer;
import java.util.TimerTask;

import javax.naming.NameNotFoundException;

import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBean;
import org.jboss.system.ServiceMBeanSupport;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

public class ExpireOldAffidavitsMBean extends ServiceMBeanSupport implements ServiceMBean { 
	
    private static Logger logger = Logger.getLogger(ExpireOldAffidavitsMBean.class);
    private static final String NAME = "ExpireOldAffidavits";
    private Timer timer;

    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBean#getName()
     */
    public String getName() {
        return NAME;
    }

    public void startService() throws Exception {
        try {
            timer = new Timer();
            timer.scheduleAtFixedRate(new ExpireTask(), 0, 1 * 60 * 1000); 

        } catch (Exception e) {
            logger.error("ExpireOldAffidavits: Exception on init: " + e);
            throw e;
        }
    }

    private class ExpireTask extends TimerTask {
        public void run() {
            logger.debug("ExpireOldAffidavits Fired");

            try {
            	DataInterfaceBean dib = new DataInterfaceBean();
            	//dib.expireOldAffidavits();
            	
            } catch (Exception e) {
                if (!(e instanceof NameNotFoundException))
                    logger.error(e.getMessage());
            }
        }
    }


}
