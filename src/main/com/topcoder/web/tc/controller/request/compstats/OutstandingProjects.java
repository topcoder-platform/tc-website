/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * <strong>Purpose</strong>: A processor to retrieve current projects.
 *
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added support for retrieving current projects for the newly
 *     added tracks (conceptualization, specification, architecture, assembly,
 *     and application testing).
 *     </li>
 *   </ol>
 *
 *   Version 1.2 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites</li>
 *   </ol>
 *
 *   Version 1.3 Change notes:
 *   <ol>
 *     <li>Added support for the Test Scenarios, UI Prototype and RIA Build tracks.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Version 1.4 (Release Assembly - TopCoder Assembly Track Subtypes Integration Assembly 1.0 Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Re-factored the code to ease integration of new <code>Assembly</code> track subtypes.</li>
 *   </ol>
 * </p>
 *
 * @author pulky, elkhawajah, VolodymyrK, isv
 * @version 1.4
 */
public class OutstandingProjects extends BaseProcessor {
    /**
     * The logger to log to.
     */
    private static final Logger log = Logger.getLogger(OutstandingProjects.class);

    /**
     * Process the current projects request. Retrieves the current projects list for a
     * particular coder.
     *
     * @since Member Profile Enhancement assembly
     */
    protected void businessProcessing() throws Exception {
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        int projectTypeId = getProjectTypeId();
        if (!hasParameter(Constants.CODER_ID)) {
            throw new TCWebException("parameter " + Constants.CODER_ID + " expected.");
        }

        // Gets the rest of the optional parameters.
        String sortDir = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_DIRECTION));
        String sortCol = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.SORT_COLUMN));

        String outstandingProjectCommand = "outstanding_projects";
        if (hasParameter(Constants.STAGE_ID)) {
            outstandingProjectCommand = "stage_" + outstandingProjectCommand;
        } else if (hasParameter(Constants.SEASON_ID)) {
            outstandingProjectCommand = "season_" + outstandingProjectCommand;
        }

        // Prepare request for data retrieval
        Request r = new Request();
        if (!(sortCol.equals("") || sortDir.equals(""))) {
            r.setProperty(DataAccessConstants.SORT_DIRECTION, sortDir);
            r.setProperty(DataAccessConstants.SORT_COLUMN, sortCol);
            r.setProperty(DataAccessConstants.SORT_QUERY, outstandingProjectCommand);
        }
        r.setProperty(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));

        String projectTypeIds = getProjectTypeIds(projectTypeId);
        r.setProperty(Constants.PROJECT_TYPES_ID, projectTypeIds);

        if (hasParameter(Constants.STAGE_ID)) {
            r.setProperty(Constants.STAGE_ID, getRequest().getParameter(Constants.STAGE_ID));
        } else if (hasParameter(Constants.SEASON_ID)) {
            r.setProperty(Constants.SEASON_ID, getRequest().getParameter(Constants.SEASON_ID));
        }
        r.setContentHandle(outstandingProjectCommand);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_DW_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer history = (ResultSetContainer) m.get(outstandingProjectCommand);

        if (log.isDebugEnabled()) {
            log.debug("Got " + history.size() + " rows for current projects");
        }

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.HISTORY_LIST_KEY, history);
        String handleType = getHandleType(projectTypeId);
        getRequest().setAttribute(Constants.TYPE_KEY, handleType);
        getRequest().setAttribute(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

        setNextPage(Constants.VIEW_CURRENT_PROJECTS_PAGE);
        setIsNextPageInContext(true);
    }

    /**
     * <p>Gets the name for competition track matching the specified project category.</p>
     *
     * @param projectTypeId an <code>int</code> providing the ID of requested project category.
     * @return a <code>String</code> providing the comma-separated list of project category IDs.
     * @since 1.4
     */
    protected String getHandleType(int projectTypeId) {
        switch (projectTypeId) {
            case Constants.DESIGN_PROJECT_TYPE:
                return HandleTag.DESIGN;
            case Constants.DEVELOPMENT_PROJECT_TYPE:
                return HandleTag.DEVELOPMENT;
            case Constants.CONCEPTUALIZATION_PROJECT_TYPE:
                return HandleTag.CONCEPTUALIZATION;
            case Constants.SPECIFICATION_PROJECT_TYPE:
                return HandleTag.SPECIFICATION;
            case Constants.ARCHITECTURE_PROJECT_TYPE:
                return HandleTag.ARCHITECTURE;
            case Constants.TEST_SUITES_PROJECT_TYPE:
                return HandleTag.TEST_SUITES;
            case Constants.TEST_SCENARIOS_PROJECT_TYPE:
                return HandleTag.TEST_SCENARIOS;
            case Constants.UI_PROTOTYPE_PROJECT_TYPE:
                return HandleTag.UI_PROTOTYPE;
            case Constants.RIA_BUILD_PROJECT_TYPE:
                return HandleTag.RIA_BUILD;
            case Constants.CONTENT_CREATION_PROJECT_TYPE:
                return HandleTag.CONTENT_CREATION;
            case Constants.REPORTING_PROJECT_TYPE:
                return HandleTag.REPORTING;
        }
        return "";
    }

    /**
     * <p>Gets the ID for requested project category to retrieve data for.</p>
     *
     * @return an <code>int</code> providing the ID for requested project category.
     * @throws TCWebException if an unexpected error occurs.
     * @since 1.4
     */
    protected int getProjectTypeId() throws TCWebException {
        int projectTypeId;
        String phaseId = getRequest().getParameter(Constants.PHASE_ID);
        if (hasParameter(Constants.PHASE_ID)) {
            if (!phaseId.equals(String.valueOf(SoftwareComponent.DEV_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.DESIGN_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.CONCEPTUALIZATION_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.SPECIFICATION_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.ARCHITECTURE_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.TEST_SUITES_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.TEST_SCENARIOS_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.UI_PROTOTYPE_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.RIA_BUILD_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.CONTENT_CREATION_PHASE)) &&
                !phaseId.equals(String.valueOf(SoftwareComponent.REPORTING_PHASE))) {
                throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
            }
            projectTypeId = Integer.parseInt(phaseId) - 111;
        } else {
            String projectTypeIdParam = getRequest().getParameter(Constants.PROJECT_TYPE_ID);
            if (!projectTypeIdParam.equals(String.valueOf(Constants.DESIGN_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.DEVELOPMENT_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.CONCEPTUALIZATION_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.SPECIFICATION_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.ARCHITECTURE_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.TEST_SUITES_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.TEST_SCENARIOS_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.UI_PROTOTYPE_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.RIA_BUILD_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.CONTENT_CREATION_PROJECT_TYPE)) &&
                !projectTypeIdParam.equals(String.valueOf(Constants.REPORTING_PROJECT_TYPE))) {
                throw new TCWebException("invalid " + Constants.PROJECT_TYPE_ID + " parameter.");
            }

            projectTypeId = Integer.parseInt(projectTypeIdParam);
        }

        return projectTypeId;
    }

    /**
     * <p>Gets the list of project category IDs for data retrieval.</p>
     *
     * @param projectTypeId an <code>int</code> providing the ID of requested project category.
     * @return a <code>String</code> providing the comma-separated list of project category IDs.
     * @since 1.4
     */
    protected String getProjectTypeIds(int projectTypeId) {
        String projectTypeIds; // add component testing project to the development page
        if (Constants.DEVELOPMENT_PROJECT_TYPE == projectTypeId) {
            projectTypeIds = projectTypeId + ", " + Constants.COMPONENT_TESTING_PROJECT_TYPE;
        } else {
            projectTypeIds = String.valueOf(projectTypeId);
        }
        return projectTypeIds;
    }
}
