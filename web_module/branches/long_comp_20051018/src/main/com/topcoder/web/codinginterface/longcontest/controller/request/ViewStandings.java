package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;

import java.util.Map;

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
        String sortCol = request.getParameter(DataAccessConstants.SORT_COLUMN);
        String sortOrd = request.getParameter(DataAccessConstants.SORT_DIRECTION);
        String startRow = request.getParameter(Constants.START_ROW);

        int maxResults = Integer.parseInt(Constants.DEFAULT_ROW_COUNT);

        // Give variables default values
        if (sortOrd == null) sortOrd = "asc";
        if (startRow == null) startRow = "0";

        int startRowIdx = Integer.parseInt(startRow);

        try {

            DataAccessInt dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);

            if (roundID == null) {
                // Find most recent round
                Request r = new Request();
                r.setContentHandle("long_contest_active_contests");
                Map m = dai.getData(r);
                ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_active_contests");
                if (rsc.size() == 0) { // No active contests
                    getRequest().setAttribute(Constants.MESSAGE, "There are currently no active rounds.");
                } else { // Show the most recent active round
                    roundID = rsc.getStringItem(0, "round_id");
                }
            }

            // Go ahead and try to load the round's standings
            if (roundID != null) {

                int roundTypeID = getRoundType(dai, roundID);

                Request r = new Request();

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
                    r.setContentHandle("long_contest_round_practice_standings");
                } else {
                    r.setContentHandle("long_contest_round_standings");
                }

                r.setProperty("rd", roundID);

                Map m = dai.getData(r);

                // Does this round exist?
                if (((ResultSetContainer) m.get("long_contest_round_information")).size() == 0) {
                    throw new NavigationException("Invalid round specified.");
                }

                // Round started yet?
                boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
                boolean over = ((ResultSetContainer) m.get("long_contest_over")).getBooleanItem(0, 0);

                // If this is a practice contest than let it pass

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
                    started = true;
                    over = false;
                }

                if (!started) {
                    throw new NavigationException("Invalid round specified.");
                } else if (over) { // go to overview page
                    String url = buildProcessorRequestString("ViewOverview", new String[]{Constants.ROUND_ID}, new String[]{roundID});
                    log.debug("Going to overview page: " + url);
                    setNextPage(url);
                    setIsNextPageInContext(false);
                } else {
                    // Get contest's name
                    ResultSetContainer standings;
                    if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
                        standings = (ResultSetContainer) m.get("long_contest_round_practice_standings");
                    } else {
                        standings = (ResultSetContainer) m.get("long_contest_round_standings");
                    }
                    String prevStartRow, nextStartRow;

                    if (startRowIdx == 0) prevStartRow = "-1";
                    else prevStartRow = "" + (startRowIdx - maxResults >= 0 ? startRowIdx - maxResults : -1);

                    if (startRowIdx + maxResults >= standings.size()) nextStartRow = "-1";
                    else nextStartRow = "" + (startRowIdx + maxResults);

                    SortInfo s = new SortInfo();
                    s.addDefault(standings.getColumnIndex("rank"), "asc");
                    s.addDefault(standings.getColumnIndex("handle_lower"), "asc");
                    s.addDefault(standings.getColumnIndex("points"), "desc");
                    s.addDefault(standings.getColumnIndex("submission_number"), "asc");
                    getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                    if (sortCol!=null) {
                        //todo consider sorting in the db
                        standings.sortByColumn(Integer.parseInt(sortCol), sortOrd.equals("asc"));
                    }

                    request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, standings);
                    request.setAttribute("roundInfo", m.get("long_contest_round_information"));
                    request.setAttribute(Constants.PREV_IDX_KEY, prevStartRow);
                    request.setAttribute(Constants.NEXT_IDX_KEY, nextStartRow);
                    request.setAttribute(Constants.ROUND_ID, roundID);
                    request.setAttribute(Constants.START_ROW, startRow);

                    setNextPage(Constants.PAGE_STANDINGS);
                    setIsNextPageInContext(true);

                }
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * Get's the round type attribute for the specified round.
     *
     * @param dai     Data access
     * @param roundID The specified round
     * @return The round type of the specified round
     * @throws Exception Propagates exceptions
     */
    private int getRoundType(DataAccessInt dai, String roundID) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_round_information");
        r.setProperty("rd", roundID);

        Map m = dai.getData(r);

        ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_round_information");

        if (rsc.getRowCount() == 0) {
            return -1;
        } else {
            return rsc.getIntItem(0, "round_type_id");
        }
    }


}