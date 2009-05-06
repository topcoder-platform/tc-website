/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.apps.review.rboard.RBoardApplication;
import com.topcoder.apps.review.rboard.RBoardApplicationHome;
import com.topcoder.apps.review.rboard.RBoardRegistrationException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.throttle.Throttle;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;
import com.topcoder.randomstringimg.InvalidConfigException;
import com.topcoder.randomstringimg.ObfuscationException;
import com.topcoder.randomstringimg.RandomStringImage;
import com.topcoder.util.spell.ConfigException;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.sql.Timestamp;
import java.util.Map;
import java.io.IOException;
import java.io.FileOutputStream;

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
 *     <li>Added support for Studio prototype, Studio Build and Studio Component competitions.</li>
 *   </ol>
 * </p>
 *
 * @author dok, isv, pulky
 * @version 1.0.6
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

    protected void developmentProcessing() throws TCWebException {
        projectTypeId = StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_TYPE_ID));
        if (!isProjectTypeSupported(projectTypeId)) {
            throw new TCWebException("Invalid project type specified " + projectTypeId);
        }

        try {
            if (throttle.throttle(getRequest().getSession().getId())) {
                throw new RequestRateExceededException(getRequest().getSession().getId(), getUser().getUserName());
            }
            projectId = Long.parseLong(getRequest().getParameter(Constants.PROJECT_ID));
            phaseId = (Integer.parseInt(projectTypeId) + 111);
            int reviewTypeId = Integer.parseInt(getRequest().getParameter(Constants.REVIEWER_TYPE_ID));

            if (userIdentified()) {
                //we'll use the existing command, it's overkill, but we're probably not
                //talking high volume here
                Request r = new Request();
                r.setContentHandle("review_project_detail");
                r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
                r.setProperty(Constants.PHASE_ID, String.valueOf(phaseId));
                r.setProperty(Constants.PROJECT_TYPE_ID, projectTypeId);
                Map results = getDataAccess().getData(r);
                ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");
                int catalog = detail.getIntItem(0, "category_id");
                getRequest().setAttribute("phase_id", detail.getIntItem(0, "phase_id"));

                rBoardApplication = createRBoardApplication();
                nonTransactionalValidation(catalog, reviewTypeId);

                applicationProcessing((Timestamp) detail.getItem(0, "opens_on").getResultData(), reviewTypeId);

                // Put the terms text in the request.
                TermsOfUse terms = ((TermsOfUse) createEJB(getInitialContext(), TermsOfUse.class));
                setDefault(Constants.TERMS, terms.getText(Constants.REVIEWER_TERMS_ID, DBMS.COMMON_OLTP_DATASOURCE_NAME));
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

    protected void applicationProcessing(Timestamp opensOn, int reviewTypeId) throws Exception {
        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        rBoardApplication.validateUserTrans(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, projectId, phaseId, getUser().getId(),
                                            opensOn, reviewTypeId, primary);

        UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));

        boolean agreed = userTerms.hasTermsOfUse(getUser().getId(),
                Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);

        setDefault(Constants.TERMS_AGREE, String.valueOf(agreed));

        loadCaptcha();
        setNextPage(getReviewTermsView(this.projectTypeId));
        setIsNextPageInContext(true);
    }

    /**
     * Performs non transactional validation of the reviewer.
     *
     * @param catalog the catalog to validate
     * @param reviewTypeId the review type id to validate
     * @throws Exception if an error occurs
     */
    protected void nonTransactionalValidation(int catalog, int reviewTypeId) throws Exception {
        int type = Integer.parseInt(this.projectTypeId);
        // Assembly, Architecture, Conceptualization, Specification, Application Testing competition and
        // Studio related competition reviews do not take into consideration the catalogs as for now
        if (validateWithCatalog(type)) {
            rBoardApplication.validateUser(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, catalog, reviewTypeId, getUser().getId(),
                    this.phaseId);
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
    private String getReviewTermsView(String projectType) {
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
            projectTypeId != WebConstants.APPLICATION_TESTING_PROJECT_TYPE &&
            projectTypeId != WebConstants.STUDIO_PROTOTYPE_PROJECT_TYPE &&
            projectTypeId != WebConstants.STUDIO_BUILD_PROJECT_TYPE &&
            projectTypeId != WebConstants.STUDIO_COMPONENT_PROJECT_TYPE;
    }
}