package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;
import java.util.Vector;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.LongContestModel;
import com.topcoder.web.common.TCWebException;

public class ViewPractice extends ViewActiveContests {
	
    protected static final Logger log = Logger.getLogger(ViewPractice.class);

    protected void businessProcessing() throws TCWebException {
    	
    	User usr = getUser();
    	Vector contests = new Vector();
    	
    	System.out.println("User ID: " + usr.getId());
    	
    	try {
	    	DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	
	    	// Prepare data request
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_round_view_practice");	    	
	    	
	    	Map m = dai.getData(r);
	    	
	    	// Get the practice rounds
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_round_practice");
	    	
	    	// Go through the practice rounds and build a list of them
	    	for(int i = 0; i < rsc.getRowCount(); i++) {
	    		
	    		LongContestModel longContest = new LongContestModel();
	    		
	    		String contestName = rsc.getStringItem(i, "contest_name");
	    		long contestID = rsc.getLongItem(i, "contest_id");
	    		String roundName = rsc.getStringItem(i, "round_name");
	    		long roundID = rsc.getLongItem(i, "round_id");
	    		String startTime = rsc.getStringItem(i, "start_time");
	    		String endTime = rsc.getStringItem(i, "end_time");	    		
	    		boolean hasStarted = true;
	    		
	    		int numRegs = getNumParticipants(dai, roundID);
	    		boolean usrRoundRegistered = true;
	    		
	    		longContest.setContestName(contestName);
	    		longContest.setRoundID(roundID);
	    		longContest.setRoundName(roundName);
	    		longContest.setStartTime(startTime);
	    		longContest.setEndTime(endTime);
	    		longContest.setCoderRegistered(usrRoundRegistered);
	    		longContest.setContestID(contestID);
	    		longContest.setStarted(hasStarted);
	    		
	    		System.out.println("Contest Name: " + contestName);
	    		System.out.println("Round Name: " + roundName);
	    		System.out.println("Round ID: " + roundID);
	    		System.out.println("Start Time: " + startTime);
	    		System.out.println("End Time:" + endTime);
	    		System.out.println("Num. Reg: " + numRegs);
	    		System.out.println("Usr Reg: " + usrRoundRegistered);
	    		
	    		RoundProblem prob = getRoundProblem(dai, roundID);
	    		
	    		if(prob != null) {
		    		System.out.println("Problem ID: " + prob.getProblemID());
		    		System.out.println("Component ID: " + prob.getComponentID());	    		
		    		System.out.println("Problem name: " + prob.getName());
		    			    	
		    		longContest.setComponentID(prob.getComponentID());
		    		longContest.setProblemID(prob.getProblemID());
		    		longContest.setProblemName(prob.getName());
	    		}
	    		
	    		longContest.setPassed(false);
	    		
	    		contests.add(longContest);	    		
	    	}	    	
	    	
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	
    	getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);
    	
    	setNextPage(Constants.PAGE_VIEW_PRACTICE);
    	setIsNextPageInContext(true);
    }
    
    private int getNumParticipants(DataAccessInt dai, long roundID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	try {    	
	    	r.setContentHandle("long_contest_round_num_participants");
	    	r.setProperty("rd", "" + roundID);	    	
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_round_num_participants");
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: getNumParticipants", e);
    		throw e;
    	}
    	return rsc.getIntItem(0,0);
    }
    
}
