/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
 */
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
 * <p><strong>Purpose</strong>: This processor handle requests to preview contests status for a specific
 * project type.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *     <li>Added support for new Test Scenarios competitions</li>
 *   </ol>
 *
 *   Version 1.3 (Content Creation Contest Online Review and TC Site Integration Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #DEFAULT_PROJECT_TYPES} constant.</li>
 *   </ol>
 *   
 *   Version 1.4 (Add Reporting Contest Type) Change notes:
 *   <ol>
 *     <li>Updated {@link #DEFAULT_PROJECT_TYPES} constant to support reporting contest type.</li>
 *   </ol>
 *
 *   Version 1.5 (Release Assembly - TopCoder BugHunt Competition Integration) Change notes:
 *   <ol>
 *     <li>Updated {@link #DEFAULT_PROJECT_TYPES} constant to support Bug Hunt contest type.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, FireIce, lmmortal, TCSASSEMBLER
 * @version 1.5
 */
public class ContestStatus extends Base {

    /**
     * <p>An <code>int[]</code> representing default valid project types. This array will be used for
     * validation if the configuration entry is not found.</p>
     */
    public static int[] DEFAULT_PROJECT_TYPES = new int[] {
        Constants.DESIGN_PROJECT_TYPE, Constants.DEVELOPMENT_PROJECT_TYPE,
        Constants.ASSEMBLY_PROJECT_TYPE, Constants.ARCHITECTURE_PROJECT_TYPE,
        Constants.TEST_SUITES_PROJECT_TYPE, Constants.TEST_SCENARIOS_PROJECT_TYPE, Constants.SPECIFICATION_PROJECT_TYPE,
        Constants.CONCEPTUALIZATION_PROJECT_TYPE, Constants.UI_PROTOTYPE_PROJECT_TYPE,
        Constants.RIA_BUILD_PROJECT_TYPE, Constants.RIA_COMPONENT_PROJECT_TYPE, Constants.CONTENT_CREATION_PROJECT_TYPE,
        Constants.REPORTING_PROJECT_TYPE, Constants.BUG_HUNT_PROJECT_TYPE};

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
                } else if (Constants.BUG_HUNT_PROJECT_TYPE == projectTypeId) {
                    commandName = "bug_hunt_project_status";
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
