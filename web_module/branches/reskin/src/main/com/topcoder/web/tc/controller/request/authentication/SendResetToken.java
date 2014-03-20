/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import java.io.PrintWriter;
import java.util.Date;

import com.topcoder.common.web.util.DateTime;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.authentication.strategies.TokenGenerator;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.PasswordResetTokenDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.PasswordResetToken;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;

/**
 * <p>
 * Generator a token and sent it back to the user who request it.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 * Changes in version 1.1 (TopCoder Password Recovery Update - BUGR-9487):
 * <ol>
 *      <li>Update {@link #dbProcessing()} method to remove resend logic.</li>
 *      <li>Update {@link #generateToken()} method.</li>
 * </ol>
 * </p>
 *
 * <p>
 * Changes in version 1.2 (TopCoder Password Recovery Update - BUGR-9487):
 * <ol>
 *      <li>Update {@link #generateToken()} method to add token validation check.</li>
 *      <li>Update {@link #dbProcessing()} method to remove token resent logic}
 *      <li>Update {@link #sendTokenEmail(String, String, String, String)} method to update email subject,body etc.</li>
 * </ol>
 * </p>
 * @author vangavroche, TCSASSEMBLER
 * @version 1.2
 */
public class SendResetToken extends ShortHibernateProcessor {
    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = SendResetToken.class.getName();
    /**
     * <p>
     * Validate the user who request a token and generator a token and sent it back to the user.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    @Override
    protected void dbProcessing() throws Exception {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");
        generateToken();
        log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * <p>
     * generator a token and sent it back to the user.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    private void generateToken() throws Exception {
        long userId = 0;
        try {
            userId = Long.valueOf(StringUtils.checkNull(getRequest().getParameter(Constants.CODER_ID)));
        } catch (NumberFormatException e) {
            writeResponse(400, "Invalid param user id");
            return;
        }

        /*
         * If there is token exists for this email, and it has not expired,
         * we ignore this request and respond with an error page telling user
         * that he has already requested the token and ask him/her to contact support.
         */
        PasswordResetTokenDAO resetTokenDAO = DAOUtil.getFactory().getPasswordResetTokenDAO();
        PasswordResetToken resetToken = resetTokenDAO.find(userId);
        if (resetToken != null && resetToken.getExpiredAt().after(new Date())) {
            writeResponse(500, "You have already request the reset token, please find it in your email inbox."
                + " If it's not there. Please contact support@topcoder.com.");
            return;
        }
        
        String type = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL_TYPE));
        if (!Constants.PRIMARY_EMAIL_TYPE.equals(type) && !Constants.SECOND_EMAIL_TYPE.equals(type)) {
            writeResponse(400, "Invalid email type. The valid one should be primary or second.");
            return;
        }

        TokenGenerator generator = null;
        try {
            generator = loadGenerator(Constants.RESET_TOKEN_GENERATOR_CLASS);
        } catch (Exception e) {
            writeResponse(500, "Failed to instantiate the class " + Constants.RESET_TOKEN_GENERATOR_CLASS);
            return;
        }

        User user = DAOUtil.getFactory().getUserDAO().find(userId);

        String selectedEmail = null;
        /**
         * user may both have primary or seondary email address
         * and he/she can select one of them to reset password
         * so we need to get the email address from user selected.
         */
        for (Email email : user.getEmailAddresses()) {
            if (type.equals(Constants.PRIMARY_EMAIL_TYPE) && email.getEmailTypeId() == Constants.PRIMARY_EMAIL_TYPE_ID) {
                selectedEmail = email.getAddress();
                break;
            } else if (type.equals(Constants.SECOND_EMAIL_TYPE) && email.getEmailTypeId() == Constants.SECOND_EMAIL_TYPE_ID) {
                selectedEmail = email.getAddress();
                break;
            }
        }
        
        String token = generator.generate();
        Date expiredAt = getExpireDate();
        log.debug(String.format("The token to be saved is %s, it will expired at %s", token, String.valueOf(expiredAt)));
        resetTokenDAO.saveToken(userId, token, expiredAt);
        try {
            sendTokenEmail(token, selectedEmail, user.getHandle(), DateTime.formatESTDate(expiredAt));
        } catch (Exception e) {
            writeResponse(500, "Failed to send email to " + selectedEmail);
            return;
        }

        writeResponse(200, null);
    }

    /**
     * <p>
     * Send a email to the user to notify the token generated.
     * </p>
     * 
     * @param token
     *            the token.
     * @param selectedEmail
     *            the user email.
     * @param handle
     *            the user handle.
     * @param expireDate
     *            the expire date.
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    private void sendTokenEmail(String token, String selectedEmail, String handle, String expireDate) throws Exception {
        ValidationResult vr = new EmailValidator().validate(new StringInput(selectedEmail));

        if (!vr.isValid()) {
            addError(Constants.ERROR_INFO, vr.getMessage());
        }
        // send the email
        TCSEmailMessage mail = new TCSEmailMessage();
        mail.setSubject(Constants.RESET_TOKEN_NOTIFY_MAIL_SUBJECT);
        mail.setBody(Constants.RESET_TOKEN_NOTIFY_MAIL_BODY.replace("{token}", token).replace("{handle}", handle)
                .replace("{expiry}", expireDate));

        mail.setToAddress(selectedEmail, TCSEmailMessage.TO);
        mail.setFromAddress(Constants.RESET_TOKEN_NOTIFY_MAIL_FROM_ADDRESS, Constants.RESET_TOKEN_NOTIFY_MAIL_FROM_PERSONAL);
        EmailEngine.send(mail);

    }

    /**
     * <p>
     * Get the expired date.
     * </p>
     * 
     * @return the expired date.
     */
    private Date getExpireDate() {
        long currentTime = new Date().getTime();
        return new Date(currentTime + Constants.RESET_TOKEN_AGE * 1000);
    }

    /**
     * <p>
     * Instantiate a generator by reflection.
     * </p>
     * 
     * @param className
     *            the class name.
     * @return the generator.
     * @throws Exception
     *             If failed to instantiate by reflection.
     */
    private TokenGenerator loadGenerator(String className) throws Exception {
        Class<?> clazz = Class.forName(className);
        return (TokenGenerator) clazz.newInstance();
    }

    /**
     * <p>
     * Populate the response
     * </p>
     * 
     * @param status
     *            the response status.
     * @param message
     *            the response message if an error occurs.
     * @throws Exception
     *             If unable to write into response.
     */
    private void writeResponse(int status, String message) throws Exception {
        TCResponse response = getResponse();
        response.setContentType("application/json");
        response.setStatus(status);
        PrintWriter responseWriter = response.getWriter();
        String jsonString;
        if (status == 200) {
            jsonString = "{\"successful\" : true}";
        } else {
            jsonString = String.format("{\"error\" : \"%s\"}", message);
        }
        responseWriter.write(jsonString);
        //To commit the HttpServletResponse.
        response.flushBuffer();
    }

}
