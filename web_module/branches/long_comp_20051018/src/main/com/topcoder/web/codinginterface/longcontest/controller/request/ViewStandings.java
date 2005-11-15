package com.topcoder.web.codinginterface.longcontest.controller.request;

import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;
import java.util.TreeSet;
import java.util.Vector;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.StandingModel;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

/**
 * Displays standings for a given round.
 *
 * @author farsight
 * @version 1.0
 */ 
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

		int maxResults = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);
		
		// Give variables default values
		if(primaryCol == null) primaryCol = Constants.SCORE_COL;
		if(sortOrd == null) sortOrd = "asc";
		if(startRow == null) startRow = "0";
		
		int startRowIdx = Integer.parseInt(startRow);
		
		try {
			
			DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
			
			if (roundID == null) {
				// Find most recent round
				Request r = new Request();
				r.setContentHandle("long_contest_active_contests");
				Map m = dai.getData(r);
				ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_active_contests");
				if(rsc.size() == 0) { // No active contests
					getRequest().setAttribute(Constants.MESSAGE, "There are currently no active rounds.");
				} else { // Show the most recent active round
					roundID = rsc.getStringItem(0, "round_id");
				}
			} 

			// Go ahead and try to load the round's standings
			if(roundID != null) {
	
				int roundTypeID = getRoundType(dai, roundID);
				
				Request r = new Request();
				
				if(roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
					r.setContentHandle("long_contest_round_practice_standings");
				} else {
					r.setContentHandle("long_contest_round_standings");
				}
				
				r.setProperty("rd", roundID);
	
				Map m = dai.getData(r);
				
				// Does this round exist?
				if( ((ResultSetContainer)m.get("long_contest_round_information")).size() == 0) {
					throw new NavigationException("Invalid round specified.");
				}
				
				// Round started yet?
				boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
				boolean over = ((ResultSetContainer) m.get("long_contest_over")).getBooleanItem(0, 0);
				
				// If this is a practice contest than let it pass
				
				if(roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
					started = true;
					over = false;
				}
				
				if (!started) {
					throw new NavigationException("Invalid round specified.");
				} else if (over){ // go to overview page
					String url = buildProcessorRequestString("ViewOverview", new String[] {Constants.ROUND_ID }, new String[] { roundID});
					log.debug("Going to overview page: " + url);
					setNextPage(url);
					setIsNextPageInContext(false);
					return;
				} else {
					
					// Get contest's name										
					contestName = ((ResultSetContainer) m.get("long_contest_round_information")).getStringItem(0, "contest_name");
					
					ResultSetContainer rsc;
					
					if(roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
						rsc = (ResultSetContainer) m.get("long_contest_round_practice_standings");
					} else {
						rsc = (ResultSetContainer) m.get("long_contest_round_standings");
					}
					
					TreeSet points = new TreeSet();
	
					// Iterate through the coder's standing
					for (int i = 0; i < rsc.getRowCount(); i++) {
						StandingModel sm = new StandingModel();
	
						// Fill in the standing's data
						sm.setHandle(rsc.getStringItem(i, "handle"));
						sm.setRoundID(rsc.getLongItem(i, "round_id"));
						sm.setCoderID(rsc.getLongItem(i, "coder_id"));
						if (!isNull(rsc, i, "component_state_id")) {
							sm.setComponentStateID(rsc.getLongItem(i, "component_state_id"));
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
	
						// add the model to the collection of standings...
						standings.add(sm);
	
						// we remember the possible point scores to determine rank later on...
						points.add(new Double(sm.getPoints()));
					}
	
					// Here we're giving each coder a rank
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
		request.setAttribute(Constants.CONTEST_NAME_KEY, StringUtils.checkNull(contestName));
		request.setAttribute(Constants.PREV_IDX_KEY, prevStartRow);
		request.setAttribute(Constants.NEXT_IDX_KEY, nextStartRow);
		request.setAttribute(Constants.ROUND_ID, roundID);
		request.setAttribute(Constants.PRIMARY_COLUMN, primaryCol);
		request.setAttribute(Constants.SORT_ORDER, sortOrd);
		request.setAttribute(Constants.START_ROW, startRow);
		
		setNextPage(Constants.PAGE_STANDINGS);
		setIsNextPageInContext(true);
	}
	
	/**
	 * Get's the round type attribute for the specified round.
	 * @param dai 			Data access
	 * @param roundID		The specified round
	 * @return				The round type of the specified round
	 * @throws Exception	Propagates exceptions
	 */
	private int getRoundType(DataAccessInt dai, String roundID) throws Exception {
		Request r = new Request();
		r.setContentHandle("long_contest_round_information");
		r.setProperty("rd", roundID);
		
		Map m = dai.getData(r);
		
		ResultSetContainer rsc =(ResultSetContainer) m.get("long_contest_round_information");
		
		if(rsc.getRowCount() == 0) {
			return -1;
		} else {		
			return rsc.getIntItem(0, "round_type_id");			
		}
	}
	
	private boolean isNull(ResultSetContainer r, int row, String colName) {
		return r.getItem(row, colName).getResultData() == null;
	}

	// Comparator used to sort standing models
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
				ret = sm1.getHandle().toLowerCase().compareTo(sm2.getHandle().toLowerCase());
			} else if(cf == 1) {
				if(sm1.getPoints() == sm2.getPoints()) {
					ret = 0;
				} else ret = (sm1.getPoints() > sm2.getPoints() ? -1 : 1); 
			} else if(cf == 2) {
				ret = sm2.getRank() - sm1.getRank();
			} else if(cf == 3) {
				ret = sm1.getSubmissionNumber() - sm2.getSubmissionNumber();
			}
			
			if(ret == 0) return sm1.getHandle().toLowerCase().compareTo(sm2.getHandle().toLowerCase()); // The tie breaker
			
			return ret * asc;
		}
	}
}