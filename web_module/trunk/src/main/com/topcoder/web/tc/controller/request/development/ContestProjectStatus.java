package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * TODO: change header
 * @author pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ContestProjectStatus extends Base {
    
    private static final String ASSEMBLY_TYPE_ID = "7";
    private static final String ARCHITECTURE_TYPE_ID = "14";

    protected void developmentProcessing() throws TCWebException {
        try {
            String projectTypeId = getRequest().getParameter(Constants.PROJECT_TYPE_ID);
            if (ASSEMBLY_TYPE_ID.equals(projectTypeId) || ARCHITECTURE_TYPE_ID.equals(projectTypeId)) {
                Request r = new Request();
                r.setContentHandle("contest_project_status");
                r.setProperties(getRequest().getParameterMap());
                r.setProperty(DataAccessConstants.SORT_QUERY, "contest_project_status");
                getRequest().setAttribute("contests", getDataAccess().getData(r).get("contest_project_status"));

                getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

                SortInfo s = new SortInfo();
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                setNextPage("/dev/contestProjectStatus.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("Invalid project type specified " + projectTypeId);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }
}
