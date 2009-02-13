package com.topcoder.web.tc.controller.request.architecture;

import java.util.Map;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author cucu
 */
public class ViewActiveContests extends Base {
    
    protected void developmentProcessing() throws TCWebException {
        try {
            // Gets sort parameters.
            String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            setDefault(DataAccessConstants.SORT_DIRECTION, getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
            setDefault(DataAccessConstants.SORT_COLUMN, getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

            Request r = new Request();
            r.setContentHandle("active_architecture_contests");
            if (!(sortCol.equals("") || sortDir.equals(""))) {
                r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
                r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            }

            r.setProperty(DataAccessConstants.SORT_QUERY, "active_architecture_contests");
            Map result = getDataAccess().getData(r);
            getRequest().setAttribute("contests", result.get("active_architecture_contests"));

            // defines column's default sort.
            SortInfo s = new SortInfo();
            s.addDefault(3, "asc");   // Catalog    
            s.addDefault(1, "asc");   // Contest
            s.addDefault(4, "desc");   // rated Registrants
            s.addDefault(6, "desc");   // unrated Registrants
            s.addDefault(5, "desc");   // total Registrants
            s.addDefault(2, "desc"); // Reg. End   
            s.addDefault(7, "desc");  // Submissions
            s.addDefault(10, "desc");  // Payment    
            s.addDefault(0, "desc");  // Submit by  
            getRequest().setAttribute(SortInfo.REQUEST_KEY, s);
            
            setNextPage("/architecture/activeContests.jsp");
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
