/*
 * TCCC05MemberResults.java
 *
 * Created on January 6, 2005, 11:36 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.TCCC05MemberResult;

import java.text.DecimalFormat;
import java.util.*;

/**
 *
 * @author rfairfax
 */
public class TCO05MemberResults extends StatBase {

    String getCommandName() {
        return "tco05_member_projects";
    }

    String getDataSourceName() {
        return DBMS.DW_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco05/member_results.jsp";
    }

    private ArrayList arr = new ArrayList();

    void statProcessing() throws com.topcoder.web.common.TCWebException {
        Map result2 = (Map) getRequest().getAttribute("resultMap");

        int userId = Integer.parseInt(getRequest().getParameter("cr"));

        ResultSetContainer rsc = (ResultSetContainer) result2.get("contest_projects");

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");
        DecimalFormat scfmt = new DecimalFormat("0.00");

        int[] placementPoints = new int[]{10, 7, 5, 4, 0};

        for (int i = 0; i < rsc.size(); i++) {
            //for each contest, get details and build array
            Request dataRequest = new Request();
            Map result;
            try {
                dataRequest.setContentHandle("tco05_project_results_all");
                dataRequest.setProperty("ct", getRequest().getParameter("ct"));
                dataRequest.setProperty("pj", String.valueOf(rsc.getIntItem(i, "project_id")));

                DataAccessInt dai = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);
                result = dai.getData(dataRequest);

            } catch (Exception e) {
                throw new TCWebException(e);
            }

            ResultSetContainer rscDetails = (ResultSetContainer) result.get("tco05_project_results_all");
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
                        if (rscDetails.getDoubleItem(j, "final_score") >= 70) {
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

                    arr.add(new TCCC05MemberResult(rsc.getStringItem(i, "component_name"), pts,
                            place, score,
                            rsc.getIntItem(i, "component_id"), prz, sub, bComplete));
                }
            }
        }


        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);

    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            TCCC05MemberResult a1 = (TCCC05MemberResult) o1;
            TCCC05MemberResult a2 = (TCCC05MemberResult) o2;

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
