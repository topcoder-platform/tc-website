package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.codinginterface.longcontest.model.RoundDisplayNameCalculator;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
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
        String sortCol = StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_COLUMN));
        String sortOrd = StringUtils.checkNull(request.getParameter(DataAccessConstants.SORT_DIRECTION));
        String startRank = StringUtils.checkNull(request.getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(request.getParameter(DataAccessConstants.NUMBER_RECORDS));

        try {

            DataAccessInt dai = getDataAccess();

            if (roundID == null) {
                // Find most recent round
                Request r = new Request();
                r.setContentHandle("long_contest_active_contests_user");
				r.setProperty(Constants.CODER_ID, String.valueOf(getUser().getId()));
                Map m = dai.getData(r);
                ResultSetContainer rsc = (ResultSetContainer) m.get("long_contest_active_contests_user");
                if (rsc.size() == 0) { // No active contests
                    getRequest().setAttribute(Constants.MESSAGE, "There are currently no active rounds.");
                } else { // Show the most recent active round
                    roundID = rsc.getStringItem(0, "round_id");
                }
            }

            // Go ahead and try to load the round's standings
            if (roundID != null) {
                setDefault(Constants.ROUND_ID, roundID);
                int roundTypeID = ((Integer)request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();

                Request r = new Request();

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID ||
                        roundTypeID == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID ||
                        roundTypeID == Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
                    r.setContentHandle("long_contest_round_practice_standings");
                    //r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_round_practice_standings");
                } else {
                    r.setContentHandle("long_contest_round_standings");
                    //r.setProperty(DataAccessConstants.SORT_QUERY, "long_contest_round_standings");
                }
                r.setProperty("rd", roundID);

                Map<String, ResultSetContainer> m = dai.getData(r);

                // Does this round exist?
                ResultSetContainer info = m.get("long_contest_round_information"); 
                if (info.isEmpty()) {
                    throw new NavigationException("Invalid round specified.");
                }

                ResultSetContainer infoRsc = new ResultSetContainer(m.get("long_contest_round_information"), new RoundDisplayNameCalculator("display_name"));
                if (infoRsc.size() == 0) {
                    throw new NavigationException("Couldn't find round info for round " +roundID);
                }
                
                request.setAttribute("infoRow", infoRsc.get(0));

                // Round started yet?
                boolean started = ((ResultSetContainer) m.get("long_contest_started")).getBooleanItem(0, 0);
                boolean over = isRoundOver(Long.parseLong(roundID));

                // If this is a practice contest than let it pass

                if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID ||
                        roundTypeID == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID ||
                        roundTypeID == Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
                    started = true;
                    over = false;
                }

                if (!started) {
                    throw new NavigationException("Invalid round specified.");
                } else if (over&&areResultsAvailable(Long.parseLong(roundID))) { // go to overview page
//                    String url = buildProcessorRequestString("ViewOverview", new String[]{Constants.ROUND_ID}, new String[]{roundID});
                    String url = "/longcontest/stats/?module=ViewOverview&rd=" + roundID;
                    log.debug("Going to overview page: " + url);
                    setNextPage(url);
                    setIsNextPageInContext(false);
                } else {
                    // Get contest's name
                    ResultSetContainer standings;
                    if (roundTypeID == Constants.LONG_PRACTICE_ROUND_TYPE_ID ||
                            roundTypeID == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID ||
                            roundTypeID == Constants.AMD_LONG_PRACTICE_ROUND_TYPE_ID) {
                        standings = (ResultSetContainer) m.get("long_contest_round_practice_standings");
                    } else {
                        standings = (ResultSetContainer) m.get("long_contest_round_standings");
                    }

                    SortInfo s = new SortInfo();
                    s.addDefault(standings.getColumnIndex("rank"), "asc");
                    s.addDefault(standings.getColumnIndex("handle_lower"), "asc");
                    s.addDefault(standings.getColumnIndex("points"), "desc");
                    s.addDefault(standings.getColumnIndex("submission_number"), "desc");
                    s.addDefault(standings.getColumnIndex("submit_time"), "desc");
                    getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                    if (!sortCol.equals("") && !sortOrd.equals("")) {
                        standings.sortByColumn(Integer.parseInt(sortCol), "asc".equals(sortOrd));

                    }

                    if (numRecords.equals("")) {
                        numRecords = Constants.DEFAULT_ROW_COUNT;
                    } else if (Integer.parseInt(numRecords) > Integer.parseInt(Constants.DEFAULT_ROW_COUNT)) {
                        numRecords = Constants.DEFAULT_ROW_COUNT;
                    }
                    setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);

                    if (startRank.equals("")) {
                        startRank="1";
                    }
                    setDefault(DataAccessConstants.START_RANK, startRank);
                    if (Integer.parseInt(startRank)>1 || standings.size()>Integer.parseInt(numRecords)) {
                        standings = new ResultSetContainer(standings, Integer.parseInt(startRank),
                                Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1);
                    }
                    
                    if (isRoundExclusive(Long.parseLong(roundID)) && !getSessionInfo().isAdmin() && !isUserRegistered(getUser().getId(), Long.parseLong(roundID)))
                    {
                    	throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                    }
                    
                    request.setAttribute(Constants.ROUND_STANDINGS_LIST_KEY, standings);
                    request.setAttribute(Constants.ROUND_ID, roundID);
                    request.setAttribute("isIntel", roundTypeID == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID || roundTypeID == Constants.INTEL_LONG_ROUND_TYPE_ID);
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