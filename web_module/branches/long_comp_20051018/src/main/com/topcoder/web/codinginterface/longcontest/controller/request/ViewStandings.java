package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Arrays;
import java.util.Map;
import java.util.TreeSet;
import java.util.Vector;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.StandingModel;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

public class ViewStandings extends Base {

	protected static final Logger log = Logger.getLogger(ViewStandings.class);

	protected void businessProcessing() throws TCWebException {
		TCRequest request = getRequest();
		String roundID = request.getParameter("roundID");
		Vector standings = new Vector();
		int numRegistrants = 0;
		String contestName = "";
		
		try {
			if(roundID == null) {
				
			} else {
				DataAccessInt dai = new CachedDataAccess(DBMS.OLTP_DATASOURCE_NAME);
				
				Request r = new Request();
				r.setContentHandle("long_contest_round_information");
				r.setProperty("rd", "" + roundID);
				Map m = dai.getData(r);
				ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_round_information");
				contestName = rsc.getStringItem(0, "contest_name");
				
				r = new Request();
				r.setContentHandle("long_contest_round_standings");
				r.setProperty("rd", "" + roundID);
				
				m = dai.getData(r);
				rsc = (ResultSetContainer) m.get("long_contest_round_standings");
				
				TreeSet points = new TreeSet();
				
				for(int i = 0; i < rsc.getRowCount(); i++) {
					StandingModel sm = new StandingModel();
					
					sm.setHandle(rsc.getStringItem(i, "handle"));
					sm.setRoundID(rsc.getLongItem(i, "round_id"));
					sm.setCoderID(rsc.getLongItem(i, "coder_id"));
					if(!isNull(rsc, i, "component_state_id")) {
						sm.setComponentStateID(rsc.getLongItem(i, "component_state_id"));
					}
					if(!isNull(rsc, i, "component_id")) {
						sm.setComponentID(rsc.getLongItem(i, "component_id"));
					}
					if(!isNull(rsc, i, "points")) {
						sm.setPoints(rsc.getDoubleItem(i, "points"));
					}
					if(!isNull(rsc, i, "submission_number")) {
						sm.setSubmissionNumber(rsc.getIntItem(i, "submission_number"));
					}
					
					standings.add(sm);
					
					points.add(new Double(sm.getPoints()));
				}
				
				numRegistrants = rsc.getRowCount();
				
				Double rankings[] = (Double [])points.toArray(new Double[0]);
				
				for(int i = 0; i < standings.size(); i++) {
					StandingModel sm = (StandingModel)standings.elementAt(i);
					sm.setRank(Arrays.binarySearch(rankings, new Double(sm.getPoints())));					
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new TCWebException("Error retrieving page.");
		}
		
		request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, standings);
		request.setAttribute(Constants.NUM_REGISTRANTS_KEY, "" + numRegistrants);
		request.setAttribute(Constants.CONTEST_NAME_KEY, contestName);
		request.setAttribute(Constants.PREV_IDX_KEY, "0");
		request.setAttribute(Constants.NEXT_IDX_KEY, "5");
		
    	setNextPage(Constants.PAGE_STANDINGS);
    	setIsNextPageInContext(true);
	}
	
	private boolean isNull(ResultSetContainer r, int row, String colName) {
		return r.getItem(row, colName).getResultData() == null;
	}
}