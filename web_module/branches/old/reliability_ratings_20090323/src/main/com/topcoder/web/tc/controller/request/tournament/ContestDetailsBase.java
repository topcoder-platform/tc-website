package com.topcoder.web.tc.controller.request.tournament;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.StatBase;
import com.topcoder.web.tc.model.UserContestDetail;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public abstract class ContestDetailsBase extends StatBase {

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
     * Gets the maximum amount of projects that will be taken into consideration for the total points amount.
     * The points calculation will be based on the best getMax() projects placement points.
     * 
     * @return the maximum amount of projects taken into consideration
     */
    protected abstract int getMax();
    
    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getCommandName()
     */
    @Override
    protected String getCommandName() {
        return "contest_projects";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getDataSourceName()
     */
    @Override
    protected String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#getPageName()
     */
    @Override
    protected String getPageName() {
        return "/tournaments/" + getContestPrefix() + "/component/contestDetails.jsp";
    }

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

        ResultSetContainer rsc = (ResultSetContainer) result2.get("contest_projects");

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");

        int[] placementPoints = getPlacementPoints();

        log.debug("rscDetails.size(): (1) " + rsc.size());
        for (int i = 0; i < rsc.size(); i++) {
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
            boolean isComplete = false;
            if (!rscComplete.isEmpty() && rscComplete.getIntItem(0, "complete_status") == 1) {
                isComplete = true;
            }

            log.debug("rscDetails.size(): " + rscDetails.size());
            for (int j = 0; j < rscDetails.size(); j++) {
                int pts = 0;

                if (rscDetails.getItem(j, "final_score").getResultData() != null) {
                    if (rscDetails.getDoubleItem(j, "final_score") >= 75) {
                        if (j < placementPoints.length) {
                            pts = placementPoints[j];
                        }
                    }
                }

                addPoints(rscDetails.getStringItem(j, "handle"), rscDetails.getIntItem(j, "user_id"), pts,
                        isComplete, rscDetails.getIntItem(j, "submit_ind") == 1);
            }
        }

        //add prizes
        Request dataRequest = new Request();
        Map result;
        try {
            dataRequest.setContentHandle("contest_prizes");
            dataRequest.setProperty("ct", getRequest().getParameter("ct"));

            DataAccessInt dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
            result = dai.getData(dataRequest);

        } catch (Exception e) {
            throw new TCWebException(e);
        }

        ResultSetContainer rscPrizes = (ResultSetContainer) result.get("contest_prizes");

        for (int i = 0; i < rscPrizes.size(); i++) {
            addPrize(rscPrizes.getIntItem(i, "user_id"), dfmt.format(rscPrizes.getDoubleItem(i, "prize_payment")));
        }

        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);

    }

    public void addPrize(int userId, String prz) {
        log.debug("addPrize called : " + userId + " - " + prz);

        UserContestDetail user = null;
        for (int i = 0; i < arr.size(); i++) {
            UserContestDetail item = (UserContestDetail) arr.get(i);
            if (item.getUserID() == userId) {
                user = item;
                break;
            }
        }
        
        if (user != null) {
            user.setPayment(prz);
        } else {
            log.debug("Null user!!");
        }
    }

    public void addPoints(String handle, int userId, int pts, boolean completed, boolean isSubmitted) {
        log.debug("addPoints called : " + handle + " - " + userId + " - " + pts + " - " + completed + " - " + isSubmitted);
        UserContestDetail user = null;
        for (int i = 0; i < arr.size(); i++) {
            UserContestDetail item = (UserContestDetail) arr.get(i);
            if (item.getUserID() == userId) {
                user = item;
                break;
            }
        }
        if (user == null) {
            user = new UserContestDetail(handle, userId);
            log.debug("adding user: " + handle + " - " + userId);
            arr.add(user);
        }

        user.addPoints(pts, getMax());
        if (completed) {
            user.setComplete(user.getComplete() + 1);
        } else {
            user.setIncomplete(user.getIncomplete() + 1);
        }
        if (isSubmitted) {
            user.setSubmissionCount(user.getSubmissionCount() + 1);
        }

    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            UserContestDetail a1 = (UserContestDetail) o1;
            UserContestDetail a2 = (UserContestDetail) o2;

            if (a1.getPoints() == a2.getPoints()) {
                return a1.getHandle().compareToIgnoreCase(a2.getHandle());
            }

            return a2.getPoints() - a1.getPoints();
        }

    }

}