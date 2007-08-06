package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.StatBase;
import com.topcoder.web.tc.model.ProjectDetail;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
/**
* @author Pablo Wolfus (pulky)
* @version $Id$
*/
public abstract class ProjectDetailsBase extends StatBase {

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
        return "project_details";
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
        return "/tournaments/" + getContestPrefix() + "/component/projectDetails.jsp";
    }

    /* (non-Javadoc)
     * @see com.topcoder.web.tc.controller.request.development.StatBase#statProcessing()
     */
    @Override
    protected void statProcessing() throws TCWebException {
        
        String event = StringUtils.checkNull(getRequest().getParameter(Constants.EVENT_ID));
        Long eventId;
        try {
            eventId = Long.parseLong(event);
        } catch (NumberFormatException nfe) {
            throw new TCWebException("invalid event id parameter.");                
        }

        getRequest().setAttribute("event_id", eventId);

        Map result2 = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result2.get("project_results");

        ArrayList arr = new ArrayList();

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        DecimalFormat scfmt = new DecimalFormat("0.00");

        int[] placementPoints = getPlacementPoints();

        for (int i = 0; i < rsc.size(); i++) {
            int pts = 0;
            String place = "-";
            String score = "";
            if (rsc.getItem(i, "final_score").getResultData() != null) {
                if (rsc.getDoubleItem(i, "final_score") >= 75) {
                    if (i < placementPoints.length) {
                        pts = placementPoints[i];
                        place = String.valueOf(i + 1);
                    }
                }
                score = scfmt.format(rsc.getDoubleItem(i, "final_score"));
            }

            String prz = "";
            if (rsc.getItem(i, "payment").getResultData() != null) {
                if (rsc.getIntItem(i, "payment") != 0) {
                    prz = dfmt.format(rsc.getDoubleItem(i, "payment"));

                }
            }

            arr.add(new com.topcoder.web.tc.model.ProjectDetail(rsc.getStringItem(i, "handle"), pts,
                    place, score,
                    rsc.getIntItem(i, "user_id"), prz, rsc.getTimestampItem(i, "submit_timestamp")));
        }

        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);
    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            ProjectDetail a1 = (ProjectDetail) o1;
            ProjectDetail a2 = (ProjectDetail) o2;

            if (a1.getPoints() == a2.getPoints()) {
                if (a1.getScoreDouble() == a2.getScoreDouble()) {
                    return a1.getHandle().compareToIgnoreCase(a2.getHandle());
                }
                return (int) (a2.getScoreDouble() - a1.getScoreDouble());
            }

            return a2.getPoints() - a1.getPoints();
        }

    }

}
