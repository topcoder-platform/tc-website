package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class Login extends Base {

    private static final String[] INACTIVE_STATI = {"I", "0", "9", "6", "5", "4"};
    private static final String[] UNACTIVE_STATI = {"U", "2"};

    public static final String USER_NAME = "username";
    public static final String PASSWORD = "password";

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(USER_NAME);
        String password = getRequest().getParameter(PASSWORD);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute(BaseServlet.MESSAGE_KEY, "You must enter a username and a password.");

            } else {
                try {
                    try {

                        getAuthentication().login(new SimpleUser(0, username, password));

                        String status = getStatus(getAuthentication().getUser().getId());
                        if (status.equals("A")) {
                            String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
                            setNextPage(dest);
                            setIsNextPageInContext(false);
                            doLegacyCrap(getRequest());
                            return;
                        } else {
                            getAuthentication().logout();
                            if (hasDisabledAccount(status)) {
                                throw new LoginException("Sorry, your account is not active.  " +
                                        "If you believe this is an error, please contact TopCoder.");
                            } else if (hasUnactiveAccount(status)) {
                                setNextPage(Constants.ACTIVATE);
                                setIsNextPageInContext(true);
                            } else {
                                throw new NavigationException("Invalid account status");
                            }
                        }

                    } catch (LoginException e) {
                        /* the login failed, so tell them what happened */
                        getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                    }
                } catch (TCWebException e) {
                    throw e;
                } catch (Exception e) {
                    throw(new TCWebException(e));
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        setNextPage(Constants.LOGIN);
        setIsNextPageInContext(true);
    }

    private boolean hasDisabledAccount(String status) throws Exception {
        boolean found = false;
        for (int i=0; !found&&i<INACTIVE_STATI.length; i++) {
            found = status.equals(INACTIVE_STATI[i]);
        }
        return found;
    }

    private boolean hasUnactiveAccount(String status) throws Exception {
        boolean found = false;
        for (int i=0; !found&&i<UNACTIVE_STATI.length; i++) {
            found = status.equals(UNACTIVE_STATI[i]);
        }
        return found;
    }


    /**
     * get the status for a user.  if the user doesn't exists, we'll return empty string
     * @param userId
     * @return
     * @throws Exception
     */
    private String getStatus(long userId) throws Exception {
        DataAccessInt dAccess = getDataAccess();

        Request dataRequest = new Request();
        dataRequest.setProperty("uid", String.valueOf(userId));
        dataRequest.setContentHandle("user_status");

        Map map = dAccess.getData(dataRequest);

        ResultSetContainer result = (ResultSetContainer) map.get("user_status");
        if (result.isEmpty()) {
            return "";
        } else {
            return result.getStringItem(0, "status");
        }

    }

    private void doLegacyCrap(HttpServletRequest request) throws Exception {
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote)
                com.topcoder.web.common.security.Constants.createEJB(PrincipalMgrRemote.class);
log.debug("XXX activeuserid: " + getAuthentication().getActiveUser().getId());
        TCSubject user = pmgr.getUserSubject(getAuthentication().getActiveUser().getId());
log.debug("XXX subject id: " + user.getUserId());
        CoderSessionInfo ret = new CoderSessionInfo(request, getAuthentication(), user.getPrincipals());
log.debug("XXX sessioninfo id: " + ret.getUserId());
        Navigation nav = new Navigation(request, ret);
log.debug("XXX nav id: " + nav.getUserId());
        request.getSession(true).setAttribute("navigation", nav);
    }

}
