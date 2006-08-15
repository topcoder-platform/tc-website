package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.ProjectDetail;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06ProjectDetails extends StatBase {

    String getCommandName() {
        return "tccc06_project_details";
    }

    String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tccc06/project_det.jsp";
    }

    void statProcessing() throws TCWebException {
        Map result2 = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result2.get("tccc06_project_results");

        ArrayList arr = new ArrayList();

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        SimpleDateFormat dtfmt = new SimpleDateFormat("MM.dd.yyyy hh:mma");
        DecimalFormat scfmt = new DecimalFormat("0.00");

        int[] placementPoints = new int[]{10, 7, 5, 4, 0};

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

            String sub = "";
            if (rsc.getItem(i, "submit_timestamp").getResultData() != null) {
                sub = dtfmt.format((Date) rsc.getItem(i, "submit_timestamp").getResultData());
            }

            arr.add(new com.topcoder.web.tc.model.ProjectDetail(rsc.getStringItem(i, "handle"), pts,
                    place, score,
                    rsc.getIntItem(i, "user_id"), prz, sub));
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
