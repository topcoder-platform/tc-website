package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.Activate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.*;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Submit extends FullRegSubmit {


    protected void setNextPage() {
        if (isEligible((FullRegInfo)regInfo)) {
            if (hasErrors()) {
                setNextPage(Constants.DC_REG_PAGE);
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
                if (((FullRegInfo)regInfo).getCoderType()==Constants.PROFESSIONAL)
                    buf.append(Constants.DC_REG_PRO_SUCCESS_PAGE);
                else buf.append(Constants.DC_REG_STUDENT_SUCCESS_PAGE);
                setNextPage(buf.toString());
                setIsNextPageInContext(false);
            }
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
    }

    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {
        try {
            if (((FullRegInfo)info).getCoderType()==Constants.STUDENT) {
                StringBuffer buf = new StringBuffer(1000);
                User user = (User) createEJB(getInitialContext(), User.class);
                String code = user.getActivationCode(newUser.getId(), db);

                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("IMPORTANT - DoubleClick Activation Email");

                buf.append("You're invited to take part in the Google Code Jam 2003, a programming competition that will be worthy of your time, your skills and your interest.\n\n");
                buf.append("GOOGLE CODE JAM 2003 ACTIVATION INFORMATION\n\n");
                buf.append("Your Google activation code is ");
                buf.append(code);
                buf.append("\n\n");
                buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");
                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
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
            }
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
        buf.append(Constants.DC_ACTIVATION);
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
