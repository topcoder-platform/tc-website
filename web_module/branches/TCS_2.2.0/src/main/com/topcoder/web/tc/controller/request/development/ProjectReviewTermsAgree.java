/*
 * Copyright (c) 2006 TopCoder, Inc. All rights reserved.
 */
package com.topcoder.web.tc.controller.request.development;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.ejb.user.UserTermsOfUse;
import com.topcoder.web.tc.Constants;

import java.sql.Timestamp;
import java.util.Map;

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
 * </p>
 *
 * @author dok, pulky, isv
 * @version 1.0.2
 */
public class ProjectReviewTermsAgree extends ProjectReviewApply {

    private static Logger log = Logger.getLogger(ProjectReviewTermsAgree.class);

    /**
     * <p>Constructs new <code>ProjectReviewTermsAgree</code> instance. This implementation does nothing.</p>
     */
    public ProjectReviewTermsAgree() {
    }

    protected void applicationProcessing(Timestamp opensOn, int reviewTypeId) throws Exception {
        if ("POST".equals(getRequest().getMethod())) {
            if (!"on".equalsIgnoreCase(getRequest().getParameter(Constants.TERMS_AGREE))) {
                addError(Constants.TERMS_AGREE, "You must agree to the terms in order to review a component.");
            }

            if (!answeredCaptchaCorrectly()) {
                addError(Constants.CAPTCHA_RESPONSE, "Sorry, your response was incorect.");
            }

            if (hasErrors()) {
                setDefault(Constants.TERMS_AGREE,
                        "on".equalsIgnoreCase(getRequest().getParameter(Constants.TERMS_AGREE)));
                loadCaptcha();
                setNextPage(Constants.REVIEWER_TERMS);
                setIsNextPageInContext(true);
            } else {

                    UserTermsOfUse userTerms = ((UserTermsOfUse) createEJB(getInitialContext(), UserTermsOfUse.class));
                    if (!userTerms.hasTermsOfUse(getUser().getId(),
                            Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME)) {
                        userTerms.createUserTermsOfUse(getUser().getId(),
                                Constants.REVIEWER_TERMS_ID, DBMS.TCS_JTS_OLTP_DATASOURCE_NAME);
                    }
                    apply(opensOn, reviewTypeId);
                    setNextPage("/tc?" + Constants.MODULE_KEY + "=ReviewProjectDetail&" + Constants.PROJECT_ID + "="
                                + projectId + "&" + Constants.PROJECT_TYPE_ID + "=" + this.projectTypeId);
                    setIsNextPageInContext(false);
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

    private void apply(Timestamp opensOn, int reviewTypeId) throws Exception {
        String primary = StringUtils.checkNull(getRequest().getParameter(Constants.PRIMARY_FLAG));

        log.info("processing application for " + getUser().getUserName() + " phase " + phaseId +
                " primary " + primary + " type " + reviewTypeId + " project " + projectId);

        rBoardApplication.createRBoardApplication(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, getUser().getId(), projectId,
                reviewTypeId, phaseId, opensOn, reviewTypeId, new Boolean(primary).booleanValue());

        //send email
        Request r = new Request();
        r.setContentHandle("review_project_detail");
        String projectId = String.valueOf(this.projectId);
        String phaseId = String.valueOf(this.phaseId);
        r.setProperty(Constants.PROJECT_ID, projectId);
        r.setProperty(Constants.PHASE_ID, phaseId);
        r.setProperty(Constants.PROJECT_TYPE_ID, this.projectTypeId);
        Map results = getDataAccess(DBMS.TCS_JTS_OLTP_DATASOURCE_NAME, false).getData(r);
        ResultSetContainer detail = (ResultSetContainer) results.get("review_project_detail");

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