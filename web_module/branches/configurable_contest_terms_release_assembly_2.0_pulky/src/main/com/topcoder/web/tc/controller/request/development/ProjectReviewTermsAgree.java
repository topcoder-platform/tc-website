/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import java.sql.Timestamp;
import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseEntity;
import com.topcoder.web.ejb.termsofuse.TermsOfUseLocator;
import com.topcoder.web.tc.Constants;

/**
 * <p>Processor the user requests to review the components after accepting terms of use.</p>
 *
 * <p>
 *   Version 1.0.1 Change notes:
 *   <ol>
 *     <li>RBoard related tasks were moved to a tcs bean.</li>
 *   </ol>
 *
 *   Version 1.0.2 Change notes:
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
 *   Version 1.0.3 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added new functionality that asks for several terms of use and show those the user already agreed to.</li>
 *   </ol>
 *
 *   Version 1.0.4 (Specification Review Integration 1.0) Change notes:
 *   <ol>
 *     <li>Added apply logic to handle apply for specification review positions</li>
 *   </ol>
 *
 *   Version 1.0.5 (Configurable Contest Terms Release Assembly v2.0) Change notes:
 *   <ol>
 *     <li>Fixed processor to redirect to the corresponding page based on project type.</li>
 *   </ol>
 * </p>
 *
 * @author dok, pulky, isv, snow01
 * @version 1.0.5
 */
public class ProjectReviewTermsAgree extends ProjectReviewApply {

    private static Logger log = Logger.getLogger(ProjectReviewTermsAgree.class);

    /**
     * <p>Constructs new <code>ProjectReviewTermsAgree</code> instance. This implementation does nothing.</p>
     */
    public ProjectReviewTermsAgree() {
    }

    /**
     * This method processes review application.
     *
     * @param opensOn the time the review position opens
     * @param reviewTypeId the review type id
     * @throws Exception if any error occurs
     */
    protected void applicationProcessing(Timestamp opensOn, int reviewTypeId) throws Exception {
        String termsOfUseId = StringUtils.checkNull(getRequest().getParameter(Constants.TERMS_OF_USE_ID));
        boolean primary = new Boolean(StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG))).booleanValue();
        setDefault(Constants.PRIMARY_FLAG, primary);

        long userId = getUser().getId();

        if ("POST".equals(getRequest().getMethod())) {
            if (!"".equals(termsOfUseId)) {

                if (!"on".equalsIgnoreCase(getRequest().getParameter(Constants.TERMS_AGREE))) {
                    addError(Constants.TERMS_AGREE, "You must agree to the terms in order to review a component.");

                    TermsOfUse termsOfUse = TermsOfUseLocator.getService();
                    TermsOfUseEntity terms =  termsOfUse.getEntity(Long.parseLong(termsOfUseId),
                            DBMS.COMMON_OLTP_DATASOURCE_NAME);
                    getRequest().setAttribute(Constants.TERMS, terms);
                } else {
                    // save user terms of use record
                    saveUserTermsOfUse(userId, Long.parseLong(termsOfUseId));

                    loadCaptcha();

                    // process terms of use
                    int[] roleIds = getResourceRoleIds(reviewTypeId, primary);
                    processTermsOfUse(String.valueOf(projectId), userId, roleIds);
                }
                setNextPage(getReviewTermsView(projectTypeId));
                setIsNextPageInContext(true);
            } else {
                if (!answeredCaptchaCorrectly()) {
                    addError(Constants.CAPTCHA_RESPONSE, "Sorry, your response was incorect.");
                }

                // make sure they don't have pending terms of use
                int[] roleIds = getResourceRoleIds(reviewTypeId, primary);
                if (hasErrors() || processTermsOfUse(String.valueOf(projectId), userId, roleIds)) {
                    loadCaptcha();

                    setNextPage(getReviewTermsView(projectTypeId));
                    setIsNextPageInContext(true);
                } else {
                    apply(opensOn, reviewTypeId);
                    setNextPage("/tc?" + Constants.MODULE_KEY + "=ReviewProjectDetail&" + Constants.PROJECT_ID + "="
                                + projectId + "&" + Constants.PROJECT_TYPE_ID + "=" + this.projectTypeId);
                    setIsNextPageInContext(false);
                }
            }
        } else {
            throw new NavigationException("Invalid request type.");
        }
    }

    private boolean answeredCaptchaCorrectly() throws NavigationException {
        String response = StringUtils.checkNull(getRequest().getParameter(Constants.CAPTCHA_RESPONSE));
        String word = (String)getRequest().getSession().getAttribute(Constants.CAPTCHA_WORD);
        if (word==null) {
            throw new NavigationException("Sorry, your session has expired, please start your registration again.");
        } else {
            return word.compareToIgnoreCase(response.trim())==0;
        }
    }

    /**
     * Does the apply to the review.
     *
     * It adds database entry to add user for the project review.
     * It additionally sends email to PM.
     *
     * Updated for Specification Review Integration 1.0
     *      - Now handles the logic for apply to specification review positions too.
     *      - Specification Review Positions has phase id or project id +1000 than normal phase id or project id, respectively.
     *        This logic is used to identify the case and then differently handle the apply.
     *
     * @param opensOn the time at which review opens
     * @param reviewTypeId the type of reviewer
     * @throws Exception if any error occurs during apply.
     */
    private void apply(Timestamp opensOn, int reviewTypeId) throws Exception {
        String primary = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG));

        log.info("processing application for " + getUser().getUserName() + " phase " + phaseId +
                " primary " + primary + " type " + reviewTypeId + " project " + projectId);

        if (this.phaseId > Constants.SPECIFICATION_COMPETITION_OFFSET) {
            rBoardApplication.createSpecReviewRBoardApplication(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId,
                    reviewTypeId, phaseId, opensOn, reviewTypeId, new Boolean(primary).booleanValue());
        } else {
            rBoardApplication.createRBoardApplication(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId,
                    reviewTypeId, phaseId, opensOn, reviewTypeId, new Boolean(primary).booleanValue());
        }


         ResultSetContainer detail = null;
        Map results = null;

        // send email
        Request r = new Request();
        String projectId = String.valueOf(this.projectId);
        if (this.phaseId > Constants.SPECIFICATION_COMPETITION_OFFSET) {
            r.setContentHandle("spec_review_project_detail");

            r.setProperty(Constants.PROJECT_ID, projectId);
            results = getDataAccess(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, false).getData(r);
            detail = (ResultSetContainer) results.get("spec_review_project_detail");
        } else {
            r.setContentHandle("review_project_detail");

            String phaseIdStr = String.valueOf(this.phaseId);
            r.setProperty(Constants.PROJECT_ID, projectId);
            r.setProperty(Constants.PHASE_ID, phaseIdStr);
            r.setProperty(Constants.PROJECT_TYPE_ID, this.projectTypeId);
            results = getDataAccess(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, false).getData(r);
            detail = (ResultSetContainer) results.get("review_project_detail");
        }

        String component_name = detail.getStringItem(0, "component_name");
        String phase = detail.getStringItem(0, "phase_desc");
        String version = detail.getStringItem(0, "version_text");
        String lang = detail.getStringItem(0, "catalog");

        String handle = getUser().getUserName();

        //lookup pm email
        r = new Request();
        r.setContentHandle("pm_details");
        r.setProperty(Constants.PROJECT_ID, StringUtils.checkNull(getRequest().getParameter(Constants.PROJECT_ID)));
        results = getDataAccess().getData(r);
        detail = (ResultSetContainer) results.get("pm_details");

        String address = detail.getStringItem(0, "address");
        if (log.isDebugEnabled()) {
            log.debug("ORIGINAL ADDRESS IS: " + address);
        }

        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject("New Review Application");
        StringBuffer sb = new StringBuffer();
        sb.append(handle + " has applied to review:\n\n");
        sb.append("Component: " + component_name + "\n");
        sb.append("Version: " + version + "\n");
        sb.append("Language: " + lang + "\n");
        sb.append("Phase: " + phase + "\n");
        sb.append("http://");
        sb.append(ApplicationServer.SERVER_NAME);
        sb.append("/tc?module=ReviewProjectDetail&");
        sb.append(Constants.PROJECT_ID);
        sb.append("=");
        sb.append(projectId);
        sb.append("&");
        sb.append(Constants.PROJECT_TYPE_ID);
        sb.append("=");
        sb.append(this.projectTypeId);
        sb.append("\n");

        mail.setBody(sb.toString());
        mail.setFromAddress("review@topcoder.com");
        //mail.setToAddress("rfairfax@topcoder.com", TCSEmailMessage.TO);
        mail.setToAddress(address, TCSEmailMessage.TO);

        EmailEngine.send(mail);
    }
}
