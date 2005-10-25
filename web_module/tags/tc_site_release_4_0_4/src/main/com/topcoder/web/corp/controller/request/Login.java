package com.topcoder.web.corp.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.Constants;

import java.util.Map;

/**
 * A RequestProcessor used to handle logins.  If the login fails or the necessary parameters are not
 * present, it displays the login form; otherwise it redirects to the path in the "nextpage" parameter.
 *
 * @author Ambrose Feinstein
 */
public class Login extends BaseProcessor {
    public static final String KEY_USER_HANDLE = "handle";
    public static final String KEY_USER_PASS = "passw";

    private final static Logger log = Logger.getLogger(Login.class);

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter(KEY_USER_HANDLE);
        String password = getRequest().getParameter(KEY_USER_PASS);

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = StringUtils.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute("message", "You must enter a username and a password.");

            } else {
                try {

                    getAuthentication().login(new SimpleUser(0, username, password));

                    if (!hasActiveAccount(username)) throw new LoginException("Sorry, your account is not active.");

                    /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                    String dest = StringUtils.checkNull(getRequest().getParameter(BaseServlet.NEXT_PAGE_KEY));
                    log.debug("dest param was: " + dest);
                    if (dest == null) dest = StringUtils.checkNull((String) getRequest().getAttribute(BaseServlet.NEXT_PAGE_KEY));
                    log.debug("on successfull login, going to " + dest);
                    setNextPage(dest);
                    setIsNextPageInContext(false);
                    return;

                } catch (LoginException e) {

                    /* the login failed, so tell them what happened */
                    getRequest().setAttribute(BaseServlet.MESSAGE_KEY, e.getMessage());
                } catch (Exception e) {
                    throw new TCWebException(e);
                }
            }

            /* whatever was wrong with the submission, make sure they are logged out */
            getAuthentication().logout();
        }

        setNextPage(Constants.LOGIN_PAGE);
        setIsNextPageInContext(true);
    }

    private boolean hasActiveAccount(String userName) throws Exception {
        DataAccessInt dAccess = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);

        Request dataRequest = new Request();
        dataRequest.setProperty("ha", userName);
        dataRequest.setContentHandle("active_user");

        Map map = dAccess.getData(dataRequest);

        if (map != null && map.size() == 1) {
            ResultSetContainer result = (ResultSetContainer) map.get("active_user");
            return !(result == null || result.isEmpty());
        } else {
            return false;
        }
    }

}
