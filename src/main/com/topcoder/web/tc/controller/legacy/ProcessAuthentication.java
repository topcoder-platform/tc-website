package com.topcoder.web.tc.controller.legacy;

import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.reg.bean.Registration;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.common.web.data.Sector;
import com.topcoder.common.web.data.User;
import com.topcoder.common.web.data.Authentication;

import javax.naming.Context;
import javax.naming.InitialContext;


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
            InitialContext ctx = null;
            try {
                ctx = new InitialContext();
                AuthenticationServices authServices = (AuthenticationServices)BaseProcessor.createEJB(ctx, AuthenticationServices.class);
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

    static int validateActivationCode(String activationCode) throws Exception {
        int result = INVALID;
        InitialContext ctx = null;
        try {
            int coderId = Registration.getCoderId(activationCode);
            ctx = new InitialContext();
            AuthenticationServices authEJB = (AuthenticationServices)BaseProcessor.createEJB(ctx, AuthenticationServices.class);
            Authentication authentication = authEJB.getActivation(coderId);
            if (authentication.getUserId().intValue() == coderId) {
                log.debug("XXX activation code: " + activationCode);
                if (authentication.getActivationCode().equals(activationCode)) {
                    if (authentication.getStatus().equals("U")) {
                        UserServicesHome userServicesHome = (UserServicesHome) ctx.lookup(ApplicationServer.USER_SERVICES);
                        UserServices userEJB = userServicesHome.findByPrimaryKey(authentication.getUserId());
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
        InitialContext ctx = null;
        try {
            ctx = new InitialContext();
            AuthenticationServices authEJB = (AuthenticationServices)BaseProcessor.createEJB(ctx, AuthenticationServices.class);
            Authentication authentication = authEJB.getCredentials(firstName, lastName, email);
            if (!authentication.getHandle().equals("")) {
                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("TopCoder");
                StringBuffer msgText = new StringBuffer(1000);
                msgText.append("Your TopCoder login credentials are:\n\n");
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


}
