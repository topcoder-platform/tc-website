package com.topcoder.web.common.security;

import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;

/**
 * User: dok
 * Date: Dec 16, 2004
 * Time: 10:24:18 AM
 */
public class PersistorAuthentication implements Authentication {

    private static Logger log = Logger.getLogger(BasicAuthentication.class);

    protected static final String USER_PERSISTOR_KEY = "user_obj";

    protected Persistor persistor;
    protected TCRequest request;
    protected TCResponse response;
    protected User guest = SimpleUser.createGuest();

    /**
     * Construct an authentication instance backed by the given persistor
     * and HTTP request and response.
     */
    public PersistorAuthentication(Persistor userPersistor, TCRequest request, TCResponse response) throws Exception {
        this.persistor = userPersistor;
        this.request = request;
        this.response = response;
    }

    /**
     * Log the specified user in and save their status in the persistor
     * No actual authentication is performed, it is expected the given
     * user is valid, we're really just keeping track of them.
     * @param u
     * @throws com.topcoder.shared.security.LoginException
     */
    public void login(User u) throws LoginException {
        try {
            setUserInPersistor(makeUser(u.getId()));
        } catch (Exception e) {
            throw new LoginException("Invalid user");
        }
    }

    /**
     * Figure out who the current user is using either a cookie if it's available, or the persistor.
     * 1.  remove their information from the persistor.
     * 2.  clear their identifying cookies
     */
    public void logout() {
        log.info("logging out");
        setUserInPersistor(guest);
    }


    /**
     * Get the user for this session, only if they have logged in during
     * this session.  Otherwise returns an anonymous user.
     */
    public User getUser() {
        User u = getUserFromPersistor();
        if(u == null) u = guest;
        return u;
    }

    /**
     * Fill in the name field from the user id.
     * @param id
     * @return
     * @throws Exception if the id is invalid
     */
    protected User makeUser(long id) throws Exception {
        try {
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            UserPrincipal up = pmgr.getUser(id);
            return new SimpleUser(id, up.getName(), "");
        } catch (Exception e) {
            throw e;
        }
    }

    protected User getUserFromPersistor() {
        return (User)persistor.getObject(request.getSession().getId()+USER_PERSISTOR_KEY);
    }

    /**
     * Record information about who is logged in and at what level in the
     * persistor.  Done to avoid expensive rechecking of the cookie, and to
     * handle logins which expire with the session.
     *
     * @param user
     */
    protected void setUserInPersistor(User user) {
        persistor.setObject(request.getSession().getId()+USER_PERSISTOR_KEY, user);
    }


}
