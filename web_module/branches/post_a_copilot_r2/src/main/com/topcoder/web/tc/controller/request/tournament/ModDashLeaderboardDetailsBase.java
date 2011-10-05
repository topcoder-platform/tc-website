/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
 * <p>This class calculates and presents TCO Mod Dash leaderboard details page.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since 2009 TopCoder Open Site Integration 1.1
 */
public abstract class ModDashLeaderboardDetailsBase extends Base {

    /**
     * <p>A <code>String</code> representing full list request parameter name.</p>
     */
    public static final String FULL_LIST = "full";

    /**
     * <p>A <code>int</code> representing the index for issue key column.</p>
     */
    public static final int ISSUE_KEY_COL = 1;

    /**
     * <p>A <code>int</code> representing the index for points column.</p>
     */
    public static final int POINTS_COL = 2;

    /**
     * <p>A <code>int</code> representing the index for created column.</p>
     */
    public static final int CREATED_COL = 3;

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
        return "dd_mod_dash_tco_leaderboard_user_detail";
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
        return "/tournaments/" + getContestPrefix() + "/moddash/advancers/leaderboardDetails.jsp";
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
     * - Sorting
     * - Cropping
     * 
     * @param result the result of the command execution
     * @throws TCWebException if an error occurs
     */
    protected void processResult(Map result) throws TCWebException {
        ResultSetContainer rsc = (ResultSetContainer) result.get(getCommandName());

        // There is no need to check if the user is registered to the tournament.
        // The url won't be linked from the leaderboard and if he cames up
        // building the url, he'll see his completed projects, but they still won't count
        // towards the leaderboard.
        List<ModDashLeaderBoardDetailRow> results = processResults(rsc);        

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
     * @return a <code>List<ModDashLeaderBoardDetailRow></code> with the cropped results
     */
    private List<ModDashLeaderBoardDetailRow> cropResult(List<ModDashLeaderBoardDetailRow> results) {
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
     * This method creates corresponding beans from the retrieved data
     * 
     * @param rsc The ResultSetContainer with the DB query results
     * @return a <code>List<ModDashLeaderBoardDetailRow></code> with the results
     */
    private List<ModDashLeaderBoardDetailRow> processResults(ResultSetContainer rsc) {
        List <ModDashLeaderBoardDetailRow> leaderBoard = new ArrayList<ModDashLeaderBoardDetailRow>(rsc.size());
        for (ResultSetRow rsr: rsc) {
            leaderBoard.add(new ModDashLeaderBoardDetailRow(rsr.getStringItem("issue_key"),
                rsr.getIntItem("tco_points"), rsr.getIntItem("project"),
                rsr.getTimestampItem("created")));
        }

        return leaderBoard;
    }

    /**
     * Private helper method to sort the results 
     * 
     * @param result the list of ModDashLeaderBoardDetailRow to sort 
     * @param sortCol the sort column 
     * @param invert true if an inverted list is requested
     */
    protected void sortResult(List<ModDashLeaderBoardDetailRow> result, String sortCol, boolean invert) {
        if (result.size() == 0) {
            return;
        }

        if (sortCol.equals(String.valueOf(ISSUE_KEY_COL))) {
            Collections.sort(result, new Comparator<ModDashLeaderBoardDetailRow>() {
                public int compare(ModDashLeaderBoardDetailRow arg0, ModDashLeaderBoardDetailRow arg1) {
                    return arg0.getIssueKey().toLowerCase().compareTo(arg1.getIssueKey().toLowerCase());
                }
            });
        } else if (sortCol.equals(String.valueOf(CREATED_COL))) {
            Collections.sort(result, new Comparator<ModDashLeaderBoardDetailRow>() {
                public int compare(ModDashLeaderBoardDetailRow arg0, ModDashLeaderBoardDetailRow arg1) {
                    return arg0.getCreated().compareTo(arg1.getCreated());
                }
            });
        } else {
            // Default, sort by points.
            Collections.sort(result, new Comparator<ModDashLeaderBoardDetailRow>() {
                public int compare(ModDashLeaderBoardDetailRow arg0, ModDashLeaderBoardDetailRow arg1) {
                    return arg0.getPoints().compareTo(arg1.getPoints());
                }
            });
        }

        if (invert) {
            Collections.reverse(result);
        }
        
        SortInfo s = new SortInfo();
        s.addDefault(ISSUE_KEY_COL, "asc"); // handle lower
        s.addDefault(POINTS_COL, "desc"); // points
        s.addDefault(CREATED_COL, "asc"); // created
        
        getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
    }
}
