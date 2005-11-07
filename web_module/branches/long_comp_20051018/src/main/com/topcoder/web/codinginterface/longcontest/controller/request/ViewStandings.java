package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeSet;
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
import com.topcoder.web.codinginterface.longcontest.model.StandingModel;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

public class ViewStandings extends Base {

	protected static final Logger log = Logger.getLogger(ViewStandings.class);

	protected void businessProcessing() throws TCWebException {
		TCRequest request = getRequest();
		String roundID = request.getParameter(Constants.ROUND_ID);
		String primaryCol = request.getParameter(Constants.PRIMARY_COLUMN);
		String sortOrd = request.getParameter(Constants.SORT_ORDER);
		String startRow = request.getParameter(Constants.START_ROW);
		Vector standings = new Vector();
		int numRegistrants = 0;
		String contestName = "";

		int maxResults = 10;
		
		// Give variables default values
		if(primaryCol == null) primaryCol = Constants.SCORE_COL;
		if(sortOrd == null) sortOrd = "asc";
		if(startRow == null) startRow = "0";
		
		int startRowIdx = Integer.parseInt(startRow);
		
		try {
			if (roundID == null) {

			} else {
				DataAccessInt dai = new DataAccess(
						DBMS.OLTP_DATASOURCE_NAME);

				Request r = new Request();
				r.setContentHandle("long_contest_round_information");
				r.setProperty("rd", "" + roundID);
				Map m = dai.getData(r);
				ResultSetContainer rsc = (ResultSetContainer) m
						.get("long_contest_round_information");
				contestName = rsc.getStringItem(0, "contest_name");

				r = new Request();
				r.setContentHandle("long_contest_round_standings");
				r.setProperty("rd", "" + roundID);

				m = dai.getData(r);
				rsc = (ResultSetContainer) m
						.get("long_contest_round_standings");

				TreeSet points = new TreeSet();

				for (int i = 0; i < rsc.getRowCount(); i++) {
					StandingModel sm = new StandingModel();

					sm.setHandle(rsc.getStringItem(i, "handle"));
					sm.setRoundID(rsc.getLongItem(i, "round_id"));
					sm.setCoderID(rsc.getLongItem(i, "coder_id"));
					if (!isNull(rsc, i, "component_state_id")) {
						sm.setComponentStateID(rsc.getLongItem(i,
								"component_state_id"));
					}
					if (!isNull(rsc, i, "component_id")) {
						sm.setComponentID(rsc.getLongItem(i, "component_id"));
					}
					if (!isNull(rsc, i, "points")) {
						sm.setPoints(rsc.getDoubleItem(i, "points"));
					}
					if (!isNull(rsc, i, "submission_number")) {
						sm.setSubmissionNumber(rsc.getIntItem(i,
								"submission_number"));
					}

					standings.add(sm);

					points.add(new Double(sm.getPoints()));
				}

				numRegistrants = rsc.getRowCount();

				Double rankings[] = (Double[]) points.toArray(new Double[0]);

				for (int i = 0; i < standings.size(); i++) {
					StandingModel sm = (StandingModel) standings.elementAt(i);
					sm.setRank(Arrays.binarySearch(rankings, new Double(sm
							.getPoints())));
				}

				// Sort results
				Comparator comp = new StandingModelComparator(primaryCol, sortOrd.equals("asc"));
				
				Collections.sort(standings, comp);
				
				// Return a subset of the results
				Vector temp = new Vector();
				
				for(int i = startRowIdx; i < standings.size(); i++) {
					if(i == startRowIdx + maxResults) break;
					temp.add(standings.elementAt(i));
				}
				standings = temp;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new TCWebException("Error retrieving page.");
		}

		// Compute the next and prev start rows
		String prevStartRow, nextStartRow;
		
		if(startRowIdx == 0) prevStartRow = "-1";
		else prevStartRow = "" + (startRowIdx - maxResults >= 0 ? startRowIdx - maxResults : -1);
		
		if(startRowIdx + maxResults >= numRegistrants) nextStartRow = "-1";
		else nextStartRow = "" + (startRowIdx + maxResults);
		
		request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, standings);
		request.setAttribute(Constants.NUM_REGISTRANTS_KEY, "" + numRegistrants);
		request.setAttribute(Constants.CONTEST_NAME_KEY, contestName);
		request.setAttribute(Constants.PREV_IDX_KEY, prevStartRow);
		request.setAttribute(Constants.NEXT_IDX_KEY, nextStartRow);
		request.setAttribute(Constants.ROUND_ID, roundID);
		request.setAttribute(Constants.PRIMARY_COLUMN, primaryCol);
		request.setAttribute(Constants.SORT_ORDER, sortOrd);
		request.setAttribute(Constants.START_ROW, startRow);
		
		setNextPage(Constants.PAGE_STANDINGS);
		setIsNextPageInContext(true);
	}
	
	private boolean isNull(ResultSetContainer r, int row, String colName) {
		return r.getItem(row, colName).getResultData() == null;
	}

	static class StandingModelComparator implements Comparator {
		
		int cf = 1;
		int asc = 1;
		
		public StandingModelComparator(String comp, boolean asc) {
			if(comp.equals(Constants.HANDLE_COL)) { // sort by handle
				cf = 0;
			} else if(comp.equals(Constants.SCORE_COL)) { // sort by score
				cf = 1;
			} else if(comp.equals(Constants.RANK_COL)) { // sort by rank
				cf = 2;
			} else if(comp.equals(Constants.SUBMISSION_COL)) { // sort by # submissions
				cf = 3;
			} else {
				cf = 1;
			}
			this.asc = (asc ? 1 : -1);
		}
		
		public int compare(Object a, Object b) {
			
			StandingModel sm1 = (StandingModel) a;
			StandingModel sm2 = (StandingModel) b;
			int ret = 0;
			
			if(cf == 0) {
				ret = sm1.getHandle().compareTo(sm2.getHandle());
			} else if(cf == 1) {
				if(sm1.getPoints() == sm2.getPoints()) {
					ret = 0;
				} else ret = (sm1.getPoints() > sm2.getPoints() ? -1 : 1); 
			} else if(cf == 2) {
				ret = sm2.getRank() - sm1.getRank();
			} else if(cf == 3) {
				ret = sm1.getSubmissionNumber() - sm2.getSubmissionNumber();
			}
			
			if(ret == 0) ret = sm1.getHandle().compareTo(sm2.getHandle()); // The tie breaker
			
			return ret * asc;
		}
	}
}