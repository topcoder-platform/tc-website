package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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

    protected void longContestProcessing() throws TCWebException {

        TCRequest request = getRequest();
        String roundID = request.getParameter(Constants.ROUND_ID);
        String sortCol = request.getParameter(DataAccessConstants.SORT_COLUMN);
        String sortOrd = request.getParameter(DataAccessConstants.SORT_DIRECTION);
        String startRank = request.getParameter(DataAccessConstants.START_RANK);
        String numRecords = request.getParameter(DataAccessConstants.NUMBER_RECORDS);

        try {

            DataAccessInt dai = getDataAccess();

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





                int roundTypeID = ((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();

                Request r = new Request();

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
                    r.setContentHandle("long_contest_round_practice_standings");
                    r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_round_practice_standings");
                } else {
                    r.setContentHandle("long_contest_round_standings");
                    r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_round_standings");
                }
                r.setProperty("rd", roundID);
                if (sortCol != null && sortOrd != null) {
                    r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
                    r.setProperty(DataAccessConstants.SORT_DIRECTION, sortOrd);
                }
                if (numRecords==null) {
                    numRecords = "50";
                } else if (Integer.parseInt(numRecords) > Integer.parseInt(Constants.DEFAULT_ROW_COUNT)) {
                    numRecords = Constants.DEFAULT_ROW_COUNT;
                }
                setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

                if (startRank==null || Integer.parseInt(startRank) <= 0) {
                    startRank = "1";
                }
                setDefault(DataAccessConstants.START_RANK, startRank);

                r.setProperty(DataAccessConstants.START_RANK, startRank);
                r.setProperty(DataAccessConstants.END_RANK,
                        String.valueOf(Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1));

                Map m = dai.getData(r);

                // Does this round exist?
                if (((ResultSetContainer) m.get("long_contest_round_information")).size() == 0) {
                    throw new NavigationException("Invalid round specified.");
                }

                // Round started yet?
                boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
                boolean over = isRoundOver(Long.parseLong(roundID));

                // If this is a practice contest than let it pass

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
                    started = true;
                    over = false;
                }

                if (!started) {
                    throw new NavigationException("Invalid round specified.");
                } else if (over&&areResultsAvailable(Long.parseLong(roundID))) { // go to overview page
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

                    SortInfo s = new SortInfo();
                    s.addDefault(standings.getColumnIndex("rank"), "asc");
                    s.addDefault(standings.getColumnIndex("handle_lower"), "asc");
                    s.addDefault(standings.getColumnIndex("points"), "desc");
                    s.addDefault(standings.getColumnIndex("submission_number"), "asc");
                    getRequest().setAttribute(SortInfo.REQUEST_KEY, s);


                    if (sortCol != null) {
                        //todo consider sorting in the db
                        standings.sortByColumn(Integer.parseInt(sortCol), sortOrd.equals("asc"));
                    }

                    request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, standings);
                    request.setAttribute("roundInfo", m.get("long_contest_round_information"));
                    request.setAttribute(Constants.ROUND_ID, roundID);

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
}