package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.security.UserPrincipal;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
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


                buf.append("You're invited to take part in the DoubleClick 2004 Coding Challenge, a programming competition that will be worthy of your time, your skills and your interest.\n\n");
                buf.append("DOUBLECLICK 2004 CODING CHALLENGE ACTIVATION INFORMATION\n\n");
                buf.append("Your DoubleClick activation code is ");
                buf.append(code);
                buf.append("\n\n");
                buf.append("To activate your account, navigate to the following WWW URL:\n\n");
                buf.append(getUrl(code));
                buf.append("\n\n");
                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
                buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete in the DoubleClick 2004 Coding Challenge.\n\n");
                buf.append("PRACTICING FOR THE EVENT AND LAUNCHING THE ARENA\n");
                buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Coding Challenge.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 9:00AM ET on February 9 through 1:00PM ET on February 27, 2004.\n\n");
                buf.append("You can access the practice room and launch and login to the arena for the competition by navigating to ");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/pl/?&module=Static&d1=doubleclick&d2=col_arena\n\n");
                buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
                buf.append("Mac OS X users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
                buf.append("COMPETING IN THE QUALIFICATION ROUND\n");
                buf.append("You may participate in the Qualification Round during one of two sessions.  You can only attempt to qualify one time.  Session #1 will be open from 9:00AM through 9:00PM on Monday, February 16.  Session #2 will be open from 9:00AM through 9:00PM on Wednesday, February 18.  You will have up to one hour to solve one problem.  It is recommended that you utilize the practice area prior to participating in the Qualification Round.\n\n");
                buf.append("We also suggest that you read up on the competition process by navigating to ");
                buf.append("http://");
                buf.append(ApplicationServer.SERVER_NAME);
                buf.append("/pl/?&module=Static&d1=doubleclick&d2=col_overview");
                buf.append(" and downloading the competition manual.\n\n");
                buf.append("If you have any questions about how to participate, please email them to dccc@topcoder.com\n\n");
                buf.append("Thank you for registering for the DoubleClick 2004 Coding Challenge.  We look forward to seeing you in the Arena!\n\n");

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
        buf.append(BaseActivate.ACTIVATION_CODE);
        buf.append("=");
        buf.append(code);
        buf.append("&");
        buf.append(Constants.COMPANY_ID);
        buf.append("=");
        buf.append(regInfo.getCompanyId());
        return buf.toString();
    }


}
