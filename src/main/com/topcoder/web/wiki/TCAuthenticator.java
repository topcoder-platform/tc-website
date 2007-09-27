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
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.rmi.RemoteException;
import java.security.Principal;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

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

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password) throws AuthenticatorException {
        return login(request, response, userName, password, false);
    }

    public boolean login(HttpServletRequest request, HttpServletResponse response,
                         String userName, String password, boolean cookie) throws AuthenticatorException {
        log.debug("XXX login called " + userName);

        try {

            Principal user = getUser(userName);
            TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication =
                    new LightAuthentication(new SessionPersistor(tcRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);

            if (user != null) {
                try {
                    TCSubject sub = authenticate(userName, password);
                    if (sub != null) {
                        if (Arrays.binarySearch(WebConstants.ACTIVE_STATI, getStatus(sub.getUserId())) >= 0) {
                            //confluence likes to work with lower case user names
                            com.atlassian.user.User cUser = getUserAccessor().getUser(userName.toLowerCase());
                            log.debug("got user " + cUser.getName());
                            if (cUser == null) {
                                log.debug("XXX create the user");
                                String[] groups = new String[]{UserAccessor.GROUP_CONFLUENCE_USERS};
                                //confluence likes to work with lower case user names
                                getUserAccessor().addUser(userName.toLowerCase(), "", "", userName, groups);
                            }

                            boolean isTCAdmin = isAdmin(userName);
                            boolean isConfluenceAdmin = hasStaffGroup(cUser);

                            if (isTCAdmin && !isConfluenceAdmin) {
                                //confluence likes to work with lower case user names
                                getUserAccessor().addMembership(GROUP_TOPCODER_STAFF, userName.toLowerCase());
                            } else if (!isTCAdmin && isConfluenceAdmin) {
                                //confluence likes to work with lower case user names
                                getUserAccessor().removeMembership(GROUP_TOPCODER_STAFF, userName.toLowerCase());
                            }
                            authentication.login(new SimpleUser(sub.getUserId(), userName, password), cookie);
                            return true;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                } catch (Exception e) {
                    if (log.isDebugEnabled()) {
                        e.printStackTrace();
                    }
                    return false;
                }

            }


            authentication.logout();
            return false;

        } catch (Exception e) {
            throw new AuthenticatorException(e.getMessage());
        }

    }

    private boolean hasStaffGroup(com.atlassian.user.User user) {
        Pager p = getUserAccessor().getGroups(user);
        Group g;
        boolean found = false;
        for (Iterator it = p.iterator(); it.hasNext() && !found;) {
            g = (Group) it.next();
            if (g.getName().equals(GROUP_TOPCODER_STAFF)) {
                found = true;
            }
        }
        return found;
    }

    private char getStatus(long userId) throws Exception {
        DataAccess dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request dataRequest = new Request();
        dataRequest.setProperty(DataAccessConstants.COMMAND, "userid_to_password");
        dataRequest.setProperty("uid", Long.toString(userId));
        Map dataMap = dai.getData(dataRequest);
        ResultSetContainer rsc = (ResultSetContainer) dataMap.get("userid_to_password");
        return rsc.getStringItem(0, "status").charAt(0);

    }


    private TCSubject authenticate(String userName, String password) {


        TCSubject ret = null;
        try {
            LoginLocal login = (LoginLocal) Constants.createLocalEJB(LoginLocal.class);
            ret = login.login(userName, password);
            if (log.isDebugEnabled()) {
                log.debug("correct user name and password");
            }
        } catch (RemoteException e) {
            throw new RuntimeException(e);
        } catch (GeneralSecurityException e) {
            return ret;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return ret;
    }

    protected boolean authenticate(Principal principal, String password) {
        log.debug("XXX authenticate called");
        return authenticate(principal.getName(), password) == null;
    }

    public void setUserAccessor(UserAccessor userAccessor) {
        log.debug("XXX setUserAccessor called");
        super.setUserAccessor(userAccessor);
    }

    protected UserAccessor getUserAccessor() {
        log.debug("XXX getUserAccessor called");
        return super.getUserAccessor();
    }

    protected Principal getUser(String userName) {
        if (log.isDebugEnabled()) {
            log.debug("XXX getUser called ");
        }

        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            UserPrincipal p = pmr.getUser(userName);
            if (p.getId() == guest.getId()) {
                return null;
            } else {
                DefaultUser du = new DefaultUser(p.getName());
                du.setName(p.getName());
                du.setFullName(du.getName());
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

    private boolean isAdmin(String userName) throws Exception {
        try {
            PrincipalMgrLocal pmr = (PrincipalMgrLocal) Constants.createLocalEJB(PrincipalMgrLocal.class);
            TCSubject sub = pmr.getUserSubject(pmr.getUser(userName).getId());
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

    public Principal getUser(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) {
        //log.debug("XXX getUser(request, response) called");
        TCRequest tcRequest = HttpObjectFactory.createSimpleRequest(httpServletRequest);
        TCResponse tcResponse = httpServletResponse == null ? null : HttpObjectFactory.createResponse(httpServletResponse);
        try {
            WebAuthentication authentication =
                    new BasicAuthentication(new SessionPersistor(httpServletRequest.getSession()),
                            tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            if (authentication.getActiveUser().isAnonymous()) {
                return null;
            } else {
                //confluence likes to work with lower case user names
                DefaultUser ret = new DefaultUser(authentication.getActiveUser().getUserName().toLowerCase());
                ret.setFullName(authentication.getActiveUser().getUserName());
                return ret;
            }

        } catch (Exception e) {
            log.warn(e.getMessage(), e);
            return null;
        }
    }
}
