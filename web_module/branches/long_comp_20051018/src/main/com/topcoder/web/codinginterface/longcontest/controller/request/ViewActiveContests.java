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

public class ViewActiveContests extends Base{
	
    protected static final Logger log = Logger.getLogger(ViewActiveContests.class);

    protected void businessProcessing() throws TCWebException {
    	
    	User usr = getUser();
    	Vector contests = new Vector();
    	
    	System.out.println("User ID: " + usr.getId());
    	
    	try {
	    	DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
	    	
	    	Request r = new Request();
	    	r.setContentHandle("long_contest_active_contests");
	    	
	    	Map m = dai.getData(r);
	    	ResultSetContainer rsc = (ResultSetContainer)m.get("long_contest_active_contests");
	    	
	    	for(int i = 0; i < rsc.getRowCount(); i++) {
	    		
	    		LongContestModel longContest = new LongContestModel();
	    		
	    		String contestName = rsc.getStringItem(i, "contest_name");
	    		long contestID = rsc.getLongItem(i, "contest_id");
	    		String roundName = rsc.getStringItem(i, "round_name");
	    		long roundID = rsc.getLongItem(i, "round_id");
	    		String startTime = rsc.getStringItem(i, "start_time");
	    		String endTime = rsc.getStringItem(i, "end_time");
	    		boolean hasStarted = rsc.getBooleanItem(i, "started");
	    		
	    		int numRegs = getNumRegistrants(dai, roundID);
	    		boolean usrRoundRegistered = isCoderRoundRegistered(dai, roundID, usr.getId());
	    		
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
		    		
		    		String contestName = rscPassContests.getStringItem(i, "contest_name");
		    		long contestID = rscPassContests.getLongItem(i, "contest_id");
		    		String roundName = rscPassContests.getStringItem(i, "round_name");
		    		long roundID = rscPassContests.getLongItem(i, "round_id");
		    		String startTime = rscPassContests.getStringItem(i, "start_time");
		    		String endTime = rscPassContests.getStringItem(i, "end_time");
		    		
		    		int numRegs = getNumRegistrants(dai, roundID);
		    		boolean usrRoundRegistered = isCoderRoundRegistered(dai, roundID, usr.getId());
		    		
		    		longContest.setContestName(contestName);
		    		longContest.setRoundID(roundID);
		    		longContest.setRoundName(roundName);
		    		longContest.setStartTime(startTime);
		    		longContest.setEndTime(endTime);
		    		longContest.setCoderRegistered(usrRoundRegistered);
		    		longContest.setContestID(contestID);
		    		
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
		    		
		    		longContest.setPassed(true);
		    		
		    		contests.add(longContest);
		    		
		    	}
	    	}
	    	
	    	
    	} catch(Exception e) {
    		e.printStackTrace();
    		throw new TCWebException("Error retrieving page.");
    	}
    	
    	
    	getRequest().setAttribute(Constants.CONTEST_LIST_KEY, contests);
    	
    	setNextPage(Constants.PAGE_ACTIVE_CONTESTS);
    	setIsNextPageInContext(true);
    }
    
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
