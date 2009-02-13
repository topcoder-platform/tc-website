package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.tc.Constants;

/**
 * @author dok, pulky
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 28, 2006
 */
public class ContestStatus extends Base {
    
    public static final String DESIGN_TYPE_ID = "1";
    public static final String DEVELOPMENT_TYPE_ID = "2";
    public static final String ARCHITECTURE_TYPE_ID = "7";
    public static final String ASSEMBLY_TYPE_ID = "14";

    protected void developmentProcessing() throws TCWebException {
        try {
            String projectTypeId = getRequest().getParameter(Constants.PROJECT_TYPE_ID);
            String phaseId = getRequest().getParameter(Constants.PHASE_ID);
            
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId)) {
                projectTypeId = DESIGN_TYPE_ID;
            } else if (String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId)) {
                projectTypeId = DEVELOPMENT_TYPE_ID;
            }  

            if (DESIGN_TYPE_ID.equals(projectTypeId) || DEVELOPMENT_TYPE_ID.equals(projectTypeId) ||
                ASSEMBLY_TYPE_ID.equals(projectTypeId) || ARCHITECTURE_TYPE_ID.equals(projectTypeId)) {
                Request r = new Request();
                String commandName = "contest_project_status";
                if (ARCHITECTURE_TYPE_ID.equals(projectTypeId)) {
                    commandName = "architecture_project_status";
                }

                r.setContentHandle(commandName);
                r.setProperties(getRequest().getParameterMap());
                r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);
                
                r.setProperty(DataAccessConstants.SORT_QUERY, commandName);
                getRequest().setAttribute("contests", getDataAccess().getData(r).get(commandName));

                getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

                SortInfo s = new SortInfo();
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                setNextPage("/dev/contestStatus.jsp");
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
/*    protected void developmentProcessing() throws TCWebException {
        try {
            String phaseId = getRequest().getParameter(Constants.PHASE_ID);
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId)||String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId)) {
                Request r = new Request();
                r.setContentHandle("contest_status");
                r.setProperties(getRequest().getParameterMap());
                r.setProperty(DataAccessConstants.SORT_QUERY, "contest_status");
                getRequest().setAttribute("contests", getDataAccess().getData(r).get("contest_status"));

                getRequest().setAttribute(Constants.PHASE_ID, phaseId);

                SortInfo s = new SortInfo();
                getRequest().setAttribute(SortInfo.REQUEST_KEY, s);

                setNextPage("/dev/contestStatus.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("Invalid phase specified " + phaseId);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    } */
}
