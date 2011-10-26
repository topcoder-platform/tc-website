/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
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
 * @author dok, pulky, VolodymyrK
 * @version 1.3
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
            String phaseId = getRequest().getParameter(Constants.PHASE_ID);
            String userId = getRequest().getParameter(Constants.USER_ID);
            if (String.valueOf(SoftwareComponent.DESIGN_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.DEV_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.CONCEPTUALIZATION_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.SPECIFICATION_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.ARCHITECTURE_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.ASSEMBLY_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.TEST_SUITES_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.TEST_SCENARIOS_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.UI_PROTOTYPE_PHASE).equals(phaseId)
                || String.valueOf(SoftwareComponent.RIA_BUILD_PHASE).equals(phaseId))												
            {
                Request r = new Request();
                r.setContentHandle("reliability_detail");
                r.setProperty(Constants.PHASE_ID, phaseId);
                r.setProperty(Constants.USER_ID, userId);
                getRequest().setAttribute("contests", getDataAccess().getData(r).get("reliability_detail"));

                getRequest().setAttribute(Constants.PHASE_ID, phaseId);
                getRequest().setAttribute(Constants.CODER_ID, userId);

                String handleType = "";
                switch (Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111) {
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
                getRequest().setAttribute(Constants.PROJECT_TYPE_ID,
                    Integer.parseInt(getRequest().getParameter(Constants.PHASE_ID)) - 111);

                setNextPage("/dev/reliabilityDetail.jsp");
                setIsNextPageInContext(true);
            } else {
                throw new TCWebException("Invalid phase specified " + phaseId);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }
}
