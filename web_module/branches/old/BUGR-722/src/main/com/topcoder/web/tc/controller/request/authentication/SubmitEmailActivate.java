package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.StringTokenizer;

/**
 * User: dok
 * Date: Aug 27, 2004
 * Time: 2:21:11 PM
 */
public class SubmitEmailActivate extends Base {

    protected void businessProcessing() throws TCWebException {

        String username = StringUtils.checkNull(getRequest().getParameter(Login.USER_NAME));
        String password = StringUtils.checkNull(getRequest().getParameter(Login.PASSWORD));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));

        if (username.equals("") || password.equals("")) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a username and a password.");
            setNextPage(Constants.EMAIL_ACTIVATE);
            setIsNextPageInContext(true);
        } else if (invalidEmail(email)) {
            getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a valid email address.");
            setNextPage(Constants.EMAIL_ACTIVATE);
            setIsNextPageInContext(true);
        } else {
            TCSubject subject = null;
            try {
                LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                subject = login.login(username, password);
                if (log.isDebugEnabled()) {
                    log.debug("login success " + subject.getUserId());
                }
            } catch (Exception e) {
                log.info("login failed", e);
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "Username or password incorrect.");
                setNextPage(Constants.EMAIL_ACTIVATE);
                setIsNextPageInContext(true);
                return;
            }
            try {
                Email e = (Email) createEJB(getInitialContext(), Email.class);
                long emailId = e.getPrimaryEmailId(subject.getUserId(), DBMS.JTS_OLTP_DATASOURCE_NAME);
                e.setStatusId(emailId, 2, DBMS.JTS_OLTP_DATASOURCE_NAME);
                e.setAddress(emailId, email, DBMS.JTS_OLTP_DATASOURCE_NAME);

                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("TopCoder Account Reactivation");
                StringBuffer msgText = new StringBuffer(1000);
                msgText.append("In order to reactivate your account please go to the following URL: \n\n");
                msgText.append("http://");
                msgText.append(ApplicationServer.SERVER_NAME);
                msgText.append("/tc?module=EmailActivate&");
                msgText.append(Constants.ACTIVATION_CODE);
                msgText.append("=");
                msgText.append(StringUtils.getActivationCode(subject.getUserId()));
                msgText.append("\n\n");
                msgText.append("Thank You,\nTopCoder Service");
                mail.setBody(msgText.toString());
                mail.addToAddress(email, TCSEmailMessage.TO);
                mail.setFromAddress("service@topcoder.com");
                EmailEngine.send(mail);

            } catch (Exception e) {
                throw new TCWebException(e);
            }
            setNextPage(Constants.EMAIL_ACTIVATE_CONFIRM);
            setIsNextPageInContext(false);
        }
    }


    private boolean invalidEmail(String email) {
        boolean ret = false;
        if (email.length() > 100) {
            ret = true;
        }
        StringTokenizer st = new StringTokenizer(email, "@.");
        if (st.countTokens() < 3
                || !StringUtils.contains(email, '@')
                || !StringUtils.contains(email, '.')) {
            ret = true;
        }
        return ret;
    }

}
