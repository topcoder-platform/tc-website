/*
 * TCCC05ProjectDetails.java
 *
 * Created on January 5, 2005, 3:24 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.ProjectDetail;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

/**
 * @author rfairfax
 */
public class TCCC05ProjectDetails extends StatBase {

    public String getCommandName() {
        return "tccc05_project_details";
    }

    public String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tccc05/project_det.jsp";
    }

    public void statProcessing() throws TCWebException {
        Map result2 = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result2.get("tccc05_project_results");

        ArrayList arr = new ArrayList();

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        DecimalFormat scfmt = new DecimalFormat("0.00");

        int[] placementPoints = new int[]{10, 7, 5, 4, 0};

        for (int i = 0; i < rsc.size(); i++) {
            int pts = 0;
            String place = "-";
            String score = "";
            if (rsc.getItem(i, "final_score").getResultData() != null) {
                if (rsc.getDoubleItem(i, "final_score") >= 70) {
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
