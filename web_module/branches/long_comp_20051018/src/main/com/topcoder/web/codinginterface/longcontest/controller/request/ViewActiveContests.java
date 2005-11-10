package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Map;
import java.util.Vector;

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

/**
 * Displays active and a couple of pass contests
 *
 * @author farsight
 * @version 1.0
 */ 
public class ViewActiveContests extends Base{
	
    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {
    	
    	User usr = getUser();
    	
    	// The collection of contests to display
    	Vector contests = new Vector();
    	
    	try {
    		// Data source
	    	DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	
	    	// Prepare a request to get active contest information
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_active_contests");
	    	
	    	// Fetch Data
	    	Map m = dai.getData(r);
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_active_contests");
	    	
	    	// Go through the list of active contests
	    	for(int i = 0; i < rsc.getRowCount(); i++) {
	    		
	    		LongContestModel longContest = new LongContestModel();
	    		
	    		// Get various contest properties
	    		String contestName = rsc.getStringItem(i, "contest_name");
	    		long contestID = rsc.getLongItem(i, "contest_id");
	    		String roundName = rsc.getStringItem(i, "round_name");
	    		long roundID = rsc.getLongItem(i, "round_id");
	    		String startTime = rsc.getStringItem(i, "start_time");
	    		String endTime = rsc.getStringItem(i, "end_time");
	    		boolean hasStarted = rsc.getBooleanItem(i, "started");	    		
	    		int numRegs = getNumRegistrants(dai, roundID);
	    		boolean usrRoundRegistered = isCoderRoundRegistered(dai, roundID, usr.getId());
	    		
	    		// Store the values into a model
	    		longContest.setContestName(contestName);
	    		longContest.setRoundID(roundID);
	    		longContest.setRoundName(roundName);
	    		longContest.setStartTime(startTime);
	    		longContest.setEndTime(endTime);
	    		longContest.setCoderRegistered(usrRoundRegistered);
	    		longContest.setContestID(contestID);
	    		longContest.setStarted(hasStarted);
	    		longContest.setNumCompetitors(numRegs);
	    		
	    		// Get the problem assigned to the round
	    		RoundProblem prob = getRoundProblem(dai, roundID);
	    		
	    		if(prob != null) {
		    		longContest.setComponentID(prob.getComponentID());
		    		longContest.setProblemID(prob.getProblemID());
		    		longContest.setProblemName(prob.getName());
	    		}
	    		
	    		// Marks the contest as not passed
	    		longContest.setPassed(false);
	    		
	    		contests.add(longContest);
	    		
	    	}
	    	
	    	if(rsc.getRowCount() < 5) { // list some pass contests
	    		Request reqPassContests = new Request();
	    		reqPassContests.setContentHandle("long_contest_pass_contests");
		    	Map mapPassContests = dai.getData(reqPassContests);
		    	ResultSetContainer rscPassContests = (ResultSetContainer)mapPassContests.get("long_contest_pass_contests");
		    	for(int i = 0; i < rscPassContests.getRowCount(); i++) {
		    		if(rsc.getRowCount() + i + 1 >= 5) {
		    			break;
		    		}
		    		LongContestModel longContest = new LongContestModel();
		    		
		    		// Get various contest properties
		    		String contestName = rscPassContests.getStringItem(i, "contest_name");
		    		long contestID = rscPassContests.getLongItem(i, "contest_id");
		    		String roundName = rscPassContests.getStringItem(i, "round_name");
		    		long roundID = rscPassContests.getLongItem(i, "round_id");
		    		String startTime = rscPassContests.getStringItem(i, "start_time");
		    		String endTime = rscPassContests.getStringItem(i, "end_time");		    		
		    		int numRegs = getNumRegistrants(dai, roundID);
		    		boolean usrRoundRegistered = isCoderRoundRegistered(dai, roundID, usr.getId());
		    		
		    		// Store the values into a model
		    		longContest.setContestName(contestName);
		    		longContest.setRoundID(roundID);
		    		longContest.setRoundName(roundName);
		    		longContest.setStartTime(startTime);
		    		longContest.setEndTime(endTime);
		    		longContest.setCoderRegistered(usrRoundRegistered);
		    		longContest.setContestID(contestID);
		    		longContest.setNumCompetitors(numRegs);
		    		
		    		// Gets the problem for the round
		    		RoundProblem prob = getRoundProblem(dai, roundID);
		    		
		    		if(prob != null) {
			    		longContest.setComponentID(prob.getComponentID());
			    		longContest.setProblemID(prob.getProblemID());
			    		longContest.setProblemName(prob.getName());
		    		}
		    		
		    		// Marks this contest as a passed contest
		    		longContest.setPassed(true);
		    		
		    		contests.add(longContest);
		    		
		    	}
	    	}
	    	
	    	
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	
    	// Store the contests in the http request
    	getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);
    	
    	setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
    	setIsNextPageInContext(true);
    }
    
    /**
     * Gets the number of registrants for a specified round.
     * @param dai			Data source
     * @param roundID		The round's ID
     * @return				The number of registrants for a given round 
     * @throws Exception
     */
    private int getNumRegistrants(DataAccessInt dai, long roundID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	try {    	
	    	r.setContentHandle("long_contest_num_registered");
	    	r.setProperty("rd", "" + roundID);	    	
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_num_registered");
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: long_contest_num_registered", e);
    		throw e;
    	}
    	return rsc.getIntItem(0,0);
    }
    
    /**
     * Determines whether the coder is registered for the specified round.
     * @param dai			Data source
     * @param roundID		The round's ID
     * @param coderID		The coder's ID
     * @return				True if the coder is registered for the specified round, false otherwise.
     * @throws Exception	Propagates unexpected exceptions
     */
    private boolean isCoderRoundRegistered(DataAccessInt dai, long roundID, long coderID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	log.debug("isCoderRoundRegistered called w/ roundID=" + roundID + " coderID=" + coderID);
    	try {
	    	r.setContentHandle("long_contest_coder_registered");
	    	r.setProperty("rd", "" + roundID);
	    	r.setProperty("cr", "" + coderID);	    	
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_coder_registered");
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: long_contest_coder_registered", e);
    		throw e;
    	}
    	return rsc.getIntItem(0,0) > 0;
    }
    
    /**
     * Gets the problem for the specified round
     * @param dai			Data source
     * @param roundID		The round ID
     * @return				The problem for the round
     * @throws Exception	Propagates unexpected exceptions
     */
    protected RoundProblem getRoundProblem(DataAccessInt dai, long roundID) throws Exception {
    	Request r = new Request();
    	ResultSetContainer rsc;
    	RoundProblem ret = null;
    	try {    	
	    	r.setContentHandle("long_contest_round_problems");
	    	r.setProperty("rd", "" + roundID);	    	
	    	Map m = dai.getData(r);    	
	    	rsc = (ResultSetContainer)m.get("long_contest_round_problems");
	    	System.out.println("Getting problem for: " + roundID);
	    	System.out.println("# of associated questions: " + rsc.size());
	    	if(rsc.size() > 0) {
	    		ret = new RoundProblem();
	    		ret.setComponentID(rsc.getLongItem(0, "component_id"));
	    		ret.setProblemID(rsc.getLongItem(0, "problem_id"));
	    		ret.setName(rsc.getStringItem(0, "name"));
	    	}
    	} catch(Exception e) {
    		log.error("Error occured executing DB command: long_contest_coder_registered", e);
    		throw e;
    	}
    	return ret;
    }

    /**
     * Wraps the round problem data
     * @author farsight     
     */
    protected static class RoundProblem {
    	
    	private long componentID;
    	private long problemID;
    	private String name;
    	
		public long getComponentID() {
			return componentID;
		}
		public void setComponentID(long componentID) {
			this.componentID = componentID;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public long getProblemID() {
			return problemID;
		}
		public void setProblemID(long problemID) {
			this.problemID = problemID;
		}
		
    }
}
