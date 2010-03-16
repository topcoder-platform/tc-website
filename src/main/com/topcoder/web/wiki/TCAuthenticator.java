package com.topcoder.web.wiki;

import com.atlassian.confluence.user.ConfluenceAuthenticator;
import com.atlassian.confluence.user.UserAccessor;
import com.atlassian.seraph.auth.AuthenticatorException;
import com.atlassian.user.Group;
import com.atlassian.user.impl.DefaultUser;
import com.atlassian.user.search.page.Pager;
import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrLocal;
import com.topcoder.security.login.LoginLocal;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.security.Principal;
import java.util.Iterator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 8, 2007
 */
public class TCAuthenticator extends ConfluenceAuthenticator {
    //public class TCAuthenticator extends DefaultAuthenticator {
    private final static Logger log = Logger.getLogger(TCAuthenticator.class);

    private static String GROUP_TOPCODER_STAFF = "topcoder-staff";
    private static final User guest = SimpleUser.createGuest();
    private static final String[] groups = new String[]{UserAccessor.GROUP_CONFLUENCE_USERS};

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password) throws AuthenticatorException {
        return login(request, response, userName, password, false);
    }

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password, boolean cookie) throws AuthenticatorException {
        log.debug("XXX login called " + userName);
        long start = System.currentTimeMillis();

        try {

            Principal user = getUser(userName);
            WebAuthentication authentication = getAuth(request, response);

            if (user != null) {
                try {
                    TCSubject sub = authenticate(userName, password);
                    if (sub != null) {
                        log.info("login(request, response, username, password, cookie) took " + (System.currentTimeMillis() - start) + " ms");
                        return true;
                    } else {
                        log.info("login(request, response, username, password, cookie) took " + (System.currentTimeMillis() - start) + " ms");
                        return false;
                    }
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    }
                    log.info("login(request, response, username, password, cookie) took " + (System.currentTimeMillis() - start) + " ms");
                    return false;
                }

            }


            authentication.logout();
            log.info("login(request, response, username, password, cookie) took " + (System.currentTimeMillis() - start) + " ms");
            return false;
        } catch (Exception e) {
            throw new AuthenticatorException(e.getMessage());
        }

    }

    private boolean hasGroup(final com.atlassian.user.User user, final String group) {
        Pager p = getUserAccessor().getGroups(user);
        Group g;
        boolean found = false;
        for (Iterator it = p.iterator(); it.hasNext() && !found;) {
            g = (Group) it.next();
            if (g.getName().equals(group)) {
                found = true;
            }
        }
        return found;
    }

    private TCSubject authenticate(final String userName, final String password) {

        TCSubject ret = null;
        try {
            LoginLocal login = (LoginLocal) Constants.createLocalEJB(LoginLocal.class);
            ret = login.login(userName, password);
            if (log.isDebugEnabled()) {
                log.debug("correct user name and password");
            }
        } catch (GeneralSecurityException e) {
            return ret;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return ret;
    }

    protected boolean authenticate(final Principal principal, final String password) {
        log.debug("XXX authenticate called");
        return authenticate(principal.getName(), password) == null;
    }

    public void setUserAccessor(UserAccessor userAccessor) {
        log.debug("XXX setUserAccessor called");
        super.setUserAccessor(userAccessor);
    }

    public UserAccessor getUserAccessor() {
        log.debug("XXX getUserAccessor called");
        return super.getUserAccessor();
    }

    protected Principal getUser(String userName) {
        long start = System.currentTimeMillis();
        if (log.isDebugEnabled()) {
            log.debug("XXX getUser called ");
        }

        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            UserPrincipal p = pmr.getUser(userName);
            if (p.getId() == guest.getId()) {
                //log.info("getUser(userName) took " + (System.currentTimeMillis() - start) + " ms");
                return null;
            } else {
                DefaultUser du = new DefaultUser(p.getName());
                du.setName(p.getName());
                du.setFullName(du.getName());
                //log.info("getUser(userName) took " + (System.currentTimeMillis() - start) + " ms");
                return du;
            }
        } catch (NoSuchUserException e) {
            log.debug("no such user");
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    private boolean isAdmin(final String userName) throws Exception {
        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            //TCSubject sub = pmr.getUserSubject(pmr.getUser(userName).getId());
            TCSubject sub = SecurityHelper.getUserSubject(pmr.getUser(userName).getId());
            for (Object rp : sub.getPrincipals()) {
                if (((RolePrincipal) rp).getName().equals("group_Admin")) {
                    return true;
                }
            }
            return false;
        } catch (NoSuchUserException e) {
            log.debug("no such user");
            return false;
        }
    }

    /**
     * check to see if a particular user exists in confluence yet, if not, add it.
     * returns the confluence user.
     *
     * @param userName the user name, this should be in the normal case of the username.  this method
     *                 will deal with confluence's case issues.
     * @return the user that was either created, or retrieved
     */
    private com.atlassian.user.User checkAndAddUser(final String userName) {
        long start = System.currentTimeMillis();
        com.atlassian.user.User cUser = getUserAccessor().getUser(userName.toLowerCase());
        if (cUser == null) {
            cUser = getUserAccessor().addUser(userName.toLowerCase(), "", "", userName, groups);
        }

        //log.info("checkAndAddUser(userName) took " + (System.currentTimeMillis() - start) + " ms");
        return cUser;

    }

    private void checkAndAddAdmin(String userName, com.atlassian.user.User cUser) throws Exception {
        long start = System.currentTimeMillis();
        boolean isTCAdmin = isAdmin(userName);
        boolean isConfluenceAdmin = hasGroup(cUser, GROUP_TOPCODER_STAFF);

        if (isTCAdmin && !isConfluenceAdmin) {
            getUserAccessor().addMembership(GROUP_TOPCODER_STAFF, cUser.getName());
        } else if (!isTCAdmin && isConfluenceAdmin) {
            getUserAccessor().removeMembership(GROUP_TOPCODER_STAFF, cUser.getName());
        }
        //log.info("checkAddAddAdmin(userNaem, user) took " + (System.currentTimeMillis() - start) + " ms");

    }

    private String getEmail(long userId) throws Exception {
        long start = System.currentTimeMillis();
        DataAccess dai = new CachedDataAccess(MaxAge.HALF_HOUR, DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, "user_email");
        dataRequest.setProperty("uid", String.valueOf(userId));
        ResultSetContainer rsc = dai.getData(dataRequest).get("user_email");
        //log.debug("email for user " + userId + " " + rsc.toString());
        //log.info("getEmail(userId) took " + (System.currentTimeMillis() - start) + " ms");
        return rsc.getStringItem(0, "address");

    }

    private void checkAndAddEmail(com.atlassian.user.User user, long tcUserId) throws Exception {
        long start = System.currentTimeMillis();
        if (user.getEmail() == null) {
            user.setEmail(getEmail(tcUserId));
            getUserAccessor().saveUser(user);
        } else {
            String email = getEmail(tcUserId);
            if (!email.equals(user.getEmail())) {
                user.setEmail(getEmail(tcUserId));
                getUserAccessor().saveUser(user);
            }
        }
        //log.info("checkAndAddEmail(user, tcUserId) took " + (System.currentTimeMillis() - start) + " ms");
    }

    public Principal getUser(HttpServletRequest request, HttpServletResponse response) {
        //log.debug("XXX getUser(request, response) called");
        long start = System.currentTimeMillis();
        Principal user = getPrincipalFromRequest(request);
        if (user==null) {
            try {
                WebAuthentication authentication = getAuth(request, response);
                if (!authentication.getActiveUser().isAnonymous()) {
                    com.atlassian.user.User u = checkAndAddUser(authentication.getActiveUser().getUserName());
                    checkAndAddEmail(u, authentication.getActiveUser().getId());
                    checkAndAddAdmin(authentication.getActiveUser().getUserName(), u);
                    setPrincipalInRequest(u, request);
                    user = u;
                }

            } catch (Exception e) {
                log.warn(e.getMessage(), e);
            }
        }
        long time = System.currentTimeMillis() - start;
        if (time>100) {
            log.info((user==null?"anon":user.getName()) + " getUser(request, response) took " + (System.currentTimeMillis() - start) + " ms");
        }
        return user;
    }

    private static final String USER_KEY = "ukey";
    //cache user in request
    private Principal getPrincipalFromRequest(HttpServletRequest request) {
        return (Principal)request.getAttribute(USER_KEY);
    }
    private void setPrincipalInRequest(Principal p,HttpServletRequest request) {
        if (p!=null) {
            request.setAttribute(USER_KEY, p);
        }
    }

    private WebAuthentication getAuth(HttpServletRequest request, HttpServletResponse response) throws Exception {
        TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(request);
        TCResponse tcResponse = response == null ? null : HttpObjectFactory.createResponse(response);
        return new LightAuthentication(new SessionPersistor(request.getSession()),
                tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
    }

}
