package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ContestStatus extends Base {
        
    protected void developmentProcessing() throws TCWebException {
        try {

            int projectTypeId= Base.getProjectTypeId(getRequest());


            if (Constants.DESIGN_PROJECT_TYPE==projectTypeId || Constants.DEVELOPMENT_PROJECT_TYPE==projectTypeId ||
                    Constants.ASSEMBLY_PROJECT_TYPE==projectTypeId || Constants.ARCHITECTURE_PROJECT_TYPE==projectTypeId ||
                    Constants.APPLICATION_TESTING_PROJECT_TYPE==projectTypeId) {
                Request r = new Request();
                String commandName = "contest_project_status";
                if (Constants.ARCHITECTURE_PROJECT_TYPE==projectTypeId) {
                    commandName = "architecture_project_status";
                } else if (Constants.DEVELOPMENT_PROJECT_TYPE==projectTypeId) {
                    commandName = "development_project_status";
                } 

                r.setContentHandle(commandName);
                r.setProperties(getRequest().getParameterMap());
                r.setProperty(Constants.PROJECT_TYPE_ID, String.valueOf(projectTypeId));
                
                r.setProperty(DataAccessConstants.SORT_QUERY, commandName);
                getRequest().setAttribute("contests", getDataAccess().getData(r).get(commandName));

                getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

                SortInfo s = new SortInfo();
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                setNextPage("/contest/contestStatus.jsp");
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
