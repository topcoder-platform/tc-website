package com.topcoder.web.privatelabel.controller.request.dc05;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.privatelabel.model.ResumeRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 26, 2005
 */
public class Submit extends FullRegSubmit {


    protected void setNextPage() {
        SessionInfo sInfo = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        setNextPage(sInfo.getServletPath() + "?" + Constants.MODULE_KEY + "=" + Constants.STATIC + Constants.DC05_REG_SUCCESS_PAGE);
        setIsNextPageInContext(false);
    }

    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {
            StringBuffer buf = new StringBuffer(1000);
            User user = (User) createEJB(getInitialContext(), User.class);
            String code = user.getActivationCode(userId, db);

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("DoubleClick(tm) 2005 Coding Challenge, Powered by TopCoder(r)");


            buf.append("Thank you for registering for the DoubleClick(tm) 2005 Coding Challenge, Powered by TopCoder(r).\n\n");
            buf.append("Your handle is " + info.getHandle() + "\n");
            buf.append("Your password is " + info.getPassword() + "\n\n");
            buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete in the DCCC.\n\n");
            buf.append("PRACTICING FOR THE EVENT\n");
            buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in the Coding Challenge.  The practice room contains problems that will be similar in nature to the problems you will encounter during competition.  The practice room will be available from 9:00AM ET on February 22 through 5:00PM ET on March 2, 2005.\n\n");
            buf.append("You can access the practice rooms by navigating to www.topcoder.com/doubleclick_employee and clicking on the Competition Arena tab.\n\n");
            buf.append("LAUNCHING THE ARENA\n");
            buf.append("You can launch and login to the competition arena at the appropriate time by navigating to www.topcoder.com/doubleclick_employee and clicking on the Competition Arena tab.\n\n");
            buf.append("You need to have Java Runtime version 1.4 installed in order to launch the arena.  You can download free at http://java.sun.com/getjava/index.jsp \n\n");
            buf.append("We also suggest that you read up on the competition process by navigating to www.topcoder.com/doubleclick_employee and downloading the competition manual.\n\n");
            buf.append("If you have any questions about how to participate, please email them to dccc@topcoder.com.\n\n");
            buf.append("Thank you for registering for the DoubleClick 2005 Coding Challenge.  We look forward to seeing you in the Arena!\n\n");
            buf.append("- TopCoder Competitions Team");

            mail.setBody(buf.toString());
            mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
            mail.setFromAddress("dccc@topcoder.com", "DoubleClick Coding Challenge Team");
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
        buf.append(Constants.GOOGLE_INDIA_05_ACTIVATION);
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
