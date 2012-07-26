/*
 * Copyright (C) 2004 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.SoftwareComponent;
import com.topcoder.web.common.tag.HandleTag;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This class used to retreive the reliability details for a given user in a specific track.
 * </p>
 *
 * <p>
 *   Version 1.1 (Member Profile Enhancement 1.0) Change notes:
 *   <ol>
 *     <li>
 *     Added support for retrieving reliability details for the newly
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
 * @author dok, pulky, VolodymyrK, isv
 * @version 1.4
 */
public class ReliabilityDetail extends Base {

    /**
     * <p>
     * Process the reliability detail information, retrieve the information
     * and forward to reliabilityDetail.jsp page, and this method
     * support all tracks.
     * </p>
     *
     * @since Member Profile Enhancement assembly.
     */
    protected void developmentProcessing() throws TCWebException {
        try {
            int projectTypeId = getProjectTypeId();
            String userId = getRequest().getParameter(Constants.USER_ID);

            Request r = new Request();
            r.setContentHandle("reliability_detail");
            r.setProperty(Constants.PROJECT_TYPES_ID, getProjectTypeIds(projectTypeId));
            r.setProperty(Constants.USER_ID, userId);
            getRequest().setAttribute("contests", getDataAccess().getData(r).get("reliability_detail"));

            getRequest().setAttribute(Constants.PHASE_ID, projectTypeId + 111);
            getRequest().setAttribute(Constants.CODER_ID, userId);

            String handleType = getHandleType(projectTypeId);

            getRequest().setAttribute(Constants.TYPE_KEY, handleType);
            getRequest().setAttribute(Constants.PROJECT_TYPE_ID,
                                      Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111);

            setNextPage("/dev/reliabilityDetail.jsp");
            setIsNextPageInContext(true);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


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
                throw new TCWebException("Invalid phase specified " + phaseId);
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
                throw new TCWebException("Invalid project type specified " + projectTypeIdParam);
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
        return String.valueOf(projectTypeId);
    }
}
