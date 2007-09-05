package com.topcoder.dde.util;

import com.topcoder.dde.user.UserManagerRemote;
import com.topcoder.dde.user.UserManagerRemoteHome;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.LoginException;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * An authentication implementation for the TCS site.  It doesn't provide actual login facilities
 * but makes it possible to emulate the regular MVC architecture on the TCS site.
 *
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Feb 4, 2005
 */
public class TCSAuthentication implements WebAuthentication {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private static final User GUEST = SimpleUser.createGuest();
    private boolean knownUser = false;

    //this is used to hold the cookie values until they are written to the response.
    //that way we can avoid sending the same cookie more than one time.
    private HashMap<String, Cookie> cookies = new HashMap<String, Cookie>();



    public TCSAuthentication(HttpServletRequest request, HttpServletResponse response) throws Exception {
        this.request = request;
        this.response = response;
    }

    public User getActiveUser() {
        User ret = null;
        com.topcoder.dde.user.User tcsUser =
                (com.topcoder.dde.user.User) request.getSession().getAttribute("TCUSER");
        if (tcsUser == null) {
            try {
                InitialContext ctx = new InitialContext();
                Object objUserManager = ctx.lookup("dde/UserManager");
                UserManagerRemoteHome userManagerHome = (UserManagerRemoteHome) PortableRemoteObject.narrow(objUserManager, UserManagerRemoteHome.class);
                UserManagerRemote userManager = userManagerHome.create();
                TCSubject sub = Cookies.getUserFromLoginCookies(request, response, userManager);
                if (sub != null) {
                    tcsUser = userManager.getUser(sub.getUserId());
                    request.getSession().setAttribute("TCUSER", tcsUser);
                }
            } catch (Exception e) {
                //not much we can do....
                e.printStackTrace();
            }
        }
        if (tcsUser == null) {
            ret = GUEST;
        } else {
            markKnownUser();
            ret = new SimpleUser(tcsUser.getId(), tcsUser.getRegInfo().getUsername(),
                    tcsUser.getRegInfo().getPassword());
        }
        return ret;
    }

    /**
     * Get the details of the logged in user if any; otherwise return an anonymous user.
     */
    public User getUser() {
        User ret = null;
        com.topcoder.dde.user.User tcsUser =
                (com.topcoder.dde.user.User) request.getSession().getAttribute("TCUSER");
        if (tcsUser == null) {
            ret = GUEST;
        } else {
            markKnownUser();
            ret = new SimpleUser(tcsUser.getId(), tcsUser.getRegInfo().getUsername(),
                    tcsUser.getRegInfo().getPassword());
        }
        return ret;
    }

    /**
     * Attempt to log in with the given user.
     *
     * @param u
     * @param rememberUser whether or not the user
     *                     should be recognized the next time they log in (getActiveUser())
     * @throws com.topcoder.shared.security.LoginException
     *
     */
    public void login(User u, boolean rememberUser) throws LoginException {
        throw new RuntimeException("Not implemented");
    }

    public void login(User u) throws LoginException {
        throw new RuntimeException("Not implemented");
    }

    public void login(User u, boolean rememberUser, String dataSource) throws LoginException {
        throw new RuntimeException("Not implemented");
    }

    public void login(User u, String dataSource) throws LoginException {
        throw new RuntimeException("Not implemented");
    }

    /**
     * Log out, if currently considered logged in.
     */
    public void logout() {
        throw new RuntimeException("Not implemented");
    }

    private void markKnownUser() {
        Cookie c = new Cookie(KNOWN_USER, String.valueOf(true));
        c.setMaxAge(Integer.MAX_VALUE);
        cookies.put(c.getName(), c);
        knownUser = true;
    }

    public boolean isKnownUser() {
        if (knownUser) {
            return true;
        } else {
            Cookie[] ca = request.getCookies();
            boolean found = false;
            for (int i = 0; ca != null && i < ca.length && !found; i++) {
                found = KNOWN_USER.equals(ca[i].getName());
            }
            return found;
        }
    }

        /**
     * Write all the cookies to the response.  We batch them up
     * so that they can be written all at once so that the developer
     * doesn't have to worry about setting the same cookie more than once.
     * Whatever the last thing the cookie was set to will be what is written
     * to the response.
     *
     * This method must be called before the response is written and flushed
     * to the user.
     */
    public void flushCookies() {
        for (Map.Entry<String, Cookie> entry : cookies.entrySet()) {
            response.addCookie(entry.getValue());
        }
    }
}
