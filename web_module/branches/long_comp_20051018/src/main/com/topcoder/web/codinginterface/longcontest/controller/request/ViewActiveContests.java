package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultColumn;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.security.User;

public class ViewActiveContests extends Base{
	
    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {
//        try {
//            TCRequest request = getRequest();
//            
//        }catch(TCWebException e){
//            throw e;
//        }catch(Exception e){
//            e.printStackTrace();
//            throw new TCWebException("Error retrieving page.");
//        }
    	
    	User usr = getUser();
    	
    	System.out.println("User ID: " + usr.getId());
    	
    	try {
	    	DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_active_contests");
	    	
	    	Map m = dai.getData(r);
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_active_contests");
	    	
	    	for(int i = 0; i < rsc.getRowCount(); i++) {
	    		String contestName = rsc.getStringItem(i, "contest_name");
	    		String roundName = rsc.getStringItem(i, "round_name");
	    		String roundID = rsc.getStringItem(i, "round_id");
	    		String startTime = rsc.getStringItem(i, "start_time");
	    		String endTime = rsc.getStringItem(i, "end_time");
	    		
	    		int numRegs = getNumRegistrants(dai, roundID);
	    		boolean usrRoundRegistered = isCoderRoundRegistered(dai, roundID, usr.getId());
	    		
	    		System.out.println("Contest Name: " + contestName);
	    		System.out.println("Round Name: " + roundName);
	    		System.out.println("Round ID: " + roundID);
	    		System.out.println("Start Time: " + startTime);
	    		System.out.println("End Time:" + endTime);
	    		System.out.println("Num. Reg: " + numRegs);
	    		System.out.println("Usr Reg: " + usrRoundRegistered);
	    		
	    	}
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	
    	
    	setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
    	setIsNextPageInContext(true);
    }
    
    private int getNumRegistrants(DataAccessInt dai, String roundID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	try {    	
	    	r.setContentHandle("long_contest_num_registered");
	    	r.setProperty("rd", roundID);	    	
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_num_registered");
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: long_contest_num_registered", e);
    		throw e;
    	}
    	return rsc.getIntItem(0,0);
    }
    
    private boolean isCoderRoundRegistered(DataAccessInt dai, String roundID, long coderID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	try {    	
	    	r.setContentHandle("long_contest_coder_registered");
	    	r.setProperty("rd", roundID);
	    	r.setProperty("cr", "" + coderID);
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_coder_registered");
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: long_contest_coder_registered", e);
    		throw e;
    	}
    	return rsc.getIntItem(0,0) > 0;
    }
}
