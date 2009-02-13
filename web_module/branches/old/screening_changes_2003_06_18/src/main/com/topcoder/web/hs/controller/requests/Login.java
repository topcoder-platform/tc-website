package com.topcoder.web.hs.controller.requests;

import com.topcoder.shared.security.*;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.hs.common.*;
import com.topcoder.web.common.TCWebException;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.Map;

/**
 * A RequestProcessor used to handle logins.  If the login fails or the necessary parameters are not
 * present, it displays the login form; otherwise it redirects to the path in the "nextpage" parameter.
 *
 * @author Ambrose Feinstein
 */
public class Login extends Base {

    protected void businessProcessing() throws TCWebException {

        /* may be null */
        String username = getRequest().getParameter("username");
        String password = getRequest().getParameter("password");

        /* if not null, we got here via a form submit;
         * otherwise, skip this and just draw the login form */
        if (username != null) {

            password = Constants.checkNull(password);
            if (username.equals("") || password.equals("")) {
                getRequest().setAttribute("message", "You must enter a username and a password.");

            } else {
                try {
                    try {

                        getAuthentication().login(new SimpleUser(0, username, password));

                        if (!hasActiveAccount(username)) throw new LoginException("Sorry, your account is not active.");

                        /* no need to reset user or sessioninfo, since we immediately proceed to a new page */
                        String dest = Constants.checkNull(getRequest().getParameter("nextpage"));
                        setNextPage(dest);
                        setIsNextPageInContext(false);
                        return;

                    } catch (LoginException e) {

                        /* the login failed, so tell them what happened */
                        getRequest().setAttribute("message", e.getMessage());
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

        /* we may have been forwarded here and failed, so make sure we reflect the page contents in the menus */
        nav.setAll("login");

        setNextPage(Constants.login_form);
        setIsNextPageInContext(true);
    }


    private boolean hasActiveAccount(String userName) throws Exception {
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource) PortableRemoteObject.narrow(context.lookup(DBMS.HS_OLTP_DATASOURCE_NAME), DataSource.class);
        DataAccessInt dAccess = new DataAccess(ds);

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
