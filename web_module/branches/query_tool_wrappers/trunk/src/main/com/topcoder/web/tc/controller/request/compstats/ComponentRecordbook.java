package com.topcoder.web.tc.controller.request.compstats;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.UserPreference;
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

        // for statistics that involve money, find out who wants to hide their payments.
        if (handle.equals("overall_money") ||
                handle.equals("royalties") ||
                handle.equals("tournament_money") ||
                handle.equals("component_money") ||
                handle.equals("largest_comp_prize")) {

            List<Long> coderList = new ArrayList<Long>(rsc.size());
            for (ResultSetRow rsr : rsc) {
                coderList.add(rsr.getLongItem("coder_id"));
            }

            if (!DAOUtil.useQueryToolFactory) {
                HibernateUtils.getSession().beginTransaction();
            }
            List<UserPreference> upList  = DAOUtil.getQueryToolFactory().getUserPreferenceDAO().find(coderList, Preference.SHOW_EARNINGS_PREFERENCE_ID);
            List<Long> hideList = new ArrayList<Long>();
            for (UserPreference up : upList) {
                if ("hide".equals(up.getValue())) {
                    log.debug("adding: " + up.getId().getUser().getId());
                    hideList.add(up.getId().getUser().getId());
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
