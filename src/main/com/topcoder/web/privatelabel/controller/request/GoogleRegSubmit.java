package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ejb.user.User;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.security.UserPrincipal;

public class GoogleRegSubmit extends FullRegSubmit {

    protected void setNextPage() {
        if (isEligible()) {
            setNextPage(Constants.GOOGLE_REG_SUCCESS_PAGE);
        } else {
            throw new RuntimeException("impossible, isEligible returned false, fix the code");
        }
        setIsNextPageInContext(true);
    }

    protected void handleActivation(SimpleRegInfo info, UserPrincipal newUser) throws TCWebException {
        try {
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(newUser.getId(), db);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("IMPORTANT - Google Event Activation Email");

            buf.append("GOOGLE EVENT ACTIVATION INFORMATION\n\n");
            buf.append("Your Google activation code is ");
            buf.append(code);
            buf.append("\n\n");
            buf.append("To activate your account, navigate to the following WWW URL:\n\n");
            buf.append(getUrl(code));
            buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");
            buf.append("Your handle and password will provide you with access to the Google Competition Arena, where you can practice and chat, and where you'll compete in the Google Extreme Coding Challenge.\n\n");
            buf.append("PRACTICING FOR THE EVENT\n");
            buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Google Extreme Coding Challenge.  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.  The practice room will be available from 8:00AM EDT on October 1, 2003 through 5:00PM EDT on October 15, 2003.\n\n");
            buf.append("You can access the practice rooms by navigating to http://www.topcoder.com/google and clicking on the Practice Now tab.\n\n");
            buf.append("LAUNCHING THE ARENA\n");
            buf.append("You can launch and login to the competition arena at the appropriate time by navigating to http://www.topcoder.com/google and clicking on the Compete Now tab.\n\n");
            buf.append("Windows, Linux and Unix users need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");
            buf.append("Mac OS X  users need to have the Java 1.4.x runtime installed, which requires OS X version 10.2.x.\n\n");
            buf.append("We also suggest that you read up on the competition process by navigating to http://www.topcoder.com/google and downloading the competition manual.\n\n");
            buf.append("If you have any questions about how to participate, please email them to service@topcoder.com\n\n");
            buf.append("Thank you for registering for the Google Extreme Coding Challenge.  We look forward to seeing you in the arena!\n\n");

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
