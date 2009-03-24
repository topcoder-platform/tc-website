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

public class ExpireOldAffidavitsAndPayments extends ServiceMBeanSupport implements ExpireOldAffidavitsAndPaymentsMBean { 
	
    private static Logger logger = Logger.getLogger(ExpireOldAffidavitsAndPayments.class);
    private static final String NAME = "ExpireOldAffidavits";
    private Timer timer = null;
    private static String status = "Not Initialized";
    private String runningTime = null;
    private boolean isMasterNode = false;

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
            timer.scheduleAtFixedRate(new ExpireTask(), start, 24 * 60 * 60 * 1000); // Run daily

            logger.info("ExpireOldAffidavitsAndPayments will run daily at " + getRunningTime() + " starting at " + start);
        } catch (Exception e) {
            logger.error("ExpireOldAffidavitsAndPayments: Exception on init: " + e);
            status = "Exception on init: " + e;
            throw e;
        }
        status = "Initialized";
    }
    
    private Date getStartTime() throws ParseException {
    	SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy.MM.dd");
    	SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy.MM.dd h:mm a");
    	
    	String date = sdfDay.format(new Date()) + " " + getRunningTime();
    	Date d = sdfDate.parse(date);
    	
    	// if this was early today, move it for tomorrow same time.
    	if (d.before(new Date())) {
    		d.setTime(d.getTime() + 24 * 60 * 60 * 1000);
    	}
    	return d;
    }

    private class ExpireTask extends TimerTask {
        public void run() {
            if (!isMasterNode()) {
                logger.info("This is not the master, process ExpireOldAffidavitsAndPayments skipped.");
                return;
            }
            logger.info("ExpireOldAffidavitsAndPayments Fired");

            try {
            	DataInterfaceBean dib = new DataInterfaceBean();
            	int n = dib.expireOldAffidavits();
            	logger.info(n + " affidavits expired");
            	
                n = dib.expireOldPayments();
                logger.info(n + " payments expired");
                
                n = dib.expireOldAssignmentDocuments();
                logger.info(n + " assignment documents expired");
                
                n = dib.checkInactiveCoders();
                logger.info("Inactive coder were checked and related payments were notified");
                
            } catch (Exception e) {
                if (!(e instanceof NameNotFoundException))
                    logger.error(e.getMessage());
            }
        }
    }


    
    public void startSingleton() {
        isMasterNode = true;
        logger.debug("StartSingleton");
        try {
            if (timer == null) {
                startService();
            }
        } catch (Exception e) {
            logger.error(e);
        }
    }

    public boolean isMasterNode() {
        return isMasterNode;  
    }

    public void stopSingleton() {
        isMasterNode = false;  
        timer.cancel();
        timer = null;
        logger.debug("StopSingleton");
    }


}
