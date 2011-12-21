/*
 * Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.apps.review.rboard.RBoardRegistrationException;
import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.util.spell.ConfigException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.throttle.Throttle;
import com.topcoder.web.tc.Constants;

/**
 * <p>Processor for the user requests to review the components.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>RBoard related tasks were moved to a tcs bean.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
 *   <ol>
 *     <li>Transaction management moved into RBoardApplication EJB.</li>
 *   </ol>
 *
 *   Version 1.0.3 Change notes:
 *   <ol>
 *     <li>Added public non-argument constructor to follow the current TC standards for code development.</li>
 *     <li>Refactored the logic for referencing the project types by client requests. Now the clients will
 *         pass project type/category ID instead of component project phase type ID to refer to project type.</li>
 *     <li>Refactored the logic for handling the requests to split the logic for checking the supported project
 *         types and mapping them to appropriate view into separate private methods.</li>
 *     <li>The project type requested by client is provided as parameter to <code>review_project_detail</code> query to
 *         filter the retrieved projects based on provided type.</li>
 *   </ol>
 *
 *   Version 1.0.4 Change notes:
 *   <ol>
 *     <li>Added support for <code>Architecture</code> project type/category.</li>
 *   </ol>
 *
 *   Version 1.0.5 (TCS Release 2.2.2) Change notes:
 *   <ol>
 *     <li>Added support for Conceptualization, Specification and Application Testing project types.</li>
 *   </ol>
 *
 *   Version 1.0.6 (Studio Coding In Online Review) Change notes:
 *   <ol>
 *     <li>Added support for UI Prototype, RIA Build and RIA Component competitions.</li>
 *   </ol>
 *
 *   Version 1.0.7 (Testing Competition Split Release Assembly 1.0) Change notes:
 *   <ol>
 *     <li>Updated Application Testing to Test Suites.</li>
 *     <li>Added support for new Test Scenarios competitions.</li>
 *   </ol>
 *
 *   Version 1.0.8 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *   </ol>
 *
 *  Version 1.0.9 (Specification Review Signup Pages 1.0) Change notes:
 *   <ol>
 *     <li>Added support for Specification review project types.</li>
 *   </ol>
 *
 *   Version 1.0.10 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Changed the processor so that a terms of use can be agreed to without any dependency to others.</li>
 *     <li>Added sort order to displayed terms of use.</li>
 *   </ol>
 *
 *   Version 1.0.11 (Competition Registration Eligibility v1.0) Change notes:
 *   <ol>
 *     <li>Added eligibility constraints check.</li>
 *   </ol>
 *
 *   Version 1.0.12 Change notes:
 *   <ol>
 *     <li>No longer change phase ID and Project Type ID for spec reviews in nonTransactionalValidation method.
 *     This is responsibility of the RBoardApplication bean.
 *     </li>
 *   </ol>
 *
 *   Version 1.0.13 (Content Creation Contest Online Review and TC Site Integration Assembly version 1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link #validateWithCatalog(int)} method.</li>
 *   </ol>
 *   
 *   Version 1.0.14 (Add Reporting Contest Type) Change notes:
 *   <ol>
 *     <li>Updated {@link #validateWithCatalog(int)} method.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky, snow01, VolodymyrK, FireIce, lmmortal
 * @version 1.0.14
 */
public class ProjectReviewApply extends Base {
    protected long projectId = 0;
    protected int phaseId = 0;
    protected String projectTypeId = null;
    RBoardApplication rBoardApplication = null;
    private static final Throttle throttle = new Throttle(2, 2000);

    /**
     * <p>Constructs new <code>ProjectReviewApply</code> instance. This implementation does nothing.</p>
     */
    public ProjectReviewApply() {
    }

    /**
     * Processes the review position apply on the project.
     *
     * Updated for Specification Review Integration 1.0
     *      - Now specification review projects are also included in validating supported project type.
     *      - specification review project type is handled.
     *
     * @throws TCWebException if any error occurs during processing.
     */
    @SuppressWarnings("unchecked")
    protected void developmentProcessing() throws TCWebException {
        projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        // include specification review project types in the validation
        if (!isProjectTypeSupported(projectTypeId, true)) {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        try {
            if (throttle.throttle(getRequest().getSession().getId())) {
                throw new RequestRateExceededException(getRequest().getSession().getId(), getUser().getUserName());
            }
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));

            // check eligibility constraints
            if (checkEligibilityConstraints(projectId, new ClassResource(this.getClass())) != 0) {
                throw new NavigationException("Could not find project information.");
            }

            phaseId = (Integer.parseInt(projectTypeId) + 111);
            int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));

            if (userIdentified()) {
                //we'll use the existing command, it's overkill, but we're probably not
                //talking high volume here
                Request r = new Request();

                ResultSetContainer detail=null;

                if (phaseId > Constants.SPECIFICATION_COMPETITION_OFFSET) {
                    r.setContentHandle("spec_review_project_detail");
                    r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                    Map results = getDataAccess().getData(r);
                    detail = (ResultSetContainer) results.get("spec_review_project_detail");
                } else {
                    r.setContentHandle("review_project_detail");
                    r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                    r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));
                    r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);
                    Map results = getDataAccess().getData(r);
                    detail = (ResultSetContainer) results.get("review_project_detail");
                }

                int catalog = detail.getIntItem(0, "category_id");

                getRequest().setAttribute("phase_id", detail.getIntItem(0, "phase_id"));

                rBoardApplication = createRBoardApplication();
                nonTransactionalValidation(catalog, reviewTypeId);

                Boolean open = (Boolean) detail.getItem(0, "open").getResultData();
                applicationProcessing(open, (Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);

            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            }
        } catch (PermissionException pe) {
            throw pe;
        } catch (RBoardRegistrationException rbre) {
            throw new NavigationException(rbre.getMessage());
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected RBoardApplication createRBoardApplication() throws CreateException {
        InitialContext ctx = null;
        RBoardApplication rBoardApplication = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.JNDI_FACTORY, ApplicationServer.TCS_APP_SERVER_URL);
            if (log.isDebugEnabled()) {
                log.debug("context: " + ctx.getEnvironment().toString());
            }

            Object objRBoardApplication = ctx.lookup(RBoardApplicationHome.class.getName());
            RBoardApplicationHome rBoardApplicationHome =
                    (RBoardApplicationHome) PortableRemoteObject.narrow(objRBoardApplication, RBoardApplicationHome.class);

            rBoardApplication = rBoardApplicationHome.create();
        } catch (Exception e) {
            throw new CreateException("Could not find bean!" + e);
        } finally {
            close(ctx);
        }
        return rBoardApplication;
    }

    /**
     * This method processes review application.
     *
     * Note: this method was modified so that a terms of use can be agreed to without any dependency to others.
     *
     * @param opensOn the time the review position opens
     * @param reviewTypeId the review type id
     * @throws Exception if any error occurs
     */
    protected void applicationProcessing(Boolean open, Timestamp opensOn, int reviewTypeId) throws Exception {
        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        rBoardApplication.validateUserTrans(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId, getUser().getId(),
                                            open, opensOn, reviewTypeId, primary);

        String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
        int[] roleIds = getResourceRoleIds(reviewTypeId, primary);
        boolean hasMoreTerms = processTermsOfUse(String.valueOf(projectId), getUser().getId(),
            roleIds, "".equals(termsOfUseId) ? -1 : Long.parseLong(termsOfUseId));
        if (!hasMoreTerms) {
            loadCaptcha();
        }

        setNextPage(getReviewTermsView(this.projectTypeId));
        setIsNextPageInContext(true);
    }

    /**
     * Performs non transactional validation of the reviewer.
     *
     * Updated for Specification Review Integration 1.0
     *      - handles specification review project types.
     *      - but RBoard validation happens as per the rules for parent project type only.
     *
     * @param catalog the catalog to validate
     * @param reviewTypeId the review type id to validate
     * @throws Exception if an error occurs
     */
    protected void nonTransactionalValidation(int catalog, int reviewTypeId) throws Exception {
        int type = Integer.parseInt(this.projectTypeId);
        int pid = this.phaseId;

        // Assembly, Architecture, Conceptualization, Specification, Test Suites, Test Scenarios and
        // Studio related competition reviews do not take into consideration the catalogs as for now
        if (validateWithCatalog(type)) {
            rBoardApplication.validateUser(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, catalog, reviewTypeId, getUser().getId(),
                    pid);
        } else {
            rBoardApplication.validateUserWithoutCatalog(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, reviewTypeId,
                    getUser().getId(), type);
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
     * <p>Gets the logical name for the view which is to be used for displaying the terms of use for the reviews of
     * specified type requested by client.</p>
     *
     * @param projectType a <code>String</code> referencing the project type requested by client.
     * @return a <code>String</code> referencing the view to be used for displaying the terms of use for projects of
     *         specified type.
     * @since TCS Release 2.2.0 (TCS-54)
     */
    protected String getReviewTermsView(String projectType) {
        if (projectType.equals(String.valueOf(WebConstants.DESIGN_PROJECT_TYPE))) {
            return Constants.REVIEWER_TERMS;
        } else if (projectType.equals(String.valueOf(WebConstants.DEVELOPMENT_PROJECT_TYPE))) {
            return Constants.REVIEWER_TERMS;
        } else if (projectType.equals(String.valueOf(WebConstants.ASSEMBLY_PROJECT_TYPE))) {
            return Constants.ASSEMBLY_REVIEWER_TERMS;
        } else if (projectType.equals(String.valueOf(WebConstants.ARCHITECTURE_PROJECT_TYPE))) {
            return Constants.ARCHITECTURE_REVIEWER_TERMS;
        } else {
            // we don't need to check for project types, they are already verified.
            return Constants.UNIFIED_REVIEWER_TERMS_PAGE;
        }
    }

    /**
     * Private helper method to decide if a project type should be validated with catalog or not
     *
     * Updated for Specification Review Integration 1.0
     *      - specification project type ids are included in validation.
     *
     * Updated for Content Creation Integration 1.0
     *      - conent creation project type ids are included in validation.
     *
     * @param projectTypeId the project type id
     * @return true if the project type should be validated with the catalog
     *
     * @since 1.0.6
     */
    private boolean validateWithCatalog(int projectTypeId) {
        return projectTypeId != WebConstants.ASSEMBLY_PROJECT_TYPE &&
            projectTypeId != WebConstants.ARCHITECTURE_PROJECT_TYPE &&
            projectTypeId != WebConstants.CONCEPTUALIZATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.TEST_SUITES_PROJECT_TYPE &&
            projectTypeId != WebConstants.TEST_SCENARIOS_PROJECT_TYPE &&
            projectTypeId != WebConstants.UI_PROTOTYPE_PROJECT_TYPE &&
            projectTypeId != WebConstants.RIA_BUILD_PROJECT_TYPE &&
            projectTypeId != WebConstants.RIA_COMPONENT_PROJECT_TYPE &&
            projectTypeId != WebConstants.ASSEMBLY_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.ARCHITECTURE_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.CONCEPTUALIZATION_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.SPECIFICATION_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.TEST_SUITES_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.TEST_SCENARIOS_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.UI_PROTOTYPE_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.RIA_BUILD_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.RIA_COMPONENT_SPECIFICATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.CONTENT_CREATION_PROJECT_TYPE &&
            projectTypeId != WebConstants.REPORTING_PROJECT_TYPE;
    }
}
