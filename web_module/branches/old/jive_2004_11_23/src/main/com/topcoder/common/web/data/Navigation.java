package com.topcoder.common.web.data;

import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.common.web.error.TCException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;

import javax.naming.Context;
import javax.servlet.http.*;
import java.io.Serializable;
import java.util.HashMap;

/**
 * This class stores login information about site navigation.
 * @author Steve Burrows
 */
public final class Navigation
        implements Serializable, HttpSessionBindingListener {

    private Browser browser;
//    private boolean serializable;
//    private User userSerializable;
    private User user;
    private HashMap sessionObjects;
    private static Logger log = Logger.getLogger(Navigation.class);
    private CoderSessionInfo info;


    public void valueBound(HttpSessionBindingEvent e) {
        log.debug("common.Navigation:valueBound:called");
    }


    public void valueUnbound(HttpSessionBindingEvent e) {
        StringBuffer msg = new StringBuffer(200);
        msg.append("common.attr.Navigation:valueUnbound:");
        msg.append("user.getUserId:");
        msg.append(user.getUserId());
        log.debug(msg.toString());
        if (getUser().getLoggedIn().equals("Y") && user.getUserId()!=0) {
            Context ctx = null;
            try {
                ctx = TCContext.getInitial();
                UserServicesHome userHome = (UserServicesHome) ctx.lookup(ApplicationServer.USER_SERVICES);
                UserServices userEJB = userHome.findByPrimaryKey(new Integer(getUser().getUserId()));
                setUser(userEJB.getUser());
                getUser().setLoggedIn("N");
                getUser().setModified("U");
                userEJB.setUser(getUser());
            } catch (Exception exception) {
                log.debug("common.Navigation:valueUnbound:ERROR:\n" + exception);
            } finally {
                if (ctx != null) {
                    try {
                        ctx.close();
                    } catch (Exception ignore) {
                    }
                }
            }
        }
    }


    /**
     * The constructor for the class. Initializes instance variables.
     */
    public Navigation() {
        browser = null;
//        serializable = false;
        user = new User();
//        userSerializable = new User();
        sessionObjects = new HashMap(3);
        info = new CoderSessionInfo();
    }

    public Navigation(TCRequest request, CoderSessionInfo info) throws TCException {
        this();
        this.info = info;
        init(request);
    }

    public Navigation(HttpServletRequest request, HttpServletResponse response) throws TCException {
        this();
        try {
            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(tcRequest.getSession()),
                    tcRequest, tcResponse, BasicAuthentication.MAIN_SITE);
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
            info = new CoderSessionInfo(tcRequest, authentication, user.getPrincipals());
            init(tcRequest);
        } catch (Exception e) {
            throw new TCException();
        }
    }
    public Navigation(TCRequest request, HttpServletResponse response) throws TCException {
        this();
        try {
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, tcResponse, BasicAuthentication.MAIN_SITE);
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
            info = new CoderSessionInfo(request, authentication, user.getPrincipals());
            init(request);
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException();
        }
    }

    private void init(TCRequest request) {
        String appName = StringUtils.checkNull(request.getParameter("AppName"));
        if (browser==null) {
            browser = new Browser();
            browser.setAppName(appName);
            browser.setAppVersion(StringUtils.checkNull(request.getParameter("AppVersion")));
            browser.setUserAgent(StringUtils.checkNull(request.getParameter("UserAgent")));
        }
        if (!appName.equals("") && browser.getAppName().equals("")) {
            browser.setAppName(appName);
            browser.setAppVersion(StringUtils.checkNull(request.getParameter("AppVersion")));
            browser.setUserAgent(StringUtils.checkNull(request.getParameter("UserAgent")));
        }
    }



    //get


    public boolean cookiesEnabled(HttpServletRequest request, HttpServletResponse response) {
        boolean result = false;
        StringBuffer url = new StringBuffer(100);
        url.append("://");
        url.append(request.getServerName());
        url.append("/");
        if (response.encodeURL(url.toString()).equals(url.toString())) result = true;
        return result;
    }

    /**
     * deprecated
     * @return
     */
    public boolean userIsSerializable() {
        return true;
       // return this.serializable;
    }

    public Browser getBrowser() {
        return this.browser;
    }

    public int getUserId() {
        return (int)info.getUserId();
    }

    public boolean isIdentified() {
        return !info.isAnonymous();
    }

    public boolean isLoggedIn() {
        return info.isLoggedIn();
    }

    public User getUser() {
//        if (serializable) {
//            return this.userSerializable;
//        } else {
            return this.user;
//        }
    }


    public HashMap getSessionObjects() {
        return this.sessionObjects;
    }

//set

/*
    public void makeUserTransient() throws Exception {
        try {
            if (serializable) {
                user = (User) userSerializable.clone();
                userSerializable = new User();
                serializable = false;
                log.debug("common.Navigation:makeUserTransient:user made transient");
            }
        } catch (Exception e) {
            throw new Exception("common.Navigation:makeUserTransient:ERROR:\n" + e);
        }
    }
*/

    /**
     * deprecated
     * @throws Exception
     */
    public void makeUserSerializable() throws Exception {
/*
        try {
            if (!serializable) {
                userSerializable = (User) user.clone();
                user = new User();
                serializable = true;
                log.debug("common.Navigation:makeUserSerializable:user made serializable");
            }
        } catch (Exception e) {
            throw new Exception("common.Navigation:makeUserSerializable:ERROR:\n" + e);
        }
*/
    }

    public void setBrowser(Browser browser) {
        this.browser = browser;
    }

    public void setUser(User user) {
//        if (serializable) {
//            this.userSerializable = user;
//            log.debug("common.Navigation:setUser:serializable user set");
//        } else {
            this.user = user;
            log.debug("common.Navigation:setUser:user set");
//        }
    }

    public void setSessionObjects(HashMap sessionObjects) {
        this.sessionObjects = sessionObjects;
    }

    public Scroll getScroll(int Returns, String sessionKey)
            throws Exception {
        log.debug("coder:task:getScroll called...");
        Scroll result = null;
        try {
            if (sessionObjects.containsKey(sessionKey)) {
                result = (Scroll) sessionObjects.get(sessionKey);
            } else {
                result = new Scroll(true, 1, Returns, 0, false, false);
                sessionObjects.put(sessionKey, result);
            }
        } catch (Exception e) {
            StringBuffer msg = new StringBuffer(150);
            msg.append("Navigation.getScroll:");
            msg.append(sessionKey);
            msg.append(":ERROR:\n");
            msg.append(e.getMessage());
            throw new Exception(msg.toString());
        }
        return result;
    }

    public CoderSessionInfo getSessionInfo() {
        return info;
    }

    public void setCoderSessionInfo(CoderSessionInfo info) {
        this.info = info;
    }


}
