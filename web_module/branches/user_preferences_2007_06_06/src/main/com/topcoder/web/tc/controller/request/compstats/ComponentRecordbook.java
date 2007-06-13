package com.topcoder.web.tc.controller.request.compstats;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.controller.request.Static;

public class ComponentRecordbook extends Static {

    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();
        // Copy all url parameters to the data request (particularly c and er)
        dataRequest.setProperties(getRequest().getParameterMap());

        // Ensure that the "c" parameter is valid
        String handle = dataRequest.getContentHandle().trim().toLowerCase();
        if (
                !handle.equals("appeal_percentage") &&
                        !handle.equals("avg_placement") &&
                        !handle.equals("avg_score") &&
                        !handle.equals("component_money") &&
                        !handle.equals("high_scores") &&
                        !handle.equals("largest_comp_prize") &&
                        !handle.equals("most_reviews") &&
                        !handle.equals("most_submissions_reviews") &&
                        !handle.equals("most_submissions") &&
                        !handle.equals("most_wins") &&
                        !handle.equals("overall_money") &&
                        !handle.equals("royalties") &&
                        !handle.equals("tournament_money") &&
                        !handle.equals("win_percentage") &&
                        !handle.equals("impressive_debut") &&
                        !handle.equals("consecutive_winnings") &&
                        !handle.equals("consecutive_paid") &&
                        !handle.equals("consecutive_rating_increase") &&
                        !handle.equals("highest_rating_gains")
                ) throw new TCWebException("Invalid c parameter: " + handle);
        getRequest().setAttribute("handle", handle);

        // Ensure that the "type" parameter is valid
        // Set up the inClause ("112", "113", or "112,113") along the way
        String type = dataRequest.getProperty("type");
        if (type == null) type = HandleTag.COMPONENT;

        String inClause = null;
        if (type.trim().toLowerCase().equals(HandleTag.COMPONENT))
            inClause = SoftwareComponent.DESIGN_PHASE + "," + SoftwareComponent.DEV_PHASE;
        else if (type.trim().toLowerCase().equals(HandleTag.DESIGN))
            inClause = "" + SoftwareComponent.DESIGN_PHASE;
        else if (type.trim().toLowerCase().equals(HandleTag.DEVELOPMENT))
            inClause = "" + SoftwareComponent.DEV_PHASE;
        else
            throw new TCWebException("Invalid type parameter: " + type);

        dataRequest.setProperty("pis", inClause); // query input parameter

        DataAccessInt dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
        Map result = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
        getRequest().setAttribute("result", rsc);

        // for statistics that involve money, call the query to find out who wants to hide their payments.
        if (handle.equals("overall_money") ||
                handle.equals("royalties") ||
                handle.equals("tournament_money") ||
                handle.equals("component_money") ||
                handle.equals("largest_comp_prize")) {

            List<Long> hideList = new ArrayList<Long>();
            String coderStr = "";
            for (ResultSetRow rsr : rsc) {
                hideList.add(rsr.getLongItem("coder_id"));
                log.debug("adding: " + rsr.getLongItem("coder_id"));
                coderStr += rsr.getLongItem("coder_id") + ", ";
            }
            coderStr.substring(0, coderStr.length()-2);
            log.debug("cts: " + coderStr);
            
            Request r = new Request();
            r.setContentHandle("users_payments_visible");
            r.setProperty("cts", coderStr);

            DataAccessInt dai2 = getDataAccess(DBMS.OLTP_DATASOURCE_NAME, false);
            Map result2 = dai2.getData(r);
            ResultSetContainer rsc2 = (ResultSetContainer) result2.get("users_payments_visible");

            for (ResultSetRow rsr : rsc2) {
                if (!"hide".equals(rsr.getStringItem("value"))) {
                    hideList.remove(rsr.getLongItem("user_id"));
                }
            }
            getRequest().setAttribute("hideList", hideList);
        }
        
        
        String includeJsp
                = "/compstats/" + dataRequest.getContentHandle() + ".jsp";
        getRequest().setAttribute("includeJsp", includeJsp);
        setNextPage("/compstats/ComponentRecordbook.jsp");
        setIsNextPageInContext(true);
    }
}
