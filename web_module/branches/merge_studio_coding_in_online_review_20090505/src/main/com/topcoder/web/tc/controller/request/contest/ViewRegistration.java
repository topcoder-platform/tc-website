/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.*;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServicesLocal;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocal;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;

/**
 * <p><strong>Purpose</strong>: This processor handle requests to register to a specific project.</p>
 *
 * <p>
 *   Version 1.1 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for new Studio prototype, Studio Build and Studio Component competitions.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.1
 */
public class ViewRegistration extends Base {

    private ComponentRegistrationServicesLocal regServices = null;

    protected int projectTypeId = 0;

    protected void developmentProcessing() throws TCWebException {

        try {

            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            if (getRequest().getAttribute(Constants.MESSAGE) == null) {
                setDefault(Constants.TERMS, getTerms());
                //we're assuming that if we're here, we got a valid project id
                setDefault(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
                setNextPage("/contest/regTerms.jsp");
                setIsNextPageInContext(true);
            } else {
                setNextPage("/contest/message.jsp");
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

    }

    protected String getTerms() throws Exception {
        TermsOfUseLocal t = (TermsOfUseLocal) createLocalEJB(getInitialContext(), TermsOfUse.class);
        return t.getText(Constants.PROJECT_TERMS_ID, DBMS.OLTP_DATASOURCE_NAME);

    }

    /**
     * <p>This helper method handles the validation of the request.</p>
     *
     * <p>Note: validation messages will be added to the request as an attribute.</p>
     *
     * @throws NavigationException if the specified project is invalid or if the project category is not supported.
     * @throws Exception if project type id can't be retrieved.
     */
    protected void validation() throws Exception {
        long projectId = 0;
        if (!StringUtils.isNumber(getRequest().getParameter(Constants.PROJECT_ID))) {
            throw new NavigationException("Invalid project specified");
        } else {
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
        }

        projectTypeId = getProjectTypeId(projectId);

        if (!String.valueOf(projectTypeId).equals(String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.ARCHITECTURE_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.COMPONENT_TESTING_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.CONCEPTUALIZATION_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.SPECIFICATION_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.APPLICATION_TESTING_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.STUDIO_PROTOTYPE_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.STUDIO_BUILD_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.STUDIO_COMPONENT_PROJECT_TYPE))) {
            throw new NavigationException("Invalid project specified (wrong category)");
        }

        getRequest().setAttribute(Constants.PROJECT_TYPE_ID, new Integer(projectTypeId));

        if (isSuspended(getUser().getId())) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, you are not eligible to participate because you are suspended.");
        } else if (!getRegEJB().isRegOpen(projectId, DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "Sorry, registration is not currently open.");
        } else if (getRegEJB().isUserRegistered(projectId, getUser().getId(), DBMS.TCS_OLTP_DATASOURCE_NAME)) {
            getRequest().setAttribute(Constants.MESSAGE, "You have already registered for this contest.");
        }
    }

    protected ComponentRegistrationServicesLocal getRegEJB() throws Exception {
        if (regServices == null) {
            regServices = (ComponentRegistrationServicesLocal) createLocalEJB(getInitialContext(),
                    ComponentRegistrationServices.class);
        }
        return regServices;
    }

    private static boolean isSuspended(long userId) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("component_suspension");
        r.setProperty("uid", String.valueOf(userId));
        ResultSetContainer rsc = (ResultSetContainer) dAccess.getData(r).get("component_suspension");
        return !rsc.isEmpty();
    }
}



