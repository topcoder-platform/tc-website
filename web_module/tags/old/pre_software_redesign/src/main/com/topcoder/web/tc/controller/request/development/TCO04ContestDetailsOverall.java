/*
 * TCO04ContestDetails.java
 *
 * Created on August 5, 2004, 12:24 PM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.TCO04OverallResult;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

/**
 *
 * @author  rfairfax
 */
public class TCO04ContestDetailsOverall extends StatBase {


    String getCommandName() {
        return "tco04_contest_details_overall";
    }

    String getDataSourceName() {
        return DBMS.TCS_OLTP_DATASOURCE_NAME;
    }

    String getPageName() {
        return "/tournaments/tco04/contest_det_overall.jsp";
    }

    void statProcessing() throws TCWebException {
        Map result2 = (Map) getRequest().getAttribute("resultMap");

        ResultSetContainer rsc = (ResultSetContainer) result2.get("tco04_contest_results_overall");

        ArrayList arr = new ArrayList();

        DecimalFormat dfmt = new DecimalFormat("$#,##0.00");

        for (int i = 0; i < rsc.size(); i++) {
            Request dataRequest = new Request();
            Map result;
            try {
                dataRequest.setContentHandle("tco04_user_details");
                dataRequest.setProperty("ct", getRequest().getParameter("ct"));
                dataRequest.setProperty("uid", String.valueOf(rsc.getIntItem(i, "user_id")));

                DataAccessInt dai = getDataAccess(getDataSourceName(), true);
                result = dai.getData(dataRequest);

            } catch (Exception e) {
                throw new TCWebException(e);
            }

            ResultSetContainer rscDetails = (ResultSetContainer) result.get("tco04_overall_details");

            //build points
            int pts = 0;
            boolean pending = false;
            for (int j = 0; j < rscDetails.size(); j++) {
                if (rscDetails.getIntItem(j, "complete_status") == 0)
                    pending = true;

                pts += rscDetails.getIntItem(j, "position_points");
            }

            String prz = "";
            if (rsc.getIntItem(i, "prize_payment") != 0) {
                prz = dfmt.format(rsc.getDoubleItem(i, "prize_payment"));

            }
            arr.add(new TCO04OverallResult(rsc.getStringItem(i, "handle"), pending, pts,
                    rsc.getIntItem(i, "complete_count"), rsc.getIntItem(i, "incomplete_count"),
                    rsc.getIntItem(i, "user_id"), prz));
        }

        Collections.sort(arr, new myComparator());

        getRequest().setAttribute("results", arr);

    }

    public class myComparator implements Comparator {

        public int compare(Object o1, Object o2) {
            TCO04OverallResult a1 = (TCO04OverallResult) o1;
            TCO04OverallResult a2 = (TCO04OverallResult) o2;

            if (a1.getPoints() == a2.getPoints()) {
                return a1.getHandle().compareToIgnoreCase(a2.getHandle());
            }

            return a2.getPoints() - a1.getPoints();
        }

    }
}
