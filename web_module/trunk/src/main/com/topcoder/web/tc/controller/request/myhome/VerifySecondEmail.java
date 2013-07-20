/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import java.util.Date;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.SecondEmailRequest;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.dao.DAOUtil;

/**
 * <p>
 * Active the second email.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class VerifySecondEmail extends ShortHibernateProcessor {
    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = VerifySecondEmail.class.getName();

    /**
     * <p>
     * The unverified message.
     * </p>
     */
    private final static String MESSAGE = "The second mail verify link is invalid.";

    /**
     * <p>
     * Active the second email.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    @Override
    protected void dbProcessing() throws Exception {

        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");
        long userId;
        try {
            userId = Long.valueOf(this.getRequest().getParameter(Constants.CODER_ID));
        } catch (NumberFormatException e) {
            redirectToUnVerifiedPage();
            return;
        }
        log.debug("Request param userId is " + userId);

        SecondEmailRequest request = DAOUtil.getFactory().getSecondEmailRequestDAO().find(userId);

        if (request == null) {
            redirectToUnVerifiedPage();
            return;
        }

        log.debug("Find the corresponding SecondEmailRequest by the given userId.");

        int token;
        try {
            token = Integer.valueOf(this.getRequest().getParameter(Constants.RANDOM_KEY));
            if (request.getRandomeKey() != token) {
                redirectToUnVerifiedPage();

                log.debug(String.format(
                    "The confirm email is not valid. The original token is %s, The input token is %s",
                    request.getRandomeKey(), token));
                return;
            }
        } catch (NumberFormatException e) {
            redirectToUnVerifiedPage();
            return;
        }

        log.debug("Request param token is valid.");
        Date expiredAt;
        try {
            expiredAt = new Date(Long.valueOf(this.getRequest().getParameter(Constants.EXPIRED_AT)));
            if (!expiredAt.equals(request.getExpiredAt())) {
                redirectToUnVerifiedPage();

                log.debug(String.format(
                    "The confirm email is not valid. The original expire date is %s, The input exipire date is %s",
                    request.getExpiredAt(), expiredAt));

                return;
            }
            if (expiredAt.before(new Date())) {
                redirectToUnVerifiedPage();
                return;
            }
        } catch (NumberFormatException e) {
            redirectToUnVerifiedPage();
            return;
        }
        log.debug("Request param expiredAt is valid.");

        addSecondEmail(userId, request.getSecondMail());
        renderView(Constants.VERIFY_PAGE, null);

        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * Set unverified page as the view. If the second mail verify link is invalid, call this method at the last
     * step.
     * </p>
     */
    private void redirectToUnVerifiedPage() {
        renderView(Constants.UNVERIFY_PAGE, MESSAGE);
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * Add the second email into database.
     * </p>
     * 
     * @param userId
     *            the id of the user who request to add second email.
     * @param secondEmail
     *            the second email to add.
     */
    private void addSecondEmail(long userId, String secondEmailAddress) {
        User user = DAOUtil.getFactory().getUserDAO().find(userId);

        Email secondEmail = null;
        for (Email email : user.getEmailAddresses()) {
            if (email.getEmailTypeId().equals(Constants.SECOND_EMAIL_TYPE_ID)) {
                // alread has a second email.
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
        }

        secondEmail.setEmailTypeId(Constants.SECOND_EMAIL_TYPE_ID);
        secondEmail.setAddress(secondEmailAddress);
        secondEmail.setPrimary(false);
        secondEmail.setStatusId(Constants.ACTIVE_EMAIL_STATUS);
        secondEmail.setUser(user);
        secondEmail.setNew(true);
        user.addEmailAddress(secondEmail);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(user);
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
