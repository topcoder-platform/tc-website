package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.shared.util.*;
import com.topcoder.security.UserPrincipal;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.common.web.data.CoderRegistration;
import com.topcoder.common.web.data.State;
import com.topcoder.common.web.data.Country;

import javax.transaction.UserTransaction;
import javax.transaction.Status;

public class GoogleRegSubmit extends FullRegSubmit {


    //todo wack this crap when we have fixed the regular site to not use the transactional db for contact info
    //don't need to reimplement commit here at that point
    protected UserPrincipal commit(SimpleRegInfo regInfo) throws TCWebException {

        UserPrincipal newUser = super.commit(regInfo);
        try {

            if (((Coder) createEJB(getInitialContext(), Coder.class)).exists(newUser.getId(), DBMS.OLTP_DATASOURCE_NAME)) {
                UserTransaction uTx = null;
                try {
                    UserServicesHome userHome = (UserServicesHome) getInitialContext().lookup(ApplicationServer.USER_SERVICES);
                    UserServices userEJB = userHome.findByPrimaryKey(new Integer((int) newUser.getId()));
                    com.topcoder.common.web.data.User u = userEJB.getUser();

                    u.setPassword(regInfo.getPassword());
                    CoderRegistration c = (CoderRegistration) u.getUserTypeDetails().get("Coder");
                    c.setFirstName(regInfo.getFirstName());
                    c.setLastName(regInfo.getLastName());
                    c.setMiddleName(regInfo.getMiddleName());
                    u.setEmail(regInfo.getEmail());
                    c.setHomeAddress1(regInfo.getAddress1());
                    c.setHomeAddress2(regInfo.getAddress2());
                    c.setHomeCity(regInfo.getCity());
                    State s = new State();
                    s.setStateCode(regInfo.getStateCode());
                    c.setHomeState(s);
                    c.setHomeZip(regInfo.getZip());
                    Country co = new Country();
                    co.setCountryCode(regInfo.getCountryCode());
                    c.setHomeCountry(co);
                    c.setModified("U");

                    u.getUserTypeDetails().put("Coder", c);

                    u.setModified("U");

                    uTx = Transaction.get();
                    uTx.begin();
                    userEJB.setUser(u);
                    uTx.commit();
                } catch (Exception e) {
                    try {
                        if (uTx != null && uTx.getStatus() == Status.STATUS_ACTIVE) {
                            uTx.rollback();
                        }
                    } catch (Exception te) {
                        throw new TCWebException(e);
                    }
                    throw new TCWebException(e);
                }
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        return newUser;
    }

    protected void setNextPage() {
        if (isEligible((FullRegInfo)regInfo)) {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE_REG_PAGE);
                setIsNextPageInContext(true);
            } else {
                SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                StringBuffer buf = new StringBuffer(150);
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append(info.getServletPath());
                buf.append("?");
                buf.append(Constants.MODULE_KEY);
                buf.append("=");
                buf.append(Constants.STATIC);
                buf.append(Constants.GOOGLE_REG_SUCCESS_PAGE);
                setNextPage(buf.toString());
                setIsNextPageInContext(false);
            }
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
    }

    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {
        try {
            //todo if we ever allow them to update their account
            //todo we'll need to figure out a way to not send
            //todo them this email. but send it to people
            //todo that are converting tc accounts
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(newUser.getId(), db);

            TCSEmailMessage mail = new TCSEmailMessage();
            if (info.isNew()) {
                mail.setSubject("IMPORTANT - Google Code Jam 2003 Activation Email");
            } else {
                mail.setSubject("Google Code Jam 2003 Information");

            }

            buf.append("You're invited to take part in the Google Code Jam 2003, a programming competition that will be worthy of your time, your skills and your interest.\n\n");
            if (info.isNew()) {
                buf.append("GOOGLE CODE JAM 2003 ACTIVATION INFORMATION\n\n");
                buf.append("Your Google activation code is ");
                buf.append(code);
                buf.append("\n\n");
                buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");
                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
            }
            buf.append("Your handle and password will provide you with access to the Google Competition Arena, where you can practice and chat, and where you'll compete in the Google Code Jam 2003.\n\n");
            buf.append("PRACTICING FOR THE EVENT\n");
            buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Google Code Jam 2003.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 8:00AM EDT on October 1, 2003 through 5:00PM EDT on November 14, 2003.\n\n");
            buf.append("You can access the practice rooms by navigating to http://www.topcoder.com/googlecodejam and clicking on the Practice Arena tab.\n\n");
            buf.append("COMPETING IN THE QUALIFICATION ROUND\n");
            buf.append("You may participate in the qualification round at any time between Friday, October 17 at 8:00 AM EDT and Monday, October 20 at 8:00 AM EDT (GMT -4).  You will have up to one hour to solve two problems.  It is recommended that you utilize the practice area prior to participating in the qualification.\n\n");
            buf.append("LAUNCHING THE ARENA\n");
            buf.append("You can launch and login to the competition arena at the appropriate time by navigating to http://www.topcoder.com/googlecodejam and clicking on the Compete Now tab.\n\n");
            buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
            buf.append("Mac OS X  users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
            buf.append("We also suggest that you read up on the competition process by navigating to http://www.topcoder.com/googlecodejam and downloading the competition manual.\n\n");
            buf.append("If you have any questions about how to participate, please email them to service@topcoder.com\n\n");
            buf.append("Thank you for registering for the Google Code Jam 2003.  We look forward to seeing you in the Arena!\n\n");

            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            log.info("sent registration email to " + info.getEmail());
            EmailEngine.send(mail);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private String getUrl(String code) {
        StringBuffer buf = new StringBuffer(200);
        buf.append("http://");
        buf.append(ApplicationServer.SERVER_NAME);
        SessionInfo sInfo = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        buf.append(sInfo.getServletPath());
        buf.append("?");
        buf.append(Constants.MODULE_KEY);
        buf.append("=");
        buf.append(Constants.GOOGLE_ACTIVATION);
        buf.append("&");
        buf.append(Activate.ACTIVATION_CODE);
        buf.append("=");
        buf.append(code);
        buf.append("&");
        buf.append(Constants.COMPANY_ID);
        buf.append("=");
        buf.append(regInfo.getCompanyId());
        return buf.toString();
    }
}
