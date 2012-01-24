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
import javax.net.ssl.SSLSession;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
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
 * This Servlet focuses on the second step.
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
public class VerifyOpenId extends BaseProcessor {
    
    /**
     * <p>
     * Represent the qualified name of this class.
     * </p>
     */
    private static final String CLASS_NAME = VerifyOpenId.class.getName();
    
    /**
     * <p>
     * This method is dedicated to the second step of OpenID
     * Authentication:verify the response from open id provider.
     * <p>
     */
    @Override
    protected void businessProcessing() throws Exception {
        String signature = CLASS_NAME + ".businessProcessing()";
        Util.logEntrance(log, signature, null, null);
        
        TCRequest request = getRequest();
        TCResponse response = getResponse();
        HttpSession session = request.getSession();
        User user = getUser();
        //Shortcut for those who have already logged in.
        if(null != user && !(user.isAnonymous())){
            /*
             * Already logged in, redirect to user's "nextpage" or TC main site if
             * "nextpage" is not found.
             */
            String nextPage = request.getParameter("nextpage");
            nextPage = (nextPage==null)?"/tc":nextPage.trim();
            setNextPage(nextPage);
            setIsNextPageInContext(false);
            return;
        }
        
        /*
         * Without SSL properly configured. 
         * Please comment out the following line if SSL has been configured correctly.
         */
        trustEveryone();
        
        //Now is to verify, starting with grab OpenIDManager instance from Spring
        OpenIDManager openIDManager = getOpenIDManagerFromSpring(getRequest());
        final ResponseVerificationResult result = openIDManager.verifyResponse(
                request, response);
        
        if(result.getErrorMessage() == null) {
            //look up in database.
            RequestProcessor rp = new ShortHibernateProcessor() {
                @Override
                protected void dbProcessing() throws Exception {
                    com.topcoder.web.common.model.User userModel = 
                        DAOUtil.getFactory().getUserDAO().getUserByOpenId(result.getOpenId());
                    if(null == userModel) {
//This line is reserved for review, to print out identifier.
System.out.println(result.getOpenId());
                        /*
                         * New user who needs to be redirected to registration page that
                         * could access info stored in result; OR Existing user who has
                         * NOT associated his openid with his current TC account.
                         */
                        setNextPage("/reg");
                        setIsNextPageInContext(false);
                        return;
                    } else {
                        // add login cookie
                        new OpenIDAuthentication(new SessionPersistor(getRequest()
                                .getSession()), getRequest(), getResponse()).setLoginCookies(
                                userModel.getId(), true);
                        
                        //Get nextPage from request parameter
                        String nextPage = getRequest().getParameter("nextpage");
                        nextPage = (nextPage == null)?null:nextPage.trim();
                        setNextPage(nextPage);
                        setIsNextPageInContext(false);
                        return;
                    }
                }
            };
            rp.setRequest(request);
            rp.setResponse(response);
            rp.setAuthentication(getAuthentication());
            rp.process();
            rp.postProcessing();
            
            setNextPage(rp.getNextPage());
            setIsNextPageInContext(rp.isNextPageInContext());
            Util.logExit(log, null, signature, null);
        } else {
            
            Util.addErrorToSession(session, Constants.OPEN_ID,
                    "Error detected and OpenID authentication fails!"
                    + result.getErrorMessage());
            
            setNextPageToLogin();
            //redirect user to login page with error info.
            String info = "Unable to authenticate against OpenID!";
            Util.logExit(log, info, signature, null);
        }
    }
    
    /**
     * <p>
     * Set nextpage to Login module using redirect style.
     * </p>
     */
    private void setNextPageToLogin() {
        setNextPage("/tc?" + WebConstants.MODULE_KEY + "=Login");
        setIsNextPageInContext(false);
    }

    /**
     * <p>
     * Empty constructor.
     * </p>
     */
    public VerifyOpenId() {
        super();
    }
    
    /**
     * <p>
     * Get openIDManager instance from Spring context.
     * </p>
     * 
     * @return OpenIDManager instance managed by Spring.
     */
    private OpenIDManager getOpenIDManagerFromSpring(HttpServletRequest request) {
        ServletContext servletContext = request.getSession().getServletContext();
        WebApplicationContext ctx = WebApplicationContextUtils
            .getWebApplicationContext(servletContext);
        return (OpenIDManager)ctx.getBean("openIDManager");
    }
    
    /**
     * <p>
     * Private inner class to assist adding cookies.
     * </p>
     * @author TCSASSEMBLER
     * @version 1.0
     */
    private static final class OpenIDAuthentication extends BasicAuthentication {
        
        /**
         * <p>
         * Represent the qualified name of this class.
         * </p>
         */
        private static final String QUALIFIED_NAME = OpenIDAuthentication.class.getName();

        /**
         * <p>
         * Constructor, mainly to initialize parent class.
         * </p>
         * @param userPersistor
         * @param request
         * @param response
         * @throws Exception
         */
        public OpenIDAuthentication(Persistor userPersistor, TCRequest request,
                TCResponse response) throws Exception {
            super(userPersistor, request, response);
        }

        /**
         * <p>
         * Override to make this method accessible.
         * <p>
         */
        @Override
        public void setLoginCookies(long uid, boolean rememberUser)
                throws Exception {
            String signature = QUALIFIED_NAME + ".setLoginCookies(long uid,"
                    + " boolean rememberUser)";
            Util.logEntrance(log, signature, new String[]{"uid","rememberUser"}, 
                    new Object[]{uid, rememberUser});
            super.setLoginCookies(uid, rememberUser);
            Util.logExit(log, null, signature, null);
        }
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


