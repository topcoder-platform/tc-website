package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.AuthenticationServices.Authentication;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.docGen.xml.*;
import com.topcoder.shared.util.*;
import com.topcoder.web.reg.bean.Registration;

import javax.naming.Context;
import javax.servlet.http.*;
import java.util.HashMap;


public final class TaskAuthentication {


    private static final String XSL_DIR = TCServlet.XSL_ROOT + "authentication/";
    private static final String LOGIN_PAGE = XSL_DIR + "login.xsl";
    private static final String ACCOUNT_LOCKOUT_PAGE = XSL_DIR + "lockout.xsl";
    private static final String RECOVER_PASSWORD_PAGE = XSL_DIR + "recover_password.xsl";
    private static final String INVALID_LOGIN_PAGE = XSL_DIR + "invalid_login.xsl";
    private static final String UNACTIVATED_ACCOUNT_PAGE = XSL_DIR + "unactivated_account.xsl";
    private static final String MAIL_SENT_PAGE = XSL_DIR + "mail_sent.xsl";
    private static final String MAIL_ERROR_PAGE = XSL_DIR + "mail_error.xsl";
    private static final String ACTIVATED_PAGE = XSL_DIR + "activated.xsl";
    private static final String NOT_ACTIVATED_PAGE = XSL_DIR + "not_activated.xsl";
    private static final String ALREADY_ACTIVE_PAGE = XSL_DIR + "already_active.xsl";

    static String process(HttpServletRequest request, HttpServletResponse response,
                          HTMLRenderer HTMLmaker, Navigation nav, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            String activationCode = Conversion.checkNull(request.getParameter(Registration.CODE));
            if (!activationCode.equals("")) {
                try {
                    switch (ProcessAuthentication.validateActivationCode(activationCode)) {
                        case ProcessAuthentication.INVALID:
                            result = HTMLmaker.render(document, NOT_ACTIVATED_PAGE);
                            break;
                        case ProcessAuthentication.ALREADY_ACTIVE:
                            result = HTMLmaker.render(document, ALREADY_ACTIVE_PAGE);
                            break;
                        case ProcessAuthentication.VALID:
                            result = HTMLmaker.render(document, ACTIVATED_PAGE);
                    }
                    return result;
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new NavigationException(
                            "FAILED TO ACTIVATE ACCOUNT", NOT_ACTIVATED_PAGE
                    );
                }
            } else {
                HashMap sessionObjects = nav.getSessionObjects();
                //********************** get/set registration object ************************
                Authentication login = null;
                if (!sessionObjects.containsKey("login")) {
                    login = new Authentication();
                    sessionObjects.put("login", login);
                } else {
                    login = (Authentication) sessionObjects.get("login");
                }
                String command = Conversion.checkNull(request.getParameter("c"));
                if (command.equals("login")) {
                    result = displayLogin(request, HTMLmaker, document);
                } else if (command.equals("manual_activate")) {
                    result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
                } else if (command.equals("recover_password")) {
                    result = TaskStatic.displayStatic(HTMLmaker, request, nav, document);
                } else if (command.equals("submit_login")) {
                    result = submitLogin(request, login, nav, document);
                } else if (command.equals("mail_activation")) {
                    result = sendMail(HTMLmaker, request, login, document);
                } else if (command.equals("send_password")) {
                    result = sendPassword(HTMLmaker, request, login, document);
                } else if (command.equals("submit_logout")) {
                    result = submitLogout(request);
                } else {
                    throw new NavigationException("TaskAuthentication:INVALID COMMAND:" + command, TCServlet.NAVIGATION_ERROR_PAGE);
                }
            }
        } catch (NavigationException ne) {
            throw ne;
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("TaskAuthentication:process:");
            msg.append(":ERROR:\n");
            msg.append(e);
            throw new NavigationException(msg.toString(), TCServlet.INTERNAL_ERROR_PAGE);
        }
        return result;
    }


    private static String displayLogin(HttpServletRequest request, HTMLRenderer HTMLmaker, XMLDocument document)
            throws NavigationException {
        String result = null;
        try {
            document.addTag(new ValueTag("ErrorURL", Conversion.checkNull(request.getParameter("errorURL"))));
            document.addTag(new ValueTag("ErrorMsg", Conversion.checkNull(request.getParameter("errorMsg"))));
            String xsldocURLString = LOGIN_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (Exception e) {
            throw new NavigationException("TaskAuthentication:displayLogin:ERROR:\n" + e,
                    TCServlet.NAVIGATION_ERROR_PAGE);
        }
        return result;
    }


    private static String submitLogin(HttpServletRequest request,
                                      Authentication login, Navigation nav, XMLDocument document)
            throws Exception, NavigationException {
        String result = null;
        String loginURL = null;
        try {
            if (login.getLockout()) {
                throw new NavigationException("ACCOUNT LOCKOUT", ACCOUNT_LOCKOUT_PAGE);
            }
            loginURL = Conversion.checkNull(request.getParameter("errorURL"));
            String handle = Conversion.checkNull(request.getParameter("Handle"));
            String password = Conversion.checkNull(request.getParameter("Password"));
            boolean authenticated = ProcessAuthentication.authenticate(login, handle, password);
            if (authenticated) {
                if (
                        login.getStatus().equals("I")    // inactive
                        || login.getStatus().equals("0") // inactive
                        || login.getStatus().equals("9") // never activated and disabled
                        || login.getStatus().equals("6") // confirmed cheater removed
                        || login.getStatus().equals("5") // duplicate account
                        || login.getStatus().equals("4") // requested to be removed
                ) {
                    throw new NavigationException(
                            "INVALID LOGIN: INACTIVE ACCOUNT:\n"
                            , INVALID_LOGIN_PAGE
                            , loginURL
                    );
                }

                User user = null;
                Context ctx = null;
                try {
                    ctx = TCContext.getInitial();
                    UserServicesHome userServicesHome = (UserServicesHome) ctx.lookup(ApplicationServer.USER_SERVICES);
                    UserServices userServicesEJB = (UserServices) userServicesHome.findByPrimaryKey(login.getUserId());
                    user = userServicesEJB.getUser();
                    if (!ProcessAuthentication.hasMinimumPermission(user)) {
                        throw new NavigationException(
                                "INVALID LOGIN: INACTIVE ACCOUNT:\n"
                                , INVALID_LOGIN_PAGE
                                , loginURL
                        );
                    }
                    user.setLoggedIn("Y");
                    user.setModified("U");
                    userServicesEJB.setUser(user);
                } catch (NavigationException ne) {
                    throw ne;
                } catch (Exception e) {
                    throw new NavigationException(
                            "TaskAuthentication:submitLogin:ERROR:\n" + e
                            , TCServlet.INTERNAL_ERROR_PAGE
                            , loginURL
                    );
                } finally {
                    if (ctx != null) {
                        try {
                            ctx.close();
                        } catch (Exception ignore) {
                        }
                    }
                }


                if (
                        login.getStatus().equals("U")    // unactive
                        || login.getStatus().equals("2") // unactive
                ) {
                    login.setEmail(user.getEmail());
                    HashMap userTypeDetails = user.getUserTypeDetails();
                    CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                    login.setActivationCode(reg.getActivationCode());
                    throw new NavigationException(
                            "INVALID LOGIN: UNACTIVATED ACCOUNT:\n"
                            , UNACTIVATED_ACCOUNT_PAGE
                            , loginURL
                    );
                }

                try {
                    nav.setUserId(login.getUserId().intValue());
                    nav.setUser(user);
                    nav.setLoggedIn(true);
                    document.addTag(new ValueTag("LoggedIn", "true"));
                    //RecordTag authTag = new RecordTag("STATIC");
                    //authTag.addTag( user.getXML() );
                    //document.addTag( authTag );

                    HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                    CoderRegistration reg = (CoderRegistration) userTypeDetails.get("Coder");
                    if ((reg == null) || (reg.getDemographicResponses().size() < 4)) {
                        document.addTag(new ValueTag("NeedDemographics", "true"));
                    }

                    if (loginURL.equals("")) {
                        result = "home";
                    } else {
                        result = "login~" + loginURL;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new NavigationException(
                            "TaskAuthentication:submitLogin:ERROR:setting session:\n" + e
                            , TCServlet.INTERNAL_ERROR_PAGE
                            , loginURL
                    );
                }
            } else {
                throw new NavigationException(
                        "INVALID LOGIN"
                        , INVALID_LOGIN_PAGE
                        , loginURL
                );
            }
        } catch (NavigationException ne) {
            RecordTag errTag = new RecordTag("ERROR");
            errTag.addTag(new ValueTag("handle", login.getHandle()));
            errTag.addTag(new ValueTag("password", login.getPassword()));
            document.addTag(errTag);
            throw ne;
        } catch (Exception e) {
            throw new Exception("TaskAuthentication:submitLogin:ERROR:\n" + e);
        }
        return result;
    }


    private static String sendPassword(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                       Authentication login, XMLDocument document)
            throws Exception, NavigationException {
        String result = null;
        try {
            String firstName = Conversion.checkNull(request.getParameter("FirstName"));
            String lastName = Conversion.checkNull(request.getParameter("LastName"));
            String email = Conversion.checkNull(request.getParameter("Email"));
            try {
                ProcessAuthentication.sendPasswordMail(firstName, lastName, email);
            } catch (Exception e) {
                RecordTag errTag = new RecordTag("RECOVER_PASSWORD_ERROR");
                ValueTag notFoundTag = new ValueTag("UserNotFound", true);
                ValueTag firstNameTag = new ValueTag("FirstName", firstName);
                ValueTag lastNameTag = new ValueTag("LastName", lastName);
                ValueTag emailTag = new ValueTag("Email", email);
                errTag.addTag(notFoundTag);
                errTag.addTag(firstNameTag);
                errTag.addTag(lastNameTag);
                errTag.addTag(emailTag);
                document.addTag(errTag);
                throw new NavigationException(e.getMessage(),
                        RECOVER_PASSWORD_PAGE);
            }
            String xsldocURLString = MAIL_SENT_PAGE;
            result = HTMLmaker.render(document, xsldocURLString);
        } catch (NavigationException ne) {
            RecordTag errTag = new RecordTag("ERROR");
            errTag.addTag(new ValueTag("handle", login.getHandle()));
            errTag.addTag(new ValueTag("password", login.getPassword()));
            document.addTag(errTag);
            throw ne;
        } catch (Exception e) {
            throw new Exception("TaskAuthentication:submitLogin:ERROR:\n" + e);
        }
        return result;
    }


    private static String submitLogout(HttpServletRequest request) throws Exception {
        String result = null;
        try {
            HttpSession session = request.getSession(true);
            session.removeAttribute("navigation");
            session.invalidate();
            result = "logout";
        } catch (Exception e) {
            throw new Exception("TaskAuthentication:submitLogout:ERROR:\n" + e);
        }
        return result;
    }


    private static String sendMail(HTMLRenderer HTMLmaker, HttpServletRequest request,
                                   Authentication login, XMLDocument document) throws NavigationException {
        String result = null;
        try {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("TopCoder Activation");
            StringBuffer msgText = new StringBuffer(1000);
            msgText.append("Your TopCoder activation code is ");
            msgText.append(login.getActivationCode());
            msgText.append("\n\n");
            msgText.append("To activate your account:\n\n");
            msgText.append("1) Navigate to the following WWW URL:\n");
            msgText.append(Registration.ACTIVATION_URL);
            msgText.append(login.getActivationCode());
            msgText.append("\n");
            msgText.append("If you can not click on the web address above, please copy the address ");
            msgText.append("into your web browser to continue.  If the address spans two lines, ");
            msgText.append("please make sure you copy and paste both sections without any spaces between ");
            msgText.append("them.\n\n");
            msgText.append("2) Login to TopCoder with your handle and password.\n");
            msgText.append("\n\nThank You for registering with TopCoder!\n");
            msgText.append("\n\nThis is an automated message.  ");
            msgText.append("Please do not reply to this email.");
            mail.setBody(msgText.toString());
            mail.addToAddress(login.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);

            result = HTMLmaker.render(document, MAIL_SENT_PAGE);
        } catch (Exception e) {
            throw new NavigationException("TaskAuthentication:sendMail:ERROR:\n" + e,
                    MAIL_ERROR_PAGE);
        }
        return result;
    }


}
