/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.Date;

import javax.naming.Context;

import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Resets the password.
 * </p>
 *
 * @author live_world
 * @version 1.0
 */
public class ResetPasswordAction extends BaseAction implements PostAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -8925428479258327457L;

    /**
     * Represents the error message for invalid reset password request.
     */
    private static final String INVALID_RESET_PASSWORD_REQUEST = "Invalid reset password request";

    /**
     * Represents 'pr' field.
     */
    private String pr;

    /**
     * Represents 'hc' field.
     */
    private String hc;

    /**
     * Represents the new password.
     */
    private String password;
    /**
     * Represents the new 'confirm password'.
     */
    private String passwordConfirm;

    /**
     * Resets the password.
     *
     * @return a <code>String</code> referencing the next view or action to route request to
     * @throws Exception if an unexpected error occurs while processing the request
     */
    @Override
    public String execute() throws Exception {
        if (RegHelper.isEmptyString(hc) || RegHelper.isEmptyString(pr)) {
            addActionError(INVALID_RESET_PASSWORD_REQUEST);
            return ERROR;
        }
        PasswordRecovery passwordRecovery = DAOUtil.getFactory().getPasswordRecoveryDAO().find(new Long(pr));
        if (passwordRecovery == null || !hc.equals(passwordRecovery.hash())) {
            addActionError(INVALID_RESET_PASSWORD_REQUEST);
            return ERROR;
        }
        if (passwordRecovery.getExpireDate().before(new Date())) {
            addActionError("time expired for password reset");
        }
        if (passwordRecovery.isUsed()) {
            addActionError("password is already changed.");
        }
        passwordRecovery.setUsed(true);
        DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(passwordRecovery);

        // save the new password in user and security.
        Context ctx =
            TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);

        User user = passwordRecovery.getUser();
        user.setPassword(password);

        // update the LDAP
        TCSubject tcs = new TCSubject(132456);
        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote pmr = pmrh.create();
        UserPrincipal myPrincipal = new UserPrincipal("", user.getId());
        pmr.editPassword(myPrincipal, user.getPassword(), tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
        getUserDAO().saveOrUpdate(user);
        return SUCCESS;
    }

    /**
     * The getter for the pr instance variable.
     *
     * @return the pr
     */
    public String getPr() {
        return pr;
    }

    /**
     * The setter for the pr instance variable.
     *
     * @param pr the pr to set
     */
    public void setPr(String pr) {
        this.pr = pr;
    }

    /**
     * The getter for the hc instance variable.
     *
     * @return the hc
     */
    public String getHc() {
        return hc;
    }

    /**
     * The setter for the hc instance variable.
     *
     * @param hc the hc to set
     */
    public void setHc(String hc) {
        this.hc = hc;
    }

    /**
     * The getter for the password instance variable.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * The setter for the password instance variable.
     *
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * The getter for the passwordConfirm instance variable.
     *
     * @return the passwordConfirm
     */
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    /**
     * The setter for the passwordConfirm instance variable.
     *
     * @param passwordConfirm the passwordConfirm to set
     */
    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }
}
