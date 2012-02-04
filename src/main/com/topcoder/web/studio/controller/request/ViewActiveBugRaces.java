/*
 * Copyright (C) 2009-2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.atlassian.jira.rpc.soap.client.JiraSoapService;
import com.atlassian.jira.rpc.soap.client.JiraSoapServiceServiceLocator;
import com.atlassian.jira.rpc.soap.client.RemoteCustomFieldValue;
import com.atlassian.jira.rpc.soap.client.RemoteIssue;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dto.JIRAIssue;

/**
 * BUGR-1211 February 18, 2009
 * <p>
 * Version 1.1 (TopCoder Studio Contest Listings Assembly) Change notes:
 * <ol>
 * <li>Changed to use SOAP to retrieve JIRA tickets and pass them to JSP page.</li>
 * </ol>
 * </p>
 * @author ShindouHikaru, duxiaoyang
 * @version 1.1
 */
public class ViewActiveBugRaces extends BaseProcessor {

    /**
     * Represents the id of "First Place Payment" custom field.
     */
    private static String PRIZE_CUSTOM_FIELD_ID = "customfield_10012";
    
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
     * <p>
     * Static initializer. It initializes default sort priority and direction.
     * </p>
     */
    static {
        DEFAULT_SORT_PRIORITY.add(1);         // key
        DEFAULT_SORT_DIRECTION.put(1, true);
        DEFAULT_SORT_PRIORITY.add(2);         // summary
        DEFAULT_SORT_DIRECTION.put(2, true);
        DEFAULT_SORT_PRIORITY.add(3);         // prize
        DEFAULT_SORT_DIRECTION.put(3, true);
    }

    /**
     * Gets the first place payment of a jira issue.
     * 
     * @param issue the jira issue
     * @return the first place payment of a jira issue.
     */
    private static double getIssuePrize(RemoteIssue issue) {
        for (RemoteCustomFieldValue field : issue.getCustomFieldValues()) {
            if (PRIZE_CUSTOM_FIELD_ID.equals(field.getCustomfieldId())) {
                try {
                    return Double.parseDouble(field.getValues()[0]);
                } catch (Exception e) {
                }
            }
        }
        return 0.0;
    }
    
    protected void businessProcessing() throws Exception {
        // Get configurations
        String jiraServiceUrl = Constants.JIRA_SERVICE_URL;
        String user = Constants.JIRA_USERNAME;
        String password = Constants.JIRA_PASSWORD;
        String jql = Constants.JIRA_JQL;

        // the JIRA SOAP Service and authentication token are used to make authentication calls
        JiraSoapService jiraSoapService = new JiraSoapServiceServiceLocator().getJirasoapserviceV2(new URL(
                jiraServiceUrl));
        String token = jiraSoapService.login(user, password);

        // Get issues
        RemoteIssue[] remoteIssues = jiraSoapService.getIssuesFromJqlSearch(token, jql, Integer.MAX_VALUE);

        String col = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));
        String order = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));

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

        JIRAIssue[] issues = new JIRAIssue[remoteIssues.length];
        for (int i = 0; i < issues.length; i++) {
            issues[i] = new JIRAIssue();
            issues[i].setKey(remoteIssues[i].getKey());
            issues[i].setSummary(remoteIssues[i].getSummary());
            issues[i].setPrize(getIssuePrize(remoteIssues[i]));
        }
        String sortCriteria = SortingHelper.getSortingClause(sortPriority, sortDirection);
        Arrays.sort(issues, new IssueComparator(sortPriority, sortDirection));
        getRequest().setAttribute("issues", issues);
        getRequest().setAttribute("sortColumn", col);
        getRequest().setAttribute("sortDirection", order.equals("asc") ? "desc" : "asc");
        getRequest().setAttribute(SortingHelper.SORTING_CRITERIA_KEY, sortCriteria);

        setNextPage("/activeBugRaces.jsp");
        setIsNextPageInContext(true);
    }

    /**
     * <p>
     * This class is used to compare <code>JIRAIssue</code> instances based on given sorting criteria.
     * </p>
     * @author TCSASSEMBLY
     * @version 1.0
     */
    private static class IssueComparator implements Comparator<JIRAIssue> {

        /**
         * Represents the sorting priority.
         */
        private List<Integer> sortPriority;

        /**
         * Represents the sorting direction.
         */
        private Map<Integer, Boolean> sortDirection;

        /**
         * <p>
         * Creates an instance of this class with given sorting criteria.
         * </p>
         * @param sortPriority
         *            the sorting priority to use.
         * @param sortDirection
         *            the sorting direction to use.
         */
        public IssueComparator(List<Integer> sortPriority, Map<Integer, Boolean> sortDirection) {
            this.sortPriority = sortPriority;
            this.sortDirection = sortDirection;
        }

        /**
         * Compares two objects.
         * 
         * @param o1 the first object to compare
         * @param o2 the second object to compare
         * @param sortDirection the sort direction
         * @return negative if the first instance is less than the second one, or positive if the first instance is
         *          greater than the second one
         */
        private static int compareObjects(Object o1, Object o2, boolean sortDirection) {
            int ret = 0;
            if (o1 instanceof Double) {
                ret = (Double) o1 < (Double) o2 ? -1 : 1;
            } else if (o1 instanceof String) {
                ret = ((String) o1).compareTo((String) o2); 
            }
            if (!sortDirection) {
                ret = -ret;
            }
            return ret;
        }
        
        /**
         * <p>
         * Compares two <code>JIRAIssue</code> instances.
         * </p>
         * @param o1
         *            the first <code>RemoteIssue</code> instance to compare.
         * @param o2
         *            the second <code>RemoteIssue</code> instance to compare.
         * @return negative if the first instance is less than the second one, or positive if the first instance is
         *         greater than the second one, or 0 if they are equal.
         */
        public int compare(JIRAIssue o1, JIRAIssue o2) {
            Object[] values1 = new Object[3];
            Object[] values2 = new Object[3];
            
            values1[0] = o1.getKey();
            values1[1] = o1.getSummary();
            values1[2] = o1.getPrize();
            
            values2[0] = o2.getKey();
            values2[1] = o2.getSummary();
            values2[2] = o2.getPrize();
            
            for (int i = 0; i < values1.length; i++) {
                int index = sortPriority.get(i);
                Object ol = values1[index - 1];
                Object or = values2[index - 1];
                if (!ol.equals(or)) {
                    return compareObjects(ol, or, sortDirection.get(index));
                }
            } else {
                if (!o1.getSummary().equals(o2.getSummary())) {
                    if (sortDirection.get(2)) {
                        return o1.getSummary().compareTo(o2.getSummary());
                    } else {
                        return o2.getSummary().compareTo(o1.getSummary());
                    }
                } else {
                    if (sortDirection.get(1)) {
                        return key1 - key2;
                    } else {
                        return key2 - key1;
                    }
                }
            }
            return 0;
        }
    }
}
