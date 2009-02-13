package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.controller.request.FullRegSubmit;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;

import java.util.List;
import java.util.Collections;

/**
 * @author dok
 * @version $Revision: 43893 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2006
 */
public class Submit extends FullRegSubmit {


   protected void registrationProcessing() throws TCWebException {

        /*
          don't need to check the data cuz it should have
          already been done.  we got it all from the session
          so it should be good
        */
        /* actually, we do need to check the handle, someone
           may have taken in the meantime
         */

        try {
            if (regInfo.isNew() && userExists(regInfo.getHandle())) {
                addError(Constants.HANDLE, getBundle().getProperty("error_dup_handle"));
                setDefaults(regInfo);
                List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), getLocale());
                Collections.sort(l);
                getRequest().setAttribute("questionList", l);
            } else {
                long newUser = commit(regInfo);
                handleActivation(regInfo, newUser);
                clearRegInfo();
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage();
    }

    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(getSessionInfo().getSecureAbsoluteServletPath()+"?"+Constants.MODULE_KEY+"="+
                    Constants.VERISIGN_06_REG_MAIN+"&"+Constants.EVENT_ID+"6&"+Constants.COMPANY_ID+"=17942");
            setIsNextPageInContext(false);
        } else {
            SessionInfo info = (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
            StringBuffer buf = new StringBuffer(150);
            buf.append(info.getAbsoluteServletPath());
            buf.append("?");
            buf.append(Constants.MODULE_KEY);
            buf.append("=");
            buf.append(Constants.STATIC);
            if (regInfo.isNew()) {
                buf.append(Constants.VERISIGN_06_REG_SUCCESS_PAGE);
            } else {
                buf.append(Constants.VERISIGN_06_UPDATE_SUCCESS_PAGE);
            }
            setNextPage(buf.toString());
            setIsNextPageInContext(false);
        }
    }

    protected void handleActivation(SimpleRegInfo info, long userId) throws TCWebException {
        try {
            if (info.isNew()) {

                StringBuffer url = new StringBuffer(80);
                url.append("http://");
                url.append(ApplicationServer.SERVER_NAME);
                url.append("/verisigninternal");


                User user = (User) createEJB(getInitialContext(), User.class);
                String code = user.getActivationCode(userId, db);

                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("IMPORTANT - VeriSign Internal Coding Competitions Activation Email");

                StringBuffer buf = new StringBuffer(1000);
                buf.append("Thank you for registering to participate in the VeriSign Internal Coding Competitions\n\n");

                buf.append("VERISIGN INTERNAL CODING COMPETITIONS ACTIVATION INFORMATION\n\n");

                buf.append("Your VeriSign activation code is ");
                buf.append(code);
                buf.append("\n\n");

                buf.append("To activate your account, navigate to the following WWW URL:\n\n");

                buf.append(getUrl(code));
                buf.append("\n\n");

                buf.append("If you cannot click on the web address above, please copy the address into your web browser to continue.  If the address spans two lines, please make sure you copy and paste both sections without any spaces between them.\n\n");

                buf.append("Your handle and password will provide you with access to the Competition Arena, where you can practice and chat, and where you'll compete.\n\n");

                buf.append("Remember you must register for each SRM.  Check the schedule for the time to register here:  http://").append(ApplicationServer.SERVER_NAME).append("/pl/?module=Static&d1=verisign06&d2=schedule\n\n");

                buf.append("PRACTICING FOR THE EVENT\n");
                buf.append("There is a practice room available to you that will allow you to become acclimated with the competition environment before you participate in any Single Round Matches (SRMs).  The practice room contains a problem set that will be very similar in nature to the problems you will encounter during competition.\n\n");

                buf.append("You can access the practice rooms by navigating to ");
                buf.append(url);
                buf.append(" and clicking on the Competition Arena tab.\n\n");

                buf.append("LAUNCHING THE ARENA\n");
                buf.append("You can launch and login to the competition arena at the appropriate time by navigating to ");
                buf.append(url);
                buf.append(" and clicking on the Competition Arena tab.\n\n");

                buf.append("You will need to have the Java 1.4.x runtime installed in order to launch the arena.\n\n");

                buf.append("We also suggest that you read up on the competition process by navigating to ");
                buf.append(url);
                buf.append(" and clicking the Instructions link at the top.\n\n");

                buf.append("If you have any questions about how to participate, please email them to verisign@topcoder.com\n\n");

                buf.append("Thank you for registering.  We look forward to seeing you in the Arena!\n\n");


                mail.setBody(buf.toString());
                mail.addToAddress(info.getEmail(), TCSEmailMessage.TO);
                mail.setFromAddress("verisign@topcoder.com", "VeriSign Competitions Team");
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
        buf.append(Constants.VERISIGN_06_ACTIVATION);
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
