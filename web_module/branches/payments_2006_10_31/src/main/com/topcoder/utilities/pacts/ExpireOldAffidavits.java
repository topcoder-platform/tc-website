package com.topcoder.utilities.pacts;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.naming.NameNotFoundException;

import org.apache.log4j.Logger;
import org.jboss.system.ServiceMBeanSupport;

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;

public class ExpireOldAffidavits extends ServiceMBeanSupport implements ExpireOldAffidavitsMBean { 
	
    private static Logger logger = Logger.getLogger(ExpireOldAffidavits.class);
    private static final String NAME = "ExpireOldAffidavits";
    private Timer timer;
    private static String status = "Not Initialized";
    private String runningTime = null;
    
    /* (non-Javadoc)
     * @see org.jboss.system.ServiceMBean#getName()
     */
    public String getName() {
        return NAME;
    }

    public String getInitStatus() {
        return status;
    }

    public String getRunningTime() {
		return runningTime;
	}

	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
    
    
    public void startService() throws Exception {
        try {
        	Date start = getStartTime();
        	
            timer = new Timer();
            timer.scheduleAtFixedRate(new ExpireTask(), start, 1 * 60 * 1000); 

            logger.info("ExpireOldAffidavits will run daily at " + getRunningTime() + " starting at " + start);
        } catch (Exception e) {
            logger.error("ExpireOldAffidavits: Exception on init: " + e);
            status = "Exception on init: " + e;
            throw e;
        }
        status = "Initialized";
    }
    
    private Date getStartTime() throws ParseException {
    	SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy.MM.dd");
    	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy.MM.dd h:mm a");
    	
    	String date = sdfDay.format(new Date()) + " " + getRunningTime();
    	return sdfDate.parse(date);    	
    }

    private class ExpireTask extends TimerTask {
        public void run() {
            logger.debug("ExpireOldAffidavits Fired");

            try {
            	DataInterfaceBean dib = new DataInterfaceBean();
            	int n = dib.expireOldAffidavits();
            	logger.debug(n + " affidavits expired");
            	
            	n = dib.expireOldPayments();
            	logger.debug(n + " payments expired");
            	
            } catch (Exception e) {
                if (!(e instanceof NameNotFoundException))
                    logger.error(e.getMessage());
            }
        }
    }



}
