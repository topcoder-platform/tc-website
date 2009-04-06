/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * <p>This class calculates and presents TCO Mod Dash leaderboard page.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public abstract class ModDashLeaderboardBase extends Base {

    /**
     * <p>A <code>String</code> representing full list request parameter name.</p>
     */
    public static final String FULL_LIST = "full";

    /**
     * <p>A <code>int</code> representing the index for handle column.</p>
     */
    public static final int HANDLE_COL = 1;

    /**
     * <p>A <code>int</code> representing the index for points column.</p>
     */
    public static final int POINTS_COL = 2;

    /**
     * Gets the contest prefix. It will be used mainly for the jsp path but could be used for 
     * other purposes as well. 
     * Example: tco07, tccc07, etc.
     * 
     * @return the contest prefix
     */
    protected abstract String getContestPrefix();
    
    /**
     * Gets the command name to be retrieved.
     * 
     * @return the command name
     */
    protected String getCommandName() {
        return "dd_mod_dash_tco_leaderboard";
    }

    /**
     * Gets the datasource from where to retrieve the command
     * 
     * @return the datasource name
     */
    protected String getDataSourceName() {
        return DBMS.JIRA_DATASOURCE_NAME;
    }

    /**
     * Gets the page that will show the leaderboard
     * 
     * @return the page
     */
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/moddash/advancers/leaderboard.jsp";
    }

    /**
     * This method provides generic processing for the board. 
     * It will execute a Query Tool command, and delegate processing to <code>processResult()</code> 
     */
    @Override
    protected void developmentProcessing() throws TCWebException {
        Request dataRequest = new Request();
        Map map = getRequest().getParameterMap();
        HashMap filteredMap = new HashMap();
        Map.Entry me = null;
        for (Iterator it = map.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (!me.getKey().equals(Constants.MODULE_KEY) &&
                    !me.getKey().equals(DataAccessConstants.SORT_COLUMN) &&
                    !me.getKey().equals(DataAccessConstants.SORT_DIRECTION)) {
                filteredMap.put(me.getKey(), me.getValue());
            }
        }

        try {
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle(getCommandName());
            DataAccessInt dai = getDataAccess(getDataSourceName(), false);
            Map result = dai.getData(dataRequest);

            processResult(result);

            String nextPage = getPageName();
            setNextPage(nextPage);
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    /**
     * This method will process the DB results including:
     * - Eliminating non eligible competitors
     * - Sorting (including tie breaks)
     * - Cropping
     * 
     * @param result the result of the command execution
     * @throws TCWebException if an error occurs
     */
    protected void processResult(Map result) throws com.topcoder.web.common.TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        // first thing we need to do remove non eligible competitors (not registered or marked non eligible)
        List<ModDashLeaderBoardRow> results = removeNonEligibles(rsc);        

        // sort
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        sortResult(results, sortCol, !"asc".equals(sortDir));
        
        // crop
        results = cropResult(results);
        
        getRequest().setAttribute("results", results);
    }

    /**
     * This method will crop results according to request parameters
     * 
     * @param results the complete list of results
     * @return a <code>List<ModDashLeaderBoardRow></code> with the cropped results
     */
    private List<ModDashLeaderBoardRow> cropResult(List<ModDashLeaderBoardRow> results) {
        Boolean full = "true".equals(StringUtils.checkNull(getRequest().getParameter(FULL_LIST)));
        getRequest().setAttribute(FULL_LIST, full);        

        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String numRecords = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.NUMBER_RECORDS));

        if ("".equals(numRecords)) {
            numRecords = "50";
        } else if (Integer.parseInt(numRecords) > 200) {
            numRecords = "200";
        }
   
        if (startRank.equals("") || Integer.parseInt(startRank) <= 0) {
            startRank = "1";
        }
   
        setDefault(DataAccessConstants.START_RANK, startRank);
        setDefault(DataAccessConstants.NUMBER_RECORDS, numRecords);
   
        int endRank = Integer.parseInt(startRank) + Integer.parseInt(numRecords) - 1;

        Boolean croppedDataAfter = Boolean.TRUE;
        if (endRank >= results.size()) {
            endRank = results.size();
            croppedDataAfter = Boolean.FALSE;
        }
        getRequest().setAttribute("croppedDataAfter", croppedDataAfter);        
        getRequest().setAttribute("croppedDataBefore", new Boolean(Integer.parseInt(startRank) > 1));
        

        if (results.size() == 0 || full) {
            return results;
        } else {
            return results.subList(Integer.parseInt(startRank) - 1, endRank);
        }
            
    }

    /**
     * This method creates corresponding beans from the retrieved data eliminating
     * those who are not eligible for this competitions
     * 
     * @param rsc The ResultSetContainer with the DB query results
     * @return a <code>List<ModDashLeaderBoardRow></code> with the results
     */
    private List<ModDashLeaderBoardRow> removeNonEligibles(ResultSetContainer rsc) throws TCWebException {
        // First thing is to check if competitors are registered before adding the
        // corresponding row to the leaderboard
        Set<String> registrants = getRegistrants();
        
        List <ModDashLeaderBoardRow> leaderBoard = new ArrayList<ModDashLeaderBoardRow>(rsc.size());
        for (ResultSetRow rsr: rsc) {
            if (registrants.contains(rsr.getStringItem("handle").toLowerCase())) {
                leaderBoard.add(new ModDashLeaderBoardRow(rsr.getStringItem("handle"),
                        rsr.getIntItem("tco_points"), rsr.getIntItem("num_competitions"),
                        rsr.getTimestampItem("last_competition")));
            }
        }

        return leaderBoard;
    }

    /**
     * Private helper method to retrieve tournament registrants 
     * 
     * @return a <code>Set<String></code> with all registrants handles
     */
    private Set<String> getRegistrants() throws TCWebException {
        Set<String> registrants = new HashSet<String>();
        Request dataRequest = new Request();
        Map<String, ResultSetContainer> result;
        try {
            dataRequest.setContentHandle(getContestPrefix() + "_registrants");

            DataAccessInt dai = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, true);
            result = dai.getData(dataRequest);

        } catch (Exception e) {
            throw new TCWebException(e);
        }

        ResultSetContainer rscRegistrants = (ResultSetContainer) result.get(getContestPrefix() + "_registrants");

        for (ResultSetRow rsr : rscRegistrants) {
            registrants.add(rsr.getStringItem("handle_lower"));
        }
        
        return registrants;
    }

    /**
     * Private helper method to sort the results
     * 
     * Tie breaker is also considered
     * 
     * @param result the list of ModDashLeaderBoardRow to sort 
     * @param sortCol the sort column 
     * @param invert true if an inverted list is requested
     */
    protected void sortResult(List<ModDashLeaderBoardRow> result, String sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        if (sortCol.equals(String.valueOf(HANDLE_COL))) {
            Collections.sort(result, new Comparator<ModDashLeaderBoardRow>() {
                public int compare(ModDashLeaderBoardRow arg0, ModDashLeaderBoardRow arg1) {
                    return arg0.getHandle().toLowerCase().compareTo(arg1.getHandle().toLowerCase());
                }
            });
        } else {
            // Default, sort by points. (take into consideration tie-breaker)
            Collections.sort(result, new Comparator<ModDashLeaderBoardRow>() {
                public int compare(ModDashLeaderBoardRow arg0, ModDashLeaderBoardRow arg1) {
                    // First we check points
                    int pointsCompare = arg0.getPoints().compareTo(arg1.getPoints());
                    if (pointsCompare != 0) {
                        return pointsCompare;
                    }
                    // Finally greater number of competitions 
                    return arg0.getNumCompetitions().compareTo(arg1.getNumCompetitions());
                }
            });
        }

        if (invert) {
            Collections.reverse(result);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(HANDLE_COL, "asc"); // handle lower
        s.addDefault(POINTS_COL, "desc"); // points
        
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
