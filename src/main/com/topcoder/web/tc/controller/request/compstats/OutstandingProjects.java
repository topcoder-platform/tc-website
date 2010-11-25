/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
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
 * @author pulky, elkhawajah, VolodymyrK
 * @version 1.3
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
        int projectTypeId;
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (hasParameter(Constants.PHASE_ID)
            && !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DEV_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(String.valueOf(SoftwareComponent.DESIGN_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.CONCEPTUALIZATION_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.SPECIFICATION_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.ARCHITECTURE_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID)
                .equals(String.valueOf(SoftwareComponent.ASSEMBLY_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.TEST_SUITES_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.TEST_SCENARIOS_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.UI_PROTOTYPE_PHASE))
            && !getRequest().getParameter(Constants.PHASE_ID).equals(
                String.valueOf(SoftwareComponent.RIA_BUILD_PHASE))) {												
            throw new TCWebException("invalid " + Constants.PHASE_ID + " parameter.");
        }

        if (!hasParameter(Constants.PHASE_ID)) {
            if (!getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                String.valueOf(Constants.DESIGN_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.DEVELOPMENT_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.CONCEPTUALIZATION_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.SPECIFICATION_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.ARCHITECTURE_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.TEST_SUITES_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.TEST_SCENARIOS_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.UI_PROTOTYPE_PROJECT_TYPE))
                && !getRequest().getParameter(Constants.PROJECT_TYPE_ID).equals(
                    String.valueOf(Constants.RIA_BUILD_PROJECT_TYPE))) {															
                throw new TCWebException("invalid " + Constants.PROJECT_TYPE_ID + " parameter.");
            }

            projectTypeId = Integer.parseInt(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        } else {
            projectTypeId = Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111;
        }

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

        String projectTypeIds;
        // add component testing project to the development page
        if (Constants.DEVELOPMENT_PROJECT_TYPE == projectTypeId) {
            projectTypeIds = projectTypeId + ", " + Constants.COMPONENT_TESTING_PROJECT_TYPE;
        } else {
            projectTypeIds = String.valueOf(projectTypeId);
        }
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
        String handleType = "";
        switch (projectTypeId) {
            case Constants.DESIGN_PROJECT_TYPE:
                handleType = HandleTag.DESIGN;
                break;
            case Constants.DEVELOPMENT_PROJECT_TYPE:
                handleType = HandleTag.DEVELOPMENT;
                break;
            case Constants.ASSEMBLY_PROJECT_TYPE:
                handleType = HandleTag.ASSEMBLY;
                break;
            case Constants.CONCEPTUALIZATION_PROJECT_TYPE:
                handleType = HandleTag.CONCEPTUALIZATION;
                break;
            case Constants.SPECIFICATION_PROJECT_TYPE:
                handleType = HandleTag.SPECIFICATION;
                break;
            case Constants.ARCHITECTURE_PROJECT_TYPE:
                handleType = HandleTag.ARCHITECTURE;
                break;
            case Constants.TEST_SUITES_PROJECT_TYPE:
                handleType = HandleTag.TEST_SUITES;
                break;
            case Constants.TEST_SCENARIOS_PROJECT_TYPE:
                handleType = HandleTag.TEST_SCENARIOS;
                break;
            case Constants.UI_PROTOTYPE_PROJECT_TYPE:
                handleType = HandleTag.UI_PROTOTYPE;
                break;
            case Constants.RIA_BUILD_PROJECT_TYPE:
                handleType = HandleTag.RIA_BUILD;
                break;												
        }
        getRequest().setAttribute(Constants.TYPE_KEY, handleType);
        getRequest().setAttribute(Constants.CODER_ID, getRequest().getParameter(Constants.CODER_ID));
        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, projectTypeId);

        setNextPage(Constants.VIEW_CURRENT_PROJECTS_PAGE);
        setIsNextPageInContext(true);
    }
}
