package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;
import com.topcoder.web.tc.model.SoftwareComponent;

public class ComponentRecordbook extends Static {

    protected void businessProcessing() throws Exception {
        Request dataRequest = new Request();
        // Copy all url parameters to the data request (particularly c and er)
        dataRequest.setProperties(getRequest().getParameterMap());

        // Ensure that the "c" parameter is valid
        String handle = dataRequest.getContentHandle().trim().toLowerCase();
        if (
            !handle.equals("avg_placement") &&
            !handle.equals("component_money") &&
            !handle.equals("high_scores") &&
            !handle.equals("largest_comp_prize") &&
            !handle.equals("most_reviews") &&
            !handle.equals("most_submissions") &&
            !handle.equals("most_wins") &&
            !handle.equals("overall_money") &&
            !handle.equals("royalties") &&
            !handle.equals("tournament_money") &&
            !handle.equals("win_percentage")
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
            throw new TCWebException ("Invalid type parameter: " + type);
        
        dataRequest.setProperty("pis", inClause);
        
        DataAccessInt dai = getDataAccess(DBMS.TCS_DW_DATASOURCE_NAME, true);
        Map result = dai.getData(dataRequest);

        ResultSetContainer rsc = (ResultSetContainer) result.get(dataRequest.getContentHandle());
        String sortCol = getRequest().getParameter(DataAccessConstants.SORT_COLUMN);
        String sortDir = getRequest().getParameter(DataAccessConstants.SORT_DIRECTION);
        if (sortCol != null && sortDir != null && rsc != null)
            rsc.sortByColumn(sortCol, sortDir.trim().toLowerCase().equals("asc"));

        getRequest().setAttribute("resultMap", result);
        getRequest().setAttribute("result", rsc);

        try {
            String includeJsp 
                = "/compstats/" + dataRequest.getContentHandle() + ".jsp"; 
            getRequest().setAttribute("includeJsp", includeJsp);
            setNextPage("/compstats/SimpleQuery.jsp");
            setIsNextPageInContext(true);
        } catch (MissingResourceException e) {
            super.businessProcessing();
        }


    }

}
