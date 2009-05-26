package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.model.SortInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 4, 2006
 */
public class ViewActiveContests extends Base {
    private String PHASE_ID_KEY = Constants.PHASE_ID;
    
    protected void developmentProcessing() throws TCWebException {
        try {
            int phase_id = Integer.parseInt(StringUtils.checkNull(getRequest().getParameter(PHASE_ID_KEY)));
            if (!(phase_id == SoftwareComponent.DESIGN_PHASE || phase_id == SoftwareComponent.DEV_PHASE)) {
                throw new TCWebException("Missing or invalid phase_id parameter (" + PHASE_ID_KEY + ") expected)");
            }
            getRequest().setAttribute("phase_id_is_design", new Boolean(phase_id == SoftwareComponent.DESIGN_PHASE));


            // Gets sort parameters.
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            Request r = new Request();
            r.setContentHandle("active_contests");
            if (!(sortCol.equals("") || sortDir.equals(""))) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            }
            r.setProperty(DataAccessConstants.SORT_QUERY, "active_contests");
            getRequest().setAttribute("resultMap", getDataAccess().getData(r));

            // defines column's default sort.
            SortInfo s = new SortInfo();
            s.addDefault(3, "asc");   // Catalog    
            s.addDefault(2, "asc");   // Component  
            s.addDefault(4, "desc");   // rated Registrants
            s.addDefault(5, "desc");   // unrated Registrants
            s.addDefault(7, "desc");   // total Registrants
            s.addDefault(10, "desc"); // Reg. End   
            s.addDefault(6, "desc");  // Submissions
            s.addDefault(1, "desc");  // Payment    
            s.addDefault(0, "desc");  // Submit by  
            s.addDefault(15, "desc"); // dr points   
            s.addDefault(16, "asc"); // dr points   
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            
            setNextPage("/dev/activeContests.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
