/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PasswordResetToken;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.PasswordValidator;
import com.topcoder.web.tc.Constants;
import javax.naming.Context;
import java.util.Date;

/**
 * <p>
 * Reset the password.
 * </p>
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 * <p>
 * Update v1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0): The change is substantial and the
 * previous code is nearly totally removed.
 * </p>
 * @author vangavroche, TCSASSEMBLER
 * @version 1.1
 */
public class ResetPassword extends ShortHibernateProcessor {

    /**
     * <p>
     * The class name.
     * </p>
     */
    private final static String CLASS_NAME = ResetPassword.class.getName();

    /**
     * <p>
     * Reset the password. A token needed to ensure the user can reset the password. The token will be sent to
     * user's email.
     * </p>
     * 
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    protected void dbProcessing() throws Exception {

        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        String password = getRequest().getParameter(Constants.PASSWORD);

        if (password == null) {
            // first come into this controller.
            renderView(Constants.RESET_PASSWORD, null);
            this.getRequest().getSession().setAttribute(Constants.TOKEN_ABOUT_TO_SEND, true);
            log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
            return;
        } else {
            String token = StringUtils.checkNull(getRequest().getParameter(Constants.TOKEN));
            if (token.equals("")) {
                renderView(Constants.RESET_PASSWORD, "The code field can not be empty");
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }
            long userId;
            try {
                userId = Long.valueOf(StringUtils.checkNull(getRequest().getParameter(Constants.CODER_ID)));
            } catch (NumberFormatException e) {
                renderView(Constants.RESET_PASSWORD, "The userId has bad format");
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }

            String passwordConfirm = StringUtils.checkNull(getRequest().getParameter(Constants.PASSWORD_CONFIRM));

            if (!passwordConfirm.equals(password)) {
                renderView(Constants.RESET_PASSWORD, "The passwords do not match.");
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }
            PasswordResetToken passwordResetToken = DAOUtil.getFactory().getPasswordResetTokenDAO().find(userId);
            
            if (passwordResetToken == null) {
                log.debug("The passwordRestToken is null.");
            } else {
                log.debug(String.format("The input token is %s, and in DB the token is %s, will expired at %s",
                    token, passwordResetToken.getToken(), String.valueOf(passwordResetToken.getExpiredAt())));
            }

            if (!validateToken(passwordResetToken, token)) {
                renderView(Constants.RESET_PASSWORD, "The code is invalid.");
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }

            ValidationResult vr = new PasswordValidator().validate(new StringInput(password));
            if (!vr.isValid()) {
                renderView(Constants.RESET_PASSWORD, vr.getMessage());
                log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
                return;
            }
            updatePassword(userId, password);

            DAOUtil.getFactory().getPasswordResetTokenDAO().expireToken(userId, token);

            renderView(Constants.RESET_PASSWORD_CONFIRM, null);

            log.debug("Exit method " + CLASS_NAME + "#dbProcessing().");
        }
    }

    /**
     * <p>
     * Validate the token, which will be expired after a configured time.
     * </p>
     * 
     * @param passwordResetToken
     *            the password reset token object.
     * @param token
     *            the token that the user entered.
     * @return true if the token entered by the user matches the password reset token object.
     */
    private boolean validateToken(PasswordResetToken passwordResetToken, String token) {
        return passwordResetToken != null && passwordResetToken.getExpiredAt().after(new Date())
            && passwordResetToken.getToken().equals(token);
    }

    /**
     * <p>
     * Save the new password in user and security.
     * </p>
     * 
     * @param userId
     *            the id of the user who is changing his password.
     * @param password
     *            the password to change.
     * @throws Exception
     *             the exception handled by ShortHibernateProcessor.
     */
    private void updatePassword(long userId, String password) throws Exception {

        Context ctx =
            TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

        User u = DAOUtil.getFactory().getUserDAO().find(userId);

        TCSubject tcs = new TCSubject(132456);
        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr = pmrh.create();
        UserPrincipal myPrincipal = new UserPrincipal("", u.getId());
        pmr.editPassword(myPrincipal, password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

        DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);
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
            // this.getRequest().getSession().setAttribute(Constants.TOKEN_ABOUT_TO_SEND, "false");
        }
        setNextPage(destination);
        setIsNextPageInContext(true);
    }

}
