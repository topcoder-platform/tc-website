package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.model.UserContestResult;

import java.text.DecimalFormat;
import java.util.*;

/**
 * @author dok
 * @version $Revision: 57980 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06MemberResults extends StatBase {

    public String getCommandName() {
        return "tccc06_member_projects";
    }

    public String getDataSourceName() {
        return DBMS.TCS_DW_DATASOURCE_NAME;
    }

    public String getPageName() {
        return "/tournaments/tccc06/member_results.jsp";
    }

    private ArrayList arr = new ArrayList();

    public void statProcessing() throws com.topcoder.web.common.TCWebException {
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
                dataRequest.setContentHandle("tccc06_project_results_all");
                dataRequest.setProperty("ct", getRequest().getParameter("ct"));
                dataRequest.setProperty("pj", String.valueOf(rsc.getIntItem(i, "project_id")));

                DataAccessInt dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
                result = dai.getData(dataRequest);

            } catch (Exception e) {
                throw new TCWebException(e);
            }

            ResultSetContainer rscDetails = (ResultSetContainer) result.get("tccc06_project_results_all");
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
