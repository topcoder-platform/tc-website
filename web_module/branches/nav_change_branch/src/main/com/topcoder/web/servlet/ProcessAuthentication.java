package com.topcoder.web.servlet;

import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.bean.Registration;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.ArrayList;


public final class ProcessAuthentication {

    private static Logger log = Logger.getLogger(ProcessAuthentication.class);
    static final int ATTEMPT_LIMIT = 3;
    static final int INVALID = 0;
    static final int ALREADY_ACTIVE = 1;
    static final int VALID = 2;
    static Sector CODER_SITE_SECTOR = new Sector(1, "Coder Site", "S");

    /*********************************************************************************
     PACKAGE STATIC METHODS
     *********************************************************************************/

    static boolean authenticate(Authentication credentials, String handle,
                                String password) throws Exception {
        boolean result = false;
        credentials.setHandle(handle);
        credentials.setPassword(password);
        if (!credentials.getLockout()) {
            Context ctx = null;
            try {
                ctx = new InitialContext();
                AuthenticationServicesHome home =
                        (AuthenticationServicesHome) ctx.lookup(ApplicationServer.AUTHENTICATION_SERVICES);
                AuthenticationServices authServices = home.create();
                Authentication authentication = authServices.authenticate(handle, password);
                credentials.setUserId(authentication.getUserId().intValue());
                credentials.setStatus(authentication.getStatus());
                if (credentials.getUserId().intValue() == 0) {
                    credentials.setAttempts(credentials.getAttempts() + 1);
                    if (credentials.getAttempts() == ATTEMPT_LIMIT) credentials.setLockout(true);
                } else {
                    result = true;
                }
            } catch (Exception e) {
                e.printStackTrace();
                StringBuffer msg = new StringBuffer(150);
                msg.append("ProcessAuthentication:authenticate:handle=");
                msg.append(handle);
                msg.append(":password=");
                msg.append(password);
                msg.append(":ERROR:\n");
                msg.append(e.getMessage());
                throw new Exception(msg.toString());
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
        return result;
    }


    static Permission getSectorPermission(Sector sector, PermissionAssignee assignee) throws Exception {
        Permission result = new Permission();
        result.setSector(sector);
        result.setSId(assignee.getSId());
        try {
            ArrayList permissions = assignee.getPermissions();
            for (int i = 0; i < permissions.size(); i++) {
                Permission listPermission = (Permission) permissions.get(i);
                if (listPermission.getSector().getSectorId() == sector.getSectorId()) {
                    int listLevel = listPermission.getAccessLevel().getAccessLevelId();
                    int currentLevel = result.getAccessLevel().getAccessLevelId();
                    if (listLevel > currentLevel) {
                        result.setAccessLevel(listPermission.getAccessLevel());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return result;
    }


    static int validateActivationCode(String activationCode) throws Exception {
        int result = INVALID;
        Context ctx = null;
        try {
            int coderId = Registration.getCoderId(activationCode);
            ctx = new InitialContext();
            AuthenticationServicesHome authHome =
                    (AuthenticationServicesHome) ctx.lookup(ApplicationServer.AUTHENTICATION_SERVICES);
            AuthenticationServices authEJB = authHome.create();
            Authentication authentication = authEJB.getActivation(coderId);
            if (authentication.getUserId().intValue() == coderId) {
                log.debug("XXX activation code: " + activationCode);
                if (authentication.getActivationCode().equals(activationCode)) {
                    if (authentication.getStatus().equals("U")) {
                        UserServicesHome userServicesHome = (UserServicesHome) ctx.lookup(ApplicationServer.USER_SERVICES);
                        UserServices userEJB = (UserServices) userServicesHome.findByPrimaryKey(authentication.getUserId());
                        User user = userEJB.getUser();
                        user.setStatus("A");
                        user.setModified("U");
                        userEJB.setUser(user);
                        result = VALID;
                    } else {
                        result = ALREADY_ACTIVE;
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception
                    ("ProcessAuthentication:validateActivationCoderId:ERROR:\n" + e);
        } finally {
            try {
                if (ctx != null) ctx.close();
            } catch (Exception ignore) {
            }
        }
        return result;
    }


    static void sendPasswordMail(String firstName, String lastName, String email)
            throws Exception {
        Context ctx = null;
        try {
            ctx = new InitialContext();
            AuthenticationServicesHome authHome =
                    (AuthenticationServicesHome) ctx.lookup(ApplicationServer.AUTHENTICATION_SERVICES);
            AuthenticationServices authEJB = authHome.create();
            Authentication authentication = authEJB.getCredentials(firstName, lastName, email);
            if (!authentication.getHandle().equals("")) {
                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("TopCoder");
                StringBuffer msgText = new StringBuffer(1000);
                msgText.append("Your TopCoder login credetials are:\n\n");
                msgText.append("Handle:  ");
                msgText.append(authentication.getHandle());
                msgText.append("\nPassword:  ");
                msgText.append(authentication.getPassword());
                msgText.append("\n\nThank You for registering with TopCoder!\n");
                msgText.append("\n\nPlease do not reply to this e-mail.\n");
                mail.setBody(msgText.toString());
                mail.addToAddress(email, TCSEmailMessage.TO);
                mail.setFromAddress("service@topcoder.com");
                EmailEngine.send(mail);
            } else {
                throw new Exception
                        ("ProcessAuthentication:sendPasswordMail:ERROR:name and email address not found:\n");
            }
        } catch (Exception e) {
            throw new Exception
                    ("ProcessAuthentication:sendPasswordMail:ERROR:\n" + e);
        } finally {
            try {
                if (ctx != null) ctx.close();
            } catch (Exception ignore) {
            }
        }
    }


    static final boolean hasMinimumPermission(User user)
            throws Exception {
        boolean result = false;
        if (user == null) return result;
        javax.naming.Context ctx = null;
        try {
            ctx = new InitialContext();
            AuthenticationServicesHome asHome = (AuthenticationServicesHome) ctx.lookup(ApplicationServer.AUTHENTICATION_SERVICES);
            AuthenticationServices as = (AuthenticationServices) asHome.create();
            Permission permission = as.getSectorPermission(CODER_SITE_SECTOR, user);
            int level = permission.getAccessLevel().getAccessLevelId();
            if (level > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(
                    "ProcessAuthentication:hasMinimumPermission:ERROR" + e.getMessage()
            );
        }
        return result;
    }


}
