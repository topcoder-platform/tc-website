/*
 * LoginProperties
 * 
 * Created Sep 26, 2008
 */
package com.topcoder.web.common.controller.request.authentication;

import java.util.concurrent.ConcurrentHashMap;

import com.topcoder.shared.util.TCResourceBundle;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class LoginProperties {
    private static final String LOGIN_FILE = "Login";
    private static ConcurrentHashMap<String, LoginProperties> contextProps = new ConcurrentHashMap<String, LoginProperties>();
    private TCResourceBundle props;
    
    protected LoginProperties(TCResourceBundle p) {
        this.props = p;
    }
    
    public static LoginProperties getProperties(String contextPath) {
        LoginProperties p = contextProps.get(contextPath);
        if (p == null) {
            p = loadBundle();
            contextProps.putIfAbsent(contextPath, p);
        }
        return p;
    }

    private static LoginProperties loadBundle() {
        return new LoginProperties(new TCResourceBundle(LOGIN_FILE));
    }
    
    public static void clear() {
        contextProps.clear();
    }
    
    public static void remove(String contextPath) {
        contextProps.remove(contextPath);
    }

    public String getEmailActivationURL() {
        return props.getProperty("EmailActivationURL");
    }

    public String getLoginPage() {
        return props.getProperty("LoginPage");
    }

    public String getLogoutLandingURL() {
        return props.getProperty("LogoutLandingURL");
    }
}
