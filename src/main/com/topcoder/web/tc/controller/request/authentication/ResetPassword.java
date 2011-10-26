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
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.PasswordValidator;
import com.topcoder.web.tc.Constants;

import javax.naming.Context;
import java.util.Date;
import java.util.Set;


/**
 * If password is not passed, it just redirects to the reset password page.
 * If it is passed, it changes the password for a user.
 * It receives the id for a row in password_recovery table, as well as it hash code, and if this is
 * ok and the new password is valid, then is changed.
 *
 * @author Cucu
 */
public class ResetPassword extends ShortHibernateProcessor {

    public static final String PASSWORD_RECOVERY_ID = "pr";
    public static final String HASH_CODE = "hc";
    public static final String PASSWORD = "pwd";
    public static final String PASSWORD_VERIF = "pwdv";
    public static final String PASSWORD_EXPIRED = "pwexp";


    protected void dbProcessing() throws TCWebException {
        try {
            String passwordRecoveryId = getRequest().getParameter(PASSWORD_RECOVERY_ID);
            String rowHashCode = getRequest().getParameter(HASH_CODE);
            String password = getRequest().getParameter(PASSWORD);
            String passwordVerif = getRequest().getParameter(PASSWORD_VERIF);

            getRequest().setAttribute(PASSWORD_RECOVERY_ID, StringUtils.htmlEncode(passwordRecoveryId));
            getRequest().setAttribute(HASH_CODE, StringUtils.htmlEncode(rowHashCode));

            PasswordRecovery passwordRecovery = DAOUtil.getFactory().getPasswordRecoveryDAO().find(new Long(passwordRecoveryId));

            if (passwordRecovery == null) {
                throw new TCWebException("Row not found in password_recovery: " + passwordRecoveryId);
            }

            if (!rowHashCode.equals(passwordRecovery.hash())) {
                throw new TCWebException("Invalid hashcode.");
            }


            if (passwordRecovery.getExpireDate().before(new Date())) {
                addError("error", "The time for changing the password has expired. Please require password change again.");
                getRequest().setAttribute(PASSWORD_EXPIRED, "true");

                setNextPage(Constants.RESET_PASSWORD);
                setIsNextPageInContext(true);
                return;
            }


            if (password == null) {
                setNextPage(Constants.RESET_PASSWORD);
                setIsNextPageInContext(true);
                return;
            }


            if (passwordRecovery.isUsed()) {
                addError("error", "The password was already changed.");
            }

            if (!password.equals(passwordVerif)) {
                addError("error", "Password does not match verification.");
            }

            ValidationResult vr = new PasswordValidator().validate(new StringInput(password));
            if (!vr.isValid()) {
                addError("error", vr.getMessage());
            }

            if (hasErrors()) {
                setNextPage(Constants.RESET_PASSWORD);
                setIsNextPageInContext(true);
                return;
            }


            passwordRecovery.setUsed(true);
            DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(passwordRecovery);

            // save the new password in user and security.
            Context ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

            User u = passwordRecovery.getUser();

            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            UserPrincipal myPrincipal = new UserPrincipal("", u.getId());
            pmr.editPassword(myPrincipal, password, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            // if the user has changed email address, set it as his new primary address
            if (!u.getPrimaryEmailAddress().equals(passwordRecovery.getRecoveryAddress())) {
                Set<Email> s = u.getEmailAddresses();
                for (Email e : s) {
                    if (e.isPrimary()) {
                        e.setAddress(passwordRecovery.getRecoveryAddress());
                        break;
                    }
                }
                u.setEmailAddresses(s);
                getRequest().setAttribute(Constants.EMAIL, passwordRecovery.getRecoveryAddress());
            }


            DAOUtil.getFactory().getUserDAO().saveOrUpdate(u);

            setNextPage(Constants.RESET_PASSWORD_CONFIRM);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException("Couldn't change the password", e);
        }
    }


}
