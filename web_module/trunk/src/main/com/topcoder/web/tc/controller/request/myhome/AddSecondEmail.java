/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;


import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.controller.request.authentication.Util;
import com.topcoder.web.common.model.ConfirmationEmailRequest;
import com.topcoder.web.common.model.EmailRequestType;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.security.User;

/**
 * <p>
 * Allow user to add a second email.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Email Address Management Update v1.0) Change notes:
 *   <ol>
 *     <li>Updated {@link dbProcessing} to use new entity and utility method to send the request.</li>
 *     <li>Removed <code>sendEmail</code> and <code>validateEmail</code> methods.</li>
 *   </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.2 (TopCoder Email Management Bug Race - BUGR-9479):
 * <ol>
 *      <li>Add {@link #dbProcessing()} method.</li>
 * </ol>
 * </p>
 * @author vangavroche, Standlove, TCSASSEMBLER
 * @version 1.2
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
        this.getRequest().getSession().setAttribute(Constants.SECOND_EMAIL_ADDRESS_ON_EDIT, email);

        String secondEmail = this.getRequest().getParameter(Constants.SECOND_EMAIL_ADDRESS);
        this.getRequest().getSession().setAttribute(Constants.SECOND_EMAIL_ADDRESS, secondEmail);
        
        log.debug("The email is " + email);
        if (email == null) {
            renderView(Constants.SECOND_EMAIL_PAGE, null);
        } else {
            validateEmail(email);
            if (!hasErrors()) {
                log.debug("The email address is valid.");
                ConfirmationEmailRequest request = new ConfirmationEmailRequest();
                request.setToEmail(email);
                User u = getUser();
                request.setUserId(u.getId());
                request.setSubject(Constants.SECOND_EMAIL_VERIFY_MAIL_SUBJECT);
                request.setBody(Constants.SECOND_EMAIL_VERIFY_MAIL_BODY);
                request.setHandle(u.getUserName());
                request.setFromEmail(Constants.SECOND_EMAIL_VERIFY_MAIL_FROM_ADDRESS);
                request.setRequestType(EmailRequestType.SecondaryEmailConfirmation);
                request.setExpirationDuration(Constants.SECOND_EMAIL_REQUEST_AGE);

                try {
                    Util.generateEmailConfirmation(request);
                } catch (Exception e) {
                    renderView(Constants.SECOND_EMAIL_PAGE, "Can not send the email.");
                    log.error("Error during sending email confirm.", e);
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
        boolean flag = Util.isEmailAlreadyUsed(email, getUser().getId());
        if (flag) {
            renderView(Constants.SECOND_EMAIL_PAGE,"The mail address is already used.");
            return;
        }
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
