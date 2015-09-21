/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import java.util.Date;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.EmailRequest;
import com.topcoder.web.common.model.EmailRequestType;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;

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
 * Changes in version 1.2 (TopCoder Password Recovery Update - BUGR-9487):
 * <ol>
 *      <li>Update {@link #updateEmail(EmailRequest request)} method.</li>
 *      <li>Add {@link #sendEmailChangeNotification(String, String, String)} method.</li>
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

        String emailType = WebConstants.SECOND_EMAIL_TYPE;
        String originAddr = null;

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
                this.getRequest().getSession().setAttribute("title", "Add Second Email");
                this.getRequest().getSession().setAttribute("action", "added");
            }else{
                this.getRequest().getSession().setAttribute("title", "Update Second Email");
                this.getRequest().getSession().setAttribute("action", "updated");
                originAddr = secondEmail.getAddress();
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
            emailType = WebConstants.PRIMARY_EMAIL_TYPE;
            Email email = user.getPrimaryEmailAddress();
            originAddr = email.getAddress();
            email.setAddress(request.getEmail());
            DAOUtil.getFactory().getUserDAO().saveOrUpdate(user);
            this.getRequest().getSession().setAttribute("action", "updated");
        }

        try {
            sendEmailChangeNotification(emailType, originAddr, request.getEmail());
        } catch(Exception e) {
            redirectToUnVerifiedPage("send email change notification failed.");
            return;
        }
        log.debug("update the user's email successfully.");
    }

    /**
     * <p>
     * send email notification when user change the primary or secondary email address.
     * </p>
     * @param emailType
     * @param originalEmailAddr
     * @param destEmailAddr
     * @throws Exception
     */
    private void sendEmailChangeNotification(String emailType, String originalEmailAddr, String destEmailAddr) throws Exception {
        if (originalEmailAddr == null || destEmailAddr == null || originalEmailAddr.equals(destEmailAddr)) {
            return;
        }
        EmailValidator mailValidator = new EmailValidator();
        String[] addrs = new String[] {originalEmailAddr, destEmailAddr};
        for (String addr : addrs) {
            ValidationResult vr = mailValidator.validate(new StringInput(addr));
            if (!vr.isValid()) {
                addError(Constants.ERROR_INFO, vr.getMessage());
                return;
            }
        }

        // send the email
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(Constants.EMAIL_CHANGE_NOTIFY_MAIL_SUBJECT);
        String body = Constants.EMAIL_CHANGE_NOTIFY_MAIL_BODY;
        body = body.replace("{email_type}", emailType).replace("{old_email}",originalEmailAddr).replace("{new_email}",destEmailAddr);
        mail.setBody(body);

        mail.addToAddress(originalEmailAddr, TCSEmailMessage.TO);
        mail.addToAddress(destEmailAddr, TCSEmailMessage.TO);
        mail.setFromAddress(Constants.EMAIL_CHANGE_NOTIFY_MAIL_FROM_ADDRESS, Constants.EMAIL_CHANGE_NOTIFY_MAIL_FROM_PERSONAL);
        EmailEngine.send(mail);

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
