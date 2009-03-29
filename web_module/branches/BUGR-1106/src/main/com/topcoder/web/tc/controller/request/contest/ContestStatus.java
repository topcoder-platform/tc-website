package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
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

    public static int[] DEFAULT_PROJECT_TYPES = new int[] {
        Constants.DESIGN_PROJECT_TYPE, Constants.DEVELOPMENT_PROJECT_TYPE,
        Constants.ASSEMBLY_PROJECT_TYPE, Constants.ARCHITECTURE_PROJECT_TYPE,
        Constants.APPLICATION_TESTING_PROJECT_TYPE, Constants.SPECIFICATION_PROJECT_TYPE,
        Constants.CONCEPTUALIZATION_PROJECT_TYPE
    };

    public static final String DEFAULT_NAMESPACE = "com.topcoder.web.tc.controller.request.contest.ContestStatus";

    protected void developmentProcessing() throws TCWebException {
        try {

            int projectTypeId= Base.getProjectTypeId(getRequest());


            if (isValidProjectType(projectTypeId)) {
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

    private static  boolean isValidProjectType(int projectTypeId) {
        ConfigManager configManager = ConfigManager.getInstance();

        String[] projectTypes = null;
        if (configManager.existsNamespace(DEFAULT_NAMESPACE)) {
            try {
                projectTypes = configManager.getStringArray(DEFAULT_NAMESPACE, "ValidProjectTypes");
            } catch (UnknownNamespaceException e) {
                e.printStackTrace();
                projectTypes = null;
            }
        }

        if (projectTypes == null) {
            for (int i = 0; i < DEFAULT_PROJECT_TYPES.length; i++) {
                if (projectTypeId == DEFAULT_PROJECT_TYPES[i]) {
                    return true;
                }
            }
        } else {
            for (int i = 0; i < projectTypes.length; i++) {
                String strValue = projectTypeId + "";
                if (strValue.equals(projectTypes[i])) {
                    return true;
                }
            }
        }

        return false;
    }
}
