/*
 * TCCC05ContestDetails.java
 *
 * Created on January 6, 2005, 10:00 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.TCCC05ContestDetail;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

/**
 *
 * @author rfairfax
 */
public class TCO05ContestDetails extends StatBase {

    String getCommandName() {
        return "tco05_contest_projects";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco05/contest_det.jsp";
    }

    private ArrayList arr = new ArrayList();

    int getMax() {
        return Integer.MAX_VALUE;
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {
        Map result2 = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result2.get("contest_projects");

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");

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
            boolean isComplete = false;
            if (rscComplete.getIntItem(0, "complete_status") == 1) {
                isComplete = true;
            }

            for (int j = 0; j < rscDetails.size(); j++) {
                int pts = 0;

                if (rscDetails.getItem(j, "final_score").getResultData() != null) {
                    if (rscDetails.getDoubleItem(j, "final_score") >= 70) {
                        if (j < placementPoints.length) {
                            pts = placementPoints[j];
                        }
                    }
                }

                addPoints(rscDetails.getStringItem(j, "handle"), rscDetails.getIntItem(j, "user_id"), pts,
                        isComplete, rscDetails.getIntItem(j, "submit_ind")==1);
            }
        }

        //add prizes
        Request dataRequest = new Request();
        Map result;
        try {
            dataRequest.setContentHandle("tco05_contest_prizes");
            dataRequest.setProperty("ct", getRequest().getParameter("ct"));

            DataAccessInt dai = getDataAccess(DBMS.DW_DATASOURCE_NAME, true);
            result = dai.getData(dataRequest);

        } catch (Exception e) {
            throw new TCWebException(e);
        }

        ResultSetContainer rscPrizes = (ResultSetContainer) result.get("tco05_contest_prizes");

        for (int i = 0; i < rscPrizes.size(); i++) {
            addPrize(rscPrizes.getIntItem(i, "user_id"), dfmt.format(rscPrizes.getDoubleItem(i, "prize_payment")));
        }

        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);

    }

    public void addPrize(int userId, String prz) {
        TCCC05ContestDetail user = null;
        for (int i = 0; i < arr.size(); i++) {
            TCCC05ContestDetail item = (TCCC05ContestDetail) arr.get(i);
            if (item.getUserID() == userId) {
                user = item;
                break;
            }
        }

        user.setPayment(prz);
    }

    public void addPoints(String handle, int userId, int pts, boolean completed, boolean isSubmitted) {
        TCCC05ContestDetail user = null;
        for (int i = 0; i < arr.size(); i++) {
            TCCC05ContestDetail item = (TCCC05ContestDetail) arr.get(i);
            if (item.getUserID() == userId) {
                user = item;
                break;
            }
        }
        if (user == null) {
            user = new TCCC05ContestDetail(handle, userId);
            arr.add(user);
        }

        user.addPoints(pts, getMax());
        if (completed) {
            user.setComplete(user.getComplete() + 1);
        } else {
            user.setIncomplete(user.getIncomplete() + 1);
        }
        if (isSubmitted) {
            user.setSubmissionCount(user.getSubmissionCount()+1);
        }

    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            TCCC05ContestDetail a1 = (TCCC05ContestDetail) o1;
            TCCC05ContestDetail a2 = (TCCC05ContestDetail) o2;

            if (a1.getPoints() == a2.getPoints()) {
                return a1.getHandle().compareToIgnoreCase(a2.getHandle());
            }

            return a2.getPoints() - a1.getPoints();
        }

    }

}