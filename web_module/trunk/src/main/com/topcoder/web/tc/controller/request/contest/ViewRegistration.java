/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import java.io.FileOutputStream;
import java.io.IOException;

import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.util.spell.ConfigException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServices;
import com.topcoder.web.ejb.ComponentRegistrationServices.ComponentRegistrationServicesLocal;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.development.Base;


/**
 * <p><strong>Purpose</strong>: This processor handle requests to register to a specific project.</p>
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
 * </p>
 *
 * <p>
 *   Version 1.2 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.3 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Changed the processor so that a terms of use can be agreed to without any dependency to others.</li>
 *     <li>Added sort order to displayed terms of use.</li>
 *   </ol>
 * </p>
 *
 * <p>
 *   Version 1.4 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky
 * @version 1.4
 */
public class ViewRegistration extends Base {

    private ComponentRegistrationServicesLocal regServices = null;

    protected int projectTypeId = 0;

    /**
     * This method is the final processor for the request
     *
     * @throws TCWebException if any error occurs
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws TCWebException {

        try {

            if (!SecurityHelper.hasPermission(getLoggedInUser(), new ClassResource(this.getClass()))) {
                throw new PermissionException(getLoggedInUser(), new ClassResource(this.getClass()));
            }

            validation();

            if (getRequest().getAttribute(Constants.MESSAGE) != null) {
                setNextPage("/contest/message.jsp");
                setIsNextPageInContext(true);
            } else {
                String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
                String projectId = getRequest().getParameter(Constants.PROJECT_ID);

                // process terms of use
                long userId = getLoggedInUser().getId();
                boolean hasMoreTerms = processTermsOfUse(projectId, userId, Base.SUBMITTER_ROLE_IDS,
                    "".equals(termsOfUseId) ? -1 : Long.parseLong(termsOfUseId));
                if (!hasMoreTerms) {
                    //we're assuming that if we're here, we got a valid project id
                    loadCaptcha();
                }

                setDefault(Constants.PROJECT_ID, projectId);
                setNextPage("/contest/regTerms.jsp");
                setIsNextPageInContext(true);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }


   protected void loadCaptcha() throws IOException, InvalidConfigException, ObfuscationException, ConfigException {
        RandomStringImage rsi = new RandomStringImage(Constants.RANDOM_STRING_IMAGE_CONFIG);

        String fileName = getUser().getId() + "_" + System.currentTimeMillis() + ".png";
        FileOutputStream fos = new FileOutputStream(Constants.CAPTCHA_PATH + fileName);
        //so, i'm using the dictionary here because you can't use this component without configuring
        //a dictionary, i went to the effort of getting one, so might as well use it.
        //i'd rather just use a random string, but then i would need a keygenerator component
        //to do that, so i'll just use the dictionary
        String word = rsi.generateRandomFromDictionaries(fos);
        fos.close();
        getRequest().getSession().setAttribute(Constants.CAPTCHA_WORD, word);
        getRequest().setAttribute(Constants.CAPTCHA_FILE_NAME, fileName);
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

        // check eligibility constraints
        if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
            throw new NavigationException("Could not find project information.");
        }

        projectTypeId = getProjectTypeId(projectId);

        if (!String.valueOf(projectTypeId).equals(String.valueOf(Constants.ASSEMBLY_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.ARCHITECTURE_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.COMPONENT_TESTING_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.CONCEPTUALIZATION_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.SPECIFICATION_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.TEST_SUITES_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.TEST_SCENARIOS_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.UI_PROTOTYPE_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.RIA_BUILD_PROJECT_TYPE)) &&
                !String.valueOf(projectTypeId).equals(String.valueOf(Constants.RIA_COMPONENT_PROJECT_TYPE))) {
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



