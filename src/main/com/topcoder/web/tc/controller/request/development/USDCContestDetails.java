/*
 * USDCResults.java
 *
 * Created on June 9, 2004, 11:22 AM
 */

package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import javax.servlet.http.HttpUtils;
import java.util.Map;

/**
 *
 * @author  rfairfax
 */
public class USDCContestDetails extends StatBase {

    private int type = 0;

    private void getType() throws TCWebException {
        if (type != 0)
            return;

        Request dataRequest = new Request();
        Map map = HttpUtils.parseQueryString(getRequest().getQueryString());
        map.remove(Constants.MODULE_KEY);
        map.remove(DataAccessConstants.SORT_COLUMN);
        map.remove(DataAccessConstants.SORT_DIRECTION);

        try {
            dataRequest.setProperties(map);
            dataRequest.setContentHandle("usdc_contest_info");
            DataAccessInt dai = getDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME, true);
            Map result = dai.getData(dataRequest);

            ResultSetContainer rsc = (ResultSetContainer) result.get("contest_info");

            type = rsc.getIntItem(0, "prize_type_id");

        } catch (TCWebException e) {
            throw new TCWebException(e);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    String getCommandName() throws TCWebException {
        getType();

        if (type == 1) {
            return "usdc_contest_details_first_winner";
        } else if (type == 2 || type == 3) {
            return "usdc_contest_details";
        } else if (type == 4) {
            return "usdc_contest_details_most_submissions";
        } else {
            return "usdc_contest_details_monthly";
        }
    }

    String getDataSourceName() throws TCWebException {
        getType();

        if (type == 5 || type == 6) {
            return DBMS.TCS_OLTP_DATASOURCE_NAME;
        } else {
            return DBMS.DW_DATASOURCE_NAME;
        }

    }

    String getPageName() throws TCWebException {
        getType();

        if (type == 4) {
            return "/dev/usdc_contest_det_most_submissions.jsp";
        } else if (type == 5 || type == 6) {
            return "/dev/usdc_contest_det_monthly.jsp";
        } else {
            return "/dev/usdc_contest_det.jsp";
        }
    }

    void statProcessing() throws com.topcoder.web.common.TCWebException {

        getType();

        if (type == 1) {
            //reposition result->resultMap->contest_results_only_winners to contest_results so that the page doesn't have to know what
            //type of contest this is
            Map result2 = (Map) getRequest().getAttribute("resultMap");

            result2.put("contest_results", result2.get("contest_results_only_winners"));
            //result.remove("contest_results_only_winners");

            getRequest().setAttribute("resultMap", result2);
        }
    }
}
