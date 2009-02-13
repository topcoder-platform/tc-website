package com.topcoder.web.wiki;

import com.atlassian.confluence.user.ConfluenceAuthenticator;
import com.atlassian.user.User;
import com.atlassian.user.impl.DefaultUser;
import com.atlassian.confluence.user.UserAccessor;
import com.atlassian.seraph.auth.AuthenticatorException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.authentication.EmailActivate;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.LoginRemote;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.Arrays;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 8, 2007
 */
public class TCAuthenticator extends ConfluenceAuthenticator {
    private final static Logger log = Logger.getLogger(TCAuthenticator.class);

    public boolean login(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
                         String string, String string1, boolean b) throws AuthenticatorException {
        log.debug("XXX login called");

        TCRequest tcRequest = HttpObjectFactory.createRequest(httpServletRequest);
        TCResponse tcResponse = HttpObjectFactory.createResponse(httpServletResponse);

        WebAuthentication authentication =
                null;
        try {
            authentication = new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                    tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            User ret = new DefaultUser();
            ret.setFullName(authentication.getActiveUser().getUserName());


            TCSubject sub = null;
            //we need to check if they got the right user name and password before we check anything else
            try {
                LoginRemote login = (LoginRemote) com.topcoder.web.common.security.Constants.createEJB(LoginRemote.class);
                sub = login.login(string, string1);
                if (log.isDebugEnabled()) {
                    log.debug("correct user name and password");
                }
            } catch (Exception e) {
                if (log.isDebugEnabled()) {
                    e.printStackTrace();
                }
                return false;
            }


        } catch (Exception e) {
            throw new AuthenticatorException(e.getMessage());
        }

    }

    private char getStatus(long userId) throws Exception {
        char result;
        com.topcoder.web.ejb.user.User user = (com.topcoder.web.ejb.user.User)
                BaseProcessor.createEJB(getInitialContext(), com.topcoder.web.ejb.user.User.class);
        result = user.getStatus(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;

    }


    private int getEmailStatus(long userId) throws Exception {
        int result;
        Email email = (Email) BaseProcessor.createEJB(getInitialContext(), Email.class);
        result = email.getStatusId(email.getPrimaryEmailId(userId, DBMS.COMMON_OLTP_DATASOURCE_NAME),
                DBMS.COMMON_OLTP_DATASOURCE_NAME);
        return result;
    }

    protected boolean authenticate(Principal principal, String string) {
        log.debug("XXX authenticate called");
        return super.authenticate(principal, string);
    }

    protected com.atlassian.event.EventManager getEventManager() {
        log.debug("XXX getEventManager called");
        return super.getEventManager();
    }

    public void setUserAccessor(UserAccessor userAccessor) {
        log.debug("XXX setUserAccessor called");
        super.setUserAccessor(userAccessor);
    }

    protected UserAccessor getUserAccessor() {
        log.debug("XXX getUserAccessor called");
        return super.getUserAccessor();
    }

    protected Principal getUser(String string) {
        log.debug("XXX getUser called");
        return super.getUser(string);
    }

    public Principal getUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        log.debug("XXX getUser(request, response) called");
        TCRequest tcRequest = HttpObjectFactory.createRequest(httpServletRequest);
        TCResponse tcResponse = HttpObjectFactory.createResponse(httpServletResponse);
        try {
            WebAuthentication authentication =
                    new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            User ret = new DefaultUser();
            ret.setFullName(authentication.getActiveUser().getUserName());
            return ret;

        } catch (Exception e) {
            log.warn(e.getMessage());
            return null;
        }
    }
}
