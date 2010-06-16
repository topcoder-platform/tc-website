/*
 * Copyright (C) 2007-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.tournament;

import java.text.DecimalFormat;
import java.util.*;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.TCResultItem;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.StatBase;
import com.topcoder.web.tc.model.UserContestResult;

/**
 * @author dok, pulky, isv
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
*/
public abstract class MemberResultsBase extends StatBase {

    /**
     * Gets the contest prefix. It will be used mainly for the jsp path but could be used for other purposes as well. 
     * Example: tco07, tccc07, etc.
     * 
     * @return the contest prefix
     */
    protected abstract String getContestPrefix();
   
    /**
     * Gets an array with the placement points for the points calculation.
     * Each i position of the element corresponds to amount of points for the i+1 placement.
     * The array should only contain the first n placement points and should not include 0 points positions. 
     * 
     * @return an array with the placement points
     */
    protected abstract int[] getPlacementPoints();

    /**
     * <p>Checks if the <code>Digital Run</code> points are used for calculating the placement points for target event.
     *  </p>
     *
     * @return <code>true</code> if event is using DR placement points; <code>false</code> otherwise.
     */
    protected boolean isUsingDRPlacementPoints() {
        return false;
    }

    /**
     * <p>Gets the placement points to be awarded to competitor who took specified place among specified total number of
     * submissions based on specified pool of <code>Digital Run</code> points for project.</p>
     *
     * @param place an <code>int</code> providing the placement for competitor's submission (0-based).
     * @param projectDRPool an <code>int</code> providing the total pool of <code>Digital Run</code> points set for the
     *        target project.
     * @param submissionsCount an <code>int</code> providing the total number of submissions for project.
     * @return an <code>int</code> providing the placement points to be awarded to submitter.
     * @throws UnsupportedOperationException always.
     */
    protected int getDRPlacementPoints(int place, int projectDRPool, int submissionsCount) {
        throw new UnsupportedOperationException("getDRPlacementPoints must be overridden");
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getCommandName()
     */
    @Override
    protected String getCommandName() {
        return "member_projects";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getDataSourceName()
     */
    @Override
    protected String getDataSourceName() {
        return DBMS.TCS_DW_DATASOURCE_NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getPageName()
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/component/memberResults.jsp";
    }

    /**
     * Private attribute that will contain the stat results 
     */
    private ArrayList arr = new ArrayList();

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#statProcessing()
     */
    @Override
    protected void statProcessing() throws com.topcoder.web.common.TCWebException {
        String event = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID));
        Long eventId;
        try {
            eventId = Long.parseLong(event);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event id parameter.");                
        }

        getRequest().setAttribute("event_id", eventId);

        Map result2 = (Map) getRequest().getAttribute("resultMap");

        int userId = Integer.parseInt(getRequest().getParameter("cr"));

        ResultSetContainer rsc = (ResultSetContainer) result2.get("contest_projects");

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        DecimalFormat scfmt = new DecimalFormat("0.00");

        int[] placementPoints = getPlacementPoints();
        Map<Long, Integer> drPoints = null;
        if (isUsingDRPlacementPoints()) {
            drPoints = getDRPoints();
        }

        for (int i = 0; i < rsc.size(); i++) {
            long projectId = rsc.getLongItem(i, "project_id");

            //for each contest, get details and build array
            Request dataRequest = new Request();
            Map result;
            try {
                dataRequest.setContentHandle("project_results_all");
                dataRequest.setProperty("ct", getRequest().getParameter("ct"));
                dataRequest.setProperty("pj", String.valueOf(rsc.getIntItem(i, "project_id")));
                dataRequest.setProperty("eid", getRequest().getParameter("eid"));

                DataAccessInt dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
                result = dai.getData(dataRequest);

            } catch (Exception e) {
                throw new TCWebException(e);
            }

            ResultSetContainer rscDetails = (ResultSetContainer) result.get("project_results_all");
            ResultSetContainer rscComplete = (ResultSetContainer) result.get("project_details");
            boolean bComplete = false;
            if (rscComplete.getIntItem(0, "complete_status") == 1) {
                bComplete = true;
            }

            for (int j = 0; j < rscDetails.size(); j++) {
                if (rscDetails.getIntItem(j, "user_id") == userId) {
                    int pts = 0;
                    String place = "-";
                    String score = "";

                    if (isUsingDRPlacementPoints()) {
                        if (rscDetails.getItem(j, "final_score").getResultData() != null) {
                            TCResultItem passedReviewIndItem = rscDetails.getItem(j, "passed_review_ind");
                            if ((passedReviewIndItem != null) && (passedReviewIndItem.toString().equals("1"))) {
                                int submittersCount = rscDetails.getIntItem(j, "passing_submitters_count");
                                int placeInt = rscDetails.getIntItem(j, "placed");
                                pts = getDRPlacementPoints(placeInt, drPoints.get(projectId), submittersCount);
                                place = String.valueOf(placeInt);
                            }
                            score = scfmt.format(rscDetails.getDoubleItem(j, "final_score"));
                        }
                    } else {
                        if (rscDetails.getItem(j, "final_score").getResultData() != null) {
                            if (rscDetails.getDoubleItem(j, "final_score") >= 75) {
                                if (j < placementPoints.length) {
                                    pts = placementPoints[j];
                                    place = String.valueOf(j + 1);
                                }
                            }
                            score = scfmt.format(rscDetails.getDoubleItem(j, "final_score"));
                        }
                    }

                    String prz = "";
                    if (rscDetails.getItem(j, "payment").getResultData() != null) {
                        if (rscDetails.getIntItem(j, "payment") != 0) {
                            prz = dfmt.format(rscDetails.getDoubleItem(j, "payment"));

                        }
                    }

                    Date sub = null;
                    if (rscDetails.getItem(j, "submit_timestamp").getResultData() != null) {
                        sub = (Date) rscDetails.getItem(j, "submit_timestamp").getResultData();
                    }

                    arr.add(new UserContestResult(rsc.getStringItem(i, "component_name"), pts,
                            place, score,
                            rsc.getIntItem(i, "component_id"), prz, sub, bComplete,
                            rscDetails.getLongItem(j, "project_id"), rscDetails.getIntItem(j, "viewable_category_ind") == 1));
                }
            }
        }


        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);

    }

    /**
     * <p>Gets the mapping from project IDs to DR points.</p>
     *
     * @return a <code>Map</code> mapping the project IDs to DR points.
     * @throws TCWebException if an unexpected error occurs.
     */
    private Map<Long, Integer> getDRPoints() throws TCWebException {
        try {
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

            //for each contest, get details and build array
            Request dataRequest = new Request();
            dataRequest.setProperties(filteredMap);
            dataRequest.setContentHandle("contest_projects");

            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);
            ResultSetContainer rsc = (ResultSetContainer) result.get("contest_projects");
            Map<Long, Integer> points = new HashMap<Long, Integer>();
            for (int i = 0; i < rsc.size(); i++) {
                int drPoints = rsc.getIntItem(i, "dr_points");
                long projectId = rsc.getIntItem(i, "project_id");
                points.put(projectId, drPoints);
            }

            return points;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            UserContestResult a1 = (UserContestResult) o1;
            UserContestResult a2 = (UserContestResult) o2;

            if (a1.getSubmitTimestampDate() == null && a2.getSubmitTimestampDate() == null) {
                return 0;
            }

            if (a1.getSubmitTimestampDate() == null) {
                return 1;
            }

            if (a2.getSubmitTimestampDate() == null) {
                return -1;
            }

            Calendar c1 = new GregorianCalendar();
            c1.setTime(a1.getSubmitTimestampDate());

            Calendar c2 = new GregorianCalendar();
            c2.setTime(a2.getSubmitTimestampDate());

            if (c1.getTime().getTime() == c2.getTime().getTime()) {
                return a1.getComponent().compareToIgnoreCase(a2.getComponent());
            }

            return c2.before(c1) ? -1 : 1;
        }

    }

}
