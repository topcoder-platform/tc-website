/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import java.util.Date;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.EmailRequest;
import com.topcoder.web.common.model.EmailRequestType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * <p>
 * Verifies the email.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Renamed from <code>VerifySecondEmail</code> to {@link VerifyEmail}.</li>
 *     <li>Moved from my home module to authentication module.</li>
 *     <li>Changed <code>addSecondEmail</code> method to {@link updateEmail}.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.2 (TopCoder Email Management Bug Race - BUGR-9479):
 * <ol>
 *      <li>Update {@link #updateEmail(EmailRequest request)} method.</li>
 * </ol>
 * </p>
 * @author vangavroche, Standlove, TCSASSEMBLER
 * @version 1.2
 */
public class VerifyEmail extends ShortHibernateProcessor {
    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = VerifyEmail.class.getName();

    /**
     * <p>
     * Verifies the email.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    @Override
    protected void dbProcessing() throws Exception {

        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");
        long requestId;
        try {
            requestId = Long.valueOf(this.getRequest().getParameter("requestId"));
        } catch (NumberFormatException e) {
            redirectToUnVerifiedPage("Request id must be an integer.");
            return;
        }
        log.debug("Request param requestId is " + requestId);

        EmailRequest request = DAOUtil.getFactory().getEmailRequestDAO().find(requestId);

        if (request == null) {
            redirectToUnVerifiedPage("The request cannot be found.");
            return;
        }

        log.info("Find the corresponding EmailRequest by the given requestId.");

        int token;
        try {
            token = Integer.valueOf(this.getRequest().getParameter(Constants.RANDOM_KEY));
            if (request.getRandomKey() != token) {
                redirectToUnVerifiedPage("Token does not match.");

                log.info(String.format(
                    "The confirm email is not valid. The original token is %s, The input token is %s",
                    request.getRandomKey(), token));
                return;
            }
        } catch (NumberFormatException e) {
            log.info("key parameter should be an integer.");
            redirectToUnVerifiedPage("The key parameter should be an integer.");
            return;
        }

        log.info("Request param token is valid.");
        Date expiredAt;
        try {
            expiredAt = new Date(Long.valueOf(this.getRequest().getParameter(Constants.EXPIRED_AT)));
            if (!expiredAt.equals(request.getExpiredAt())) {
                log.info(String.format(
                    "The confirm email is not valid. The original expiry date is %s, The input expiry date is %s",
                    request.getExpiredAt(), expiredAt));

                redirectToUnVerifiedPage("The expiredAt parameter does not match our record.");
                return;
            }
            if (expiredAt.before(new Date())) {
                log.info("token has expired.");
                redirectToUnVerifiedPage("The token has expired.");
                return;
            }
        } catch (NumberFormatException e) {
            log.info("expiredAt parameter should be an integer.");
            redirectToUnVerifiedPage("The expiredAt parameter should be an integer.");
            return;
        }
        log.debug("Request param expiredAt is valid.");

        updateEmail(request);
        renderView(Constants.VERIFY_PAGE, null);

        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    

    /**
     * <p>
     * Set unverified page as the view. If the second mail verify link is invalid, call this method at the last
     * step.
     * </p>
     * @param errorMessage the error message
     */
    private void redirectToUnVerifiedPage(String errorMessage) {
        renderView(Constants.UNVERIFY_PAGE, errorMessage);
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * Update the email.
     * In version 1.1, this is changed to <code>updateEmail</code> from <code>addSecondEmail</code>.
     * </p>
     *
     * @param request the change email request
     */
    private void updateEmail(EmailRequest request) {
        User user = DAOUtil.getFactory().getUserDAO().find(request.getUserId());

        if (request.getRequestType() == EmailRequestType.SecondaryEmailConfirmation) {
            Email secondEmail = null;
            for (Email email : user.getEmailAddresses()) {
                if (email.getEmailTypeId().equals(Constants.SECOND_EMAIL_TYPE_ID)) {
                    // already has a second email.
                    secondEmail = email;
                }
            }
            if (secondEmail == null) {
                // no second email before
                secondEmail = new Email();
                user.addEmailAddress(secondEmail);
                this.getRequest().getSession().setAttribute("title", "Add Secondary Email");
                this.getRequest().getSession().setAttribute("action", "added");
            }else{
                this.getRequest().getSession().setAttribute("title", "Update Secondary Email");
                this.getRequest().getSession().setAttribute("action", "updated");
            }

            secondEmail.setEmailTypeId(Constants.SECOND_EMAIL_TYPE_ID);
            secondEmail.setAddress(request.getEmail());
            secondEmail.setPrimary(false);
            secondEmail.setStatusId(Constants.ACTIVE_EMAIL_STATUS);
            secondEmail.setUser(user);
            secondEmail.setNew(true);
            user.addEmailAddress(secondEmail);

            DAOUtil.getFactory().getUserDAO().saveOrUpdate(user);
        } else {
            Email email = user.getPrimaryEmailAddress();
            email.setAddress(request.getEmail());
            DAOUtil.getFactory().getUserDAO().saveOrUpdate(user);
            this.getRequest().getSession().setAttribute("action", "updated");
        }

        log.debug("update the user's email successfully.");
    }

    /**
     * <p>
     * Render the view page. Here NextPageInContext is set to true.
     * </p>
     * 
     * @param destination
     *            the URL of view page.
     * @param errorMessage
     *            the error message if exist.
     */
    private void renderView(String destination, String errorMessage) {
        if (errorMessage != null) {
            this.addError(Constants.ERROR_INFO, errorMessage);
        }
        setNextPage(destination);
        setIsNextPageInContext(true);
    }
}
