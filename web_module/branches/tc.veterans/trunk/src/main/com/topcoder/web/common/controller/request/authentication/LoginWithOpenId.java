/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package  com.topcoder.web.common.controller.request.authentication;

import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.net.ssl.SSLSession;
import org.openid4java.consumer.ConsumerException;
import org.openid4java.discovery.DiscoveryException;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This class is to enable TC main site capability of logging in with OpenID
 * account.
 * </p>
 * <p>
 * Generally speaking, there are two steps for OpenID-log-in: sending
 * authentication request to OpenID provider, redirecting user to login into
 * their OpenID account and verify the user's login against the OpenID provider.
 * This servlet focuses on the first step.
 * </p>
 * <p>
 * Note: virtually all operations are delegated to {@link OpenIDManager}. Refer
 * to that class for more information.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0 (Release Assembly - OpenID Project Update 1)
 * @since 1.0
 */
public class LoginWithOpenId extends BaseProcessor {
    
    /**
     * <p>
     * Represent the class name.
     * </p>
     */
    private static final String CLASS_NAME = LoginWithOpenId.class.getName();

    /**
     * <p>
     * This method will be invoked to fulfill the first step of OpenID login.
     * <p>
     */
    @Override
    protected void businessProcessing() throws Exception {
        String signature = CLASS_NAME + "#bussinessProcessing()";
        Util.logEntrance(log, signature, null, null);
        //Shortcut for already-logged-in user.
        User user = getUser();
        if(null != user && !user.isAnonymous()) {
            //Already logged in, forward to TC main site directly.
            if(log.isDebugEnabled()) {
                log.debug("Already logged in, forward to TC main site.\nExit of "
                        + signature);
            }
            setNextPage("/tc");
            setIsNextPageInContext(true);
            return;
        }
        
        /*
         * Validate user's input. Provider here expects to be among "google",
         * "yahoo" or legitimate OpenID identifier.
         */
        TCRequest request = getRequest();
        HttpSession session = request.getSession();
        
        //clear previous errors.
        session.setAttribute(Constants.OPEN_ID, null);
        String provider = request.getParameter("provider");
        if (null == provider || (provider.trim().length() == 0)) {
            /*
             * No way, at least one provider should be chosen, forward to login
             * page, indicating user must provide the open id. 
             */
            Util.addErrorToSession(session, Constants.OPEN_ID, "OpenID provider is required!");
            setNextPageToLogin();
            log.error("No provider chosen! Redirect to login page! \nExit of "
                    + signature);
            return;
        }
        
        /*
         * Without SSL properly configured. Please comment out the following
         * line when SSL is configured correctly.
         */
        trustEveryone();
        
        //Perform 1st step of OpenID Authentication.
        OpenIDManager openIDManager = getOpenIDManagerInstanceFromSpring();
        String basePath = openIDManager.getBasePath(request);
        String returnTo = basePath + "tc?" + WebConstants.MODULE_KEY + "=VerifyOpenId";
        String discoveryTarget = openIDManager.determineDiscoveryTarget(provider);
        String formRedirectionURL = "/authentication/formredirection.jsp";
        
        if(log.isDebugEnabled()) {
            log.debug("About to authenticate and redirect/forward away from " + signature);
        }

        try {
            openIDManager.authRequest(discoveryTarget, returnTo, getRequest(),
                    getResponse(), formRedirectionURL);
        } catch (DiscoveryException e) {
            log.error(e.getMessage()+". Possible due to illegitimate OpenID" +
            		" identifier.");
            Util.addErrorToSession(session, Constants.OPEN_ID, e.getMessage());
            setNextPageToLogin();
        } catch (ConsumerException e) {
            log.error(e.getMessage() + ". Possible due to illegitimate OpenID"+
                    " identifier.");
            Util.addErrorToSession(session, Constants.OPEN_ID, e.getMessage());
            setNextPageToLogin();
        } catch (Exception e) {
            log.error(e.getMessage());
            Util.addErrorToSession(session, Constants.OPEN_ID, e.getMessage());
            setNextPageToLogin();
        } finally {
            Util.logExit(log, null, signature, null);
        }
        
    }
    /**
     * <p>
     * Set nextpage to Login module.
     * </p>
     */
    private void setNextPageToLogin() {
        setNextPage("/tc?" + WebConstants.MODULE_KEY + "=Login");
        setIsNextPageInContext(false);
    }

    /**
     * Constructor of the object.
     */
    public LoginWithOpenId() {
        super();
    }
    
    /**
     * <p>
     * Get OpenIDManger from Spring Framework.
     * </p>
     * @return
     */
    private OpenIDManager getOpenIDManagerInstanceFromSpring(){
        String signature = CLASS_NAME + ".getOpenIDManagerInstanceFromSpring()";
        log.debug("Enter " + signature);
        ServletContext ctx = getRequest().getSession().getServletContext();
        WebApplicationContext applicationContext = WebApplicationContextUtils
            .getWebApplicationContext(ctx);
        log.debug("Exit " + signature);
        return (OpenIDManager)applicationContext.getBean("openIDManager");
    }

    /**
     * <p>
     * This method could be safely removed when the server maintains a valid SSL
     * certification. For now, please keep this method since VM does not have
     * SSL configured properly. Otherwise,
     * javax.net.ssl.SSLPeerUnverifiedException will be thrown complaining: peer
     * not authenticated.
     * </p>
     */
    private void trustEveryone() {
        try {
            HttpsURLConnection
                    .setDefaultHostnameVerifier(new HostnameVerifier() {
                        public boolean verify(String hostname,
                                SSLSession session) {
                            return true;
                        }
                    });
            SSLContext context = SSLContext.getInstance("TLS");
            context.init(null, new X509TrustManager[] { new X509TrustManager() {
                public void checkClientTrusted(X509Certificate[] chain,
                        String authType) throws CertificateException {
                }

                public void checkServerTrusted(X509Certificate[] chain,
                        String authType) throws CertificateException {
                }

                public X509Certificate[] getAcceptedIssuers() {
                    return new X509Certificate[0];
                }
            } }, new SecureRandom());
            HttpsURLConnection.setDefaultSSLSocketFactory(context
                    .getSocketFactory());
        } catch (Exception e) { // should never happen
            e.printStackTrace();
        }
    }
}
