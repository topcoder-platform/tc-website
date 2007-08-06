package com.topcoder.web.tc.controller.request.tournament;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.StatBase;
import com.topcoder.web.tc.model.UserContestResult;

/**
 * @author dok, pulky
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
            boolean bComplete = false;
            if (rscComplete.getIntItem(0, "complete_status") == 1) {
                bComplete = true;
            }

            for (int j = 0; j < rscDetails.size(); j++) {
                if (rscDetails.getIntItem(j, "user_id") == userId) {
                    int pts = 0;
                    String place = "-";
                    String score = "";
                    if (rscDetails.getItem(j, "final_score").getResultData() != null) {
                        if (rscDetails.getDoubleItem(j, "final_score") >= 75) {
                            if (j < placementPoints.length) {
                                pts = placementPoints[j];
                                place = String.valueOf(j + 1);
                            }
                        }
                        score = scfmt.format(rscDetails.getDoubleItem(j, "final_score"));
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
