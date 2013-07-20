/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import java.util.Date;
import java.util.List;

import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.SecondEmailRequestDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;

/**
 * <p>
 * Allow user to add a second email.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 * 
 * @author vangavroche, TCSASSEMBLER
 * @version 1.0
 */
public class AddSecondEmail extends ShortHibernateProcessor {

    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = AddSecondEmail.class.getName();

    /**
     * <p>
     * Allow user to add a second email.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        String email = this.getRequest().getParameter(Constants.EMAIL);

        String secondEmail = this.getRequest().getParameter(Constants.SECOND_EMAIL_ADDRESS);
        this.getRequest().getSession().setAttribute(Constants.SECOND_EMAIL_ADDRESS, secondEmail);
        
        log.debug("The email is " + email);
        if (email == null) {
            renderView(Constants.SECOND_EMAIL_PAGE, null);
        } else {
            validateEmail(email);
            if (!hasErrors()) {
                log.debug("The email address is valid.");
                int randomKey = (int) (Integer.MAX_VALUE * Math.random());
                Date expiredAt = getExpiredDate();
                long userId = this.getUser().getId();

                SecondEmailRequestDAO dao = DAOUtil.getFactory().getSecondEmailRequestDAO();
                dao.save(userId, email, randomKey, expiredAt);
                log.debug("The second email request DAO saved successfully.");

                try {
                    sendConfirmEmail(userId, randomKey, expiredAt, email);
                    log.debug("The confirm email is sent successfully.");
                } catch (Exception e) {
                    renderView(Constants.SECOND_EMAIL_PAGE, "Can not send the email.");
                    log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                    return;
                }

                this.getRequest().getSession().setAttribute("email", email);
                renderView(Constants.SECOND_EMAIL_PAGE_CONFIRM, null);
                log.debug("Redirect to the page that indicate the confirm email is already sent.");
            }
        }
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * Validate the email. The email should not be used by others.
     * </p>
     * 
     * @param email
     *            the email to validate.
     */
    private void validateEmail(String email) {
        ValidationResult vr = new EmailValidator().validate(new StringInput(email));
        if (!vr.isValid()) {
            renderView(Constants.SECOND_EMAIL_PAGE, vr.getMessage());
            return;
        }
        List<User> users = DAOUtil.getFactory().getUserDAO().findByPrimaryOrSecondEmail(email);
        if (!users.isEmpty()) {
            renderView(Constants.SECOND_EMAIL_PAGE, "The email is already used.");
            return;
        }
        SecondEmailRequestDAO dao = DAOUtil.getFactory().getSecondEmailRequestDAO();
        if (dao.isEmailOccupied(email, this.getUser().getId())) {
            renderView(Constants.SECOND_EMAIL_PAGE,
                "The mail address is already used by some active request currently.");
            return;
        }
    }

    /**
     * <p>
     * Get expired date.
     * </p>
     * 
     * @return the expired date.
     */
    private Date getExpiredDate() {
        long currentTime = new Date().getTime();
        return new Date(Constants.SECOND_EMAIL_REQUEST_AGE * 1000 + currentTime);
    }

    /**
     * <p>
     * Send a confirm email to user about the new added second email.
     * </p>
     * 
     * @param userId
     *            the user id.
     * @param key
     *            the random key.
     * @param expiredAt
     *            the expire date.
     * @param email
     *            the second email.
     * @throws Exception
     *             if the confirm email can not be sent.
     */
    private void sendConfirmEmail(long userId, int key, Date expiredAt, String email) throws Exception {

        // send the email
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(Constants.SECOND_EMAIL_VERIFY_MAIL_SUBJECT);

        String mailBody =
            Constants.SECOND_EMAIL_VERIFY_MAIL_BODY.replace("{userId}", String.valueOf(userId))
                .replace("{key}", String.valueOf(key)).replace("{expiredAt}", String.valueOf(expiredAt.getTime()));

        mail.setBody(mailBody);

        mail.setToAddress(email, TCSEmailMessage.TO);
        mail.setFromAddress(Constants.SECOND_EMAIL_VERIFY_MAIL_FROM_ADDRESS);
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
