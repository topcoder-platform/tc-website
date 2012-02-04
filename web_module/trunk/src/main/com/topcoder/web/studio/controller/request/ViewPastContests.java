/*
 * Copyright (C) 2005-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.text.SimpleDateFormat;
import java.util.Map;

/**
 * <p>This class will process a request to view past contests.</p>
 *
 * <p>
 *   Version 1.1 (BUGR-2786) Change notes:
 *   <ol>
 *     <li>
 *          Added sort order for milestone_date column.
 *     </li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.2 (Replatforming Studio Release 1 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated the {@link #businessProcessing()} method to set the request with list of contests which have 
 *     eligibility constraints and flags indicating if current user is granted permission to access those contests or
 *     not.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.3 (TopCoder Studio Contest Listings Assembly) Change notes:
 *   <ol>
 *     <li>Added the logic to support filtering and multi-column sorting.</li>
 *   </ol>
 * </p>
 * 
 * @author dok, pulky, isv, duxiaoyang
 * @version 1.3
 */
public class ViewPastContests extends BaseProcessor {

    /**
     * Represents the default sort priority. It is a list containing column numbers.
     */
    private static final List<Integer> DEFAULT_SORT_PRIORITY = new LinkedList<Integer>();

    /**
     * Represents the default sort direction. It is a map with column number as key and a boolean indicating whether the
     * column is in ascending order as value.
     */
    private static final Map<Integer, Boolean> DEFAULT_SORT_DIRECTION = new HashMap<Integer, Boolean>();

    /**
     * Represents number of milliseconds in a day.
     */
    private static final long MILLISECOND_IN_A_DAY = 24 * 60 * 60 * 1000;

    /**
     * <p>
     * Static initializer. It initializes default sort priority and direction.
     * </p>
     */
    static {
        DEFAULT_SORT_PRIORITY.add(1);           // name
        DEFAULT_SORT_DIRECTION.put(1, true);
        DEFAULT_SORT_PRIORITY.add(3);           // type_name
        DEFAULT_SORT_DIRECTION.put(3, true);
        DEFAULT_SORT_PRIORITY.add(4);           // start_time
        DEFAULT_SORT_DIRECTION.put(4, true);
        DEFAULT_SORT_PRIORITY.add(5);           // end_time
        DEFAULT_SORT_DIRECTION.put(5, true);
        DEFAULT_SORT_PRIORITY.add(14);          // first_place
        DEFAULT_SORT_DIRECTION.put(14, true);
        DEFAULT_SORT_PRIORITY.add(22);          // winner_count
        DEFAULT_SORT_DIRECTION.put(22, true);
        DEFAULT_SORT_PRIORITY.add(11);          // registrants
        DEFAULT_SORT_DIRECTION.put(11, true);
        DEFAULT_SORT_PRIORITY.add(10);          // show_submissions
        DEFAULT_SORT_DIRECTION.put(10, true);
        DEFAULT_SORT_PRIORITY.add(24);          // eligible_submissions
        DEFAULT_SORT_DIRECTION.put(24, true);
    }

    /**
     * <p>Implements the logic for processing the request.</p>
     * 
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        long userId = getUser().getId();
        
        // load up the contests
        DataAccess da = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("studio_past_contests_multi_sort");
        r.setProperty("uid", String.valueOf(userId));

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String order = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String query = getRequest().getQueryString();
        query = removeParameter(query, "pageSize");
        query = removeParameter(query, "pageNum");
        query = removeParameter(query, DataAccessConstants.SORT_COLUMN);
        query = removeParameter(query, DataAccessConstants.SORT_DIRECTION);
        query = removeParameter(query, SortingHelper.SORTING_CRITERIA_KEY);

        List<Integer> sortPriority = new ArrayList<Integer>(DEFAULT_SORT_PRIORITY);
        Map<Integer, Boolean> sortDirection = new HashMap<Integer, Boolean>(DEFAULT_SORT_DIRECTION);
        if (!"".equals(col)) {
            if (getRequest().getParameter(SortingHelper.SORTING_CRITERIA_KEY) != null) {
                SortingHelper.parseSortingParameter(
                        (String) getRequest().getParameter(SortingHelper.SORTING_CRITERIA_KEY), sortPriority,
                        sortDirection);
            }
            order = SortingHelper.changeSortingOrder(sortPriority, sortDirection, Integer.parseInt(col), order);
        }
        
        String sortCriteria = SortingHelper.getSortingClause(sortPriority, sortDirection);
        r.setProperty(SortingHelper.MULTI_SORTING_KEY, sortCriteria);
        r.setProperty(DataAccessConstants.SORT_QUERY, "studio_past_contests_multi_sort");

        SimpleDateFormat df1 = new SimpleDateFormat("MM/dd/yyyy");
        SimpleDateFormat df2 = new SimpleDateFormat("yyyy-MM-dd");

        String[] contestTypes = getRequest().getParameterValues("contestType");
        String startDate = getRequest().getParameter("startDate");
        String startTime = getRequest().getParameter("startDateTime");
        String endDate = getRequest().getParameter("endDate");
        String endTime = getRequest().getParameter("endDateTime");
        if (contestTypes == null || contestTypes.length == 0) {
            contestTypes = new String[] {"16", "17", "18", "20", "21", "22", "30", "31", "32", "34"};
            startDate = df1.format(new Date(new Date().getTime() - 45 * MILLISECOND_IN_A_DAY));
            startTime = "01:00";
            endDate = df1.format(new Date());
            endTime = "01:00";
            StringBuilder sb = new StringBuilder();
            for (String contestType : contestTypes) {
                sb.append("&contestType=" + contestType);
            }
            sb.append("&startDate=" + startDate);
            sb.append("&startDateTime=" + startTime);
            sb.append("&endDate=" + endDate);
            sb.append("&endDateTime=" + endTime);
            query += sb.toString();
        }
        StringBuilder sb = new StringBuilder();
        for (String contestType : contestTypes) {
            sb.append(contestType).append(",");
        }
        r.setProperty("pcids", sb.substring(0, sb.length() - 1));
        getRequest().setAttribute("contestType", "," + sb.toString());

        if (startDate == null || startDate.trim().length() == 0) {
            startDate = "01/01/1900";
            startTime = "01:00";
        }
        r.setProperty("sdt" , df2.format(df1.parse(startDate)) + " " + startTime + ":00");
        getRequest().setAttribute("startDate", startDate);
        getRequest().setAttribute("startDateTime", startTime);

        if (endDate == null || endDate.trim().length() == 0) {
            endDate = "12/31/2099";
            endTime = "01:00";
        }
        r.setProperty("edt" , df2.format(df1.parse(endDate)) + " " + endTime + ":00");
        getRequest().setAttribute("endDate", endDate);
        getRequest().setAttribute("endDateTime", endTime);
        
        String minDuration = getRequest().getParameter("minDuration");
        if (minDuration == null || minDuration.trim().length() == 0) {
            minDuration = "0";
        }
        r.setProperty("dmin", minDuration);
        getRequest().setAttribute("minDuration", minDuration);

        String maxDuration = getRequest().getParameter("maxDuration");
        if (maxDuration == null || maxDuration.trim().length() == 0) {
            maxDuration = "1000";
        }
        r.setProperty("dmax", maxDuration);
        getRequest().setAttribute("maxDuration", maxDuration);
        
        String title1 = getRequest().getParameter("title1");
        if (title1 == null || title1.trim().length() == 0) {
            title1 = "";
        }
        getRequest().setAttribute("title1", title1);

        String title2 = getRequest().getParameter("title2");
        if (title2 == null || title2.trim().length() == 0) {
            title2 = "";
        }
        getRequest().setAttribute("title2", title2);

        r.setProperty("pjn", "%" + (title1.equals("") ? title2.toLowerCase() : title1.toLowerCase()) + "%");

        String winner = getRequest().getParameter("winner");
        if (winner == null || winner.trim().length() == 0) {
            winner = "0";
        }
        r.setProperty("wc", winner);
        getRequest().setAttribute("winner", winner);

        String firstPrize = getRequest().getParameter("firstPrize");
        if (firstPrize == null || firstPrize.trim().length() == 0) {
            firstPrize = "-1";
        }
        r.setProperty("pri", firstPrize);
        getRequest().setAttribute("firstPrize", firstPrize);

        String totalPrize = getRequest().getParameter("totalPrize");
        if (totalPrize == null || totalPrize.trim().length() == 0) {
            totalPrize = "-1";
        }
        r.setProperty("prt", totalPrize);
        getRequest().setAttribute("totalPrize", totalPrize);
        
        String minReg = getRequest().getParameter("minReg");
        if (minReg == null || minReg.trim().length() == 0) {
            minReg = "0";
        }
        r.setProperty("rmin", minReg);
        getRequest().setAttribute("minReg", minReg);

        String maxReg = getRequest().getParameter("maxReg");
        if (maxReg == null || maxReg.trim().length() == 0) {
            maxReg = "1000";
        }
        r.setProperty("rmax", maxReg);
        getRequest().setAttribute("maxReg", maxReg);
        
        String minSub = getRequest().getParameter("minSub");
        if (minSub == null || minSub.trim().length() == 0) {
            minSub = "0";
        }
        r.setProperty("smin", minSub);
        getRequest().setAttribute("minSub", minSub);

        String maxSub = getRequest().getParameter("maxSub");
        if (maxSub == null || maxSub.trim().length() == 0) {
            maxSub = "1000";
        }
        r.setProperty("smax", maxSub);
        getRequest().setAttribute("maxSub", maxSub);

        ResultSetContainer rsc = da.getData(r).get("studio_past_contests_multi_sort");

        String pageSize = getRequest().getParameter("pageSize");
        if (pageSize == null) {
            pageSize = "10";
        }
        String pageNum = getRequest().getParameter("pageNum");
        if (pageNum == null) {
            pageNum = "1";
        }
        int begin = 0, end = 0;
        getRequest().setAttribute("contests", rsc);
        getRequest().setAttribute("total", rsc.size());
        getRequest().setAttribute("pageSize", Integer.valueOf(pageSize));
        getRequest().setAttribute("pageNum", Integer.valueOf(pageNum));
        if (pageSize.equals("-1")) {
            getRequest().setAttribute("totalPage", 1);
            begin = 0;
            end = rsc.size() - 1;
        } else {
            getRequest().setAttribute("totalPage", (rsc.size() - 1) / Integer.parseInt(pageSize) + 1);
            begin = (Integer.parseInt(pageNum) - 1) * Integer.parseInt(pageSize);
            end = Integer.parseInt(pageNum) * Integer.parseInt(pageSize) - 1;
        }
        if (begin >= rsc.size()) {
            begin = 0;
        }
        if (end >= rsc.size()) {
            end = rsc.size() - 1;
        }
        getRequest().setAttribute("begin", begin);
        getRequest().setAttribute("end", end);

        Map<Long, ResultSetContainer> submissions = new HashMap<Long, ResultSetContainer>();
        Request wr = new Request();
        wr.setContentHandle("studio_winner_submissions");
        for (int i = begin; i <= end; ++i) {
            long contestId = rsc.get(i).getLongItem("contest_id");
            wr.setProperty("ct", "" + contestId);
            submissions.put(contestId, da.getData(wr).get("studio_winner_submissions"));
        }
        getRequest().setAttribute("submissions", submissions);
        getRequest().setAttribute("sortColumn", col);
        getRequest().setAttribute("sortDirection", order.equals("asc") ? "desc" : "asc");
        getRequest().setAttribute(SortingHelper.SORTING_CRITERIA_KEY, sortCriteria);
        getRequest().setAttribute("query", query.substring(query.indexOf('&') + 1));
        
        /*Map<Long, Boolean> eligibilityCheckResults 
            = EligibilityServiceHelper.checkContestsEligibility(rsc, getLoggedInUser().getId());
        getRequest().setAttribute("eligibility", eligibilityCheckResults);*/

        setNextPage("/pastContests.jsp");
        setIsNextPageInContext(true);
    }

    private String removeParameter(String queryString, String parameter) {
        int pos1 = queryString.indexOf(parameter);
        if (pos1 < 0) {
            return queryString;
        }
        int pos2 = queryString.indexOf('&', pos1);
        if (pos1 > 0) {
            pos1--;
        }
        if (pos2 < 0) {
            pos2 = queryString.length();
        }
        return queryString.substring(0, pos1) + queryString.substring(pos2);
    }
}
