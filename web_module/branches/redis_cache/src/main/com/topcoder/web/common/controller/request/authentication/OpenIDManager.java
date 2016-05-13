/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.controller.request.authentication;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.brickred.socialauth.AuthProvider;
import org.brickred.socialauth.AuthProviderFactory;
import org.brickred.socialauth.Profile;
import org.brickred.socialauth.SocialAuthConfig;
import org.brickred.socialauth.SocialAuthManager;
import org.brickred.socialauth.util.SocialAuthUtil;
import org.openid4java.OpenIDException;
import org.openid4java.consumer.ConsumerException;
import org.openid4java.consumer.ConsumerManager;
import org.openid4java.consumer.InMemoryConsumerAssociationStore;
import org.openid4java.consumer.InMemoryNonceVerifier;
import org.openid4java.consumer.VerificationResult;
import org.openid4java.discovery.DiscoveryException;
import org.openid4java.discovery.DiscoveryInformation;
import org.openid4java.discovery.Identifier;
import org.openid4java.message.AuthRequest;
import org.openid4java.message.AuthSuccess;
import org.openid4java.message.MessageException;
import org.openid4java.message.ParameterList;
import org.openid4java.message.ax.AxMessage;
import org.openid4java.message.ax.FetchRequest;
import org.openid4java.message.ax.FetchResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.Constants;

/**
 * <p>
 * This class is the core component, which is responsible for authenticating
 * with OpenID provider.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 */
public class OpenIDManager {

    /**
     * <p>
     * Instantiate a logger.
     * </p>
     */
    private Logger logger = Logger.getLogger(OpenIDManager.class);
    
    /**
     * <p>
     * Represent the name of this class.
     * </p>
     */
    private static final String CLASS_NAME = OpenIDManager.class.getName();

    /**
     * <p>
     * The key to store verification result instance into session.
     * </p>
     */
    public static final String VERIFICATION_RESULT_KEY = 
           "OPEN_ID_VERIFICATION_RESULT";

    /**
     * <p>
     * Authentication manager.
     * </p>
     */
    private ConsumerManager manager;

    /**
     * <p>
     * Endpoint for Yandis discovery process for Google.
     * </p>
     */
    public static final String GOOGLE_DISCOVERY_TARGET = "https://www.google.com/accounts/o8/id";
    
    /**
     * <p>
     * Endpoint for Yandis discovery process for Yahoo.
     * </p>
     */
    public static final String YAHOO_DISCOVERY_TARGET = "yahoo.com";
    
    /**
     * <p>
     * Endpoint for OAuth discovery process for Facebook.
     * </p>
     */
    public static final String FACEBOOK_DISCOVERY_TARGET = "facebook.com";
    
    /**
     * <p>
     * Endpoint for OAuth discovery process for MySpace.
     * </p>
     */
    public static final String MYSPACE_DISCOVERY_TARGET = "myspace.com";

    /**
     * <p>
     *  This method is to return proper discovery target according provider's 
     *  name.
     * </p>
     * @param provider
     *            provider's name or the real target.
     *            This parameter should never be null or empty.
     *            
     * @param username
     *            Some discovery targets, say myspace, take username as part of discovery
     *            target, so this parameter is for this issue. It could be
     *            null for those free of this issue like google and yahoo.
     *            
     * @return the discovery target for that provider.
     */
    public String determineDiscoveryTarget(String provider) {
        String signature = CLASS_NAME + "#determineDiscoveryTarget()";
        
        if(logger.isDebugEnabled()) {
            logger.debug("Entrance of " + signature + " with parameter: provider "
                    + provider);
        }

        provider = provider.trim().toLowerCase();
        if ("google".equals(provider)) {
            return GOOGLE_DISCOVERY_TARGET;
        } else if ("yahoo".equals(provider)) {
            return YAHOO_DISCOVERY_TARGET;
        } else if ("facebook".equals(provider)) {
            return FACEBOOK_DISCOVERY_TARGET;
        } else if ("myspace".equals(provider)) {
            return MYSPACE_DISCOVERY_TARGET;
        }
        
        if(logger.isDebugEnabled()) {
            logger.debug("Exit of " + signature + "with return:" + provider);
        }
        
        // Now assume user inputs a third and legal openId provider.
        return provider;
    }
    
    /**
     * <p>
     * This class is a helper method, returning the base path of the web app.
     * </p>
     * @param request
     * @return base path of the app.
     */
    public String getBasePath(HttpServletRequest request) {
        String signature = CLASS_NAME + "#getBasePath(request:" + request + ")"; 
        
        if(logger.isDebugEnabled()) {
            logger.debug("Entry of " + signature);
        }
        
        String path = request.getContextPath();
        String basePath = "";
        
        if(request.getServerPort() != 80) {
            basePath = request.getScheme()+"://"+request.getServerName()+
                ":"+request.getServerPort()+path+"/";
        } else {
            basePath = request.getScheme()+"://"+request.getServerName()+ path+"/";
        }
        
        if(logger.isDebugEnabled()) {
            logger.debug("Exit of " + signature + " with return: " + basePath);
        }
        
        return basePath;
    }

    /**
     * <p>
     * Default constructor. Do nothing but routine stuffs.
     * </p>
     */
    public OpenIDManager() {
        super();
    }

    /**
     * <p>
     * This method takes advantage of the underlying ConsuerManager instance to
     * communicate with an OpenID Provider (Server).
     * </p>
     * <p>
     * Note: Due to "The Consumer site needs to have the same instance of this
     * class throughout the life cycle of a OpenID authentication session" from
     * ConsumerManager's API documentation, the <code>ConsumerManager</code>
     * instance is shared in the whole process of authentication. As a result,
     * this program first tries to retrieve the instance from application. If
     * there indeed isn't one, indicating this the very first time to
     * authenticate, it will then create a <code>ConsumerManager</code> instance
     * and save it to application.
     * </p>
     * <p>
     * the return_to URL is where your application will receive the
     * authentication responses from the OpenID provider.
     * </p>
     * 
     * @param userSuppliedString
     *            the OP endpoint
     * @param returnTo
     *            our site entry which is used to receive response from OP.
     * @param request
     *            {@link HttpServletRequest} instance.
     * @param reponse
     *            {@link HttpServletResponse} instance.
     * @param formRedirectionLocation
     *            location of formRedirection page. It could be null since
     *            OpenID version 2 does not need it.
     * @param realm
     *             Location of XDRS document for OP to verify the current site
     *             is a Relying Part instead of proxy-attack.
     * @throws DiscoveryException
     *             if the userSuppliedString is not valid or Internet is NOT
     *             available.
     * @throws MessageException
     *             refer {@link ConsumerManager} for more info.
     * @throws ConsumerException
     *             Thrown if {@link ConsumerManager} encounters any problem
     *             while performing authentication.
     * @throws ServletException
     *             basic Servlet error.
     * @throws IOException
     *             IO error.
     */
    @SuppressWarnings("unchecked")
    public void authRequest(String userSuppliedString, String returnTo,
            HttpServletRequest request, HttpServletResponse response,
            String formRedirectionLocation)
            throws DiscoveryException, MessageException, ConsumerException,
            ServletException, IOException {
        String signature = CLASS_NAME + ".authRequest()";
        
        logEntrance(signature, new String[]{"userSuppliedString", "returnTo", "request", "response"}, 
                new Object[]{userSuppliedString, returnTo, request, response});
        
        //process Facebook differently
        try {
            /*
             * For Myspace and Facebook, use OAuth authentication to enhance
             * usability.
             */
            if(FACEBOOK_DISCOVERY_TARGET.equals(userSuppliedString)||
                    MYSPACE_DISCOVERY_TARGET.equals(userSuppliedString)) {
                
                InputStream in = OpenIDManager.class.getClassLoader()
                    .getResourceAsStream("oauth_consumer.properties");
                
                SocialAuthConfig conf = SocialAuthConfig.getDefault();
                conf.load(in);
                
                SocialAuthManager authManager = new SocialAuthManager();
                authManager.setSocialAuthConfig(conf);
                request.getSession().setAttribute("socialauthManager", authManager);
                
                String url = null;
                AuthProvider provider = null;
                if (userSuppliedString.equals(FACEBOOK_DISCOVERY_TARGET)) {
                    url = authManager.getAuthenticationUrl("facebook", returnTo);
                    provider = AuthProviderFactory.getInstance("facebook");
                } else if(MYSPACE_DISCOVERY_TARGET.equals(userSuppliedString)) {
                    url = authManager.getAuthenticationUrl("myspace", returnTo);
                    provider = AuthProviderFactory.getInstance("myspace");
                }
                
                request.getSession().setAttribute("provider", provider);
                response.sendRedirect(url);
                return;
            }
        } catch (Exception e) {
            Util.addErrorToSession(request.getSession(), Constants.OPEN_ID, e.getMessage());
            logger.error(e.getMessage());
        }
        
        //For the rest of the OpenID Providers
        manager = (ConsumerManager) request.getSession().getServletContext()
                .getAttribute("open_id_consumer_manager");
        if (null == manager) {
            manager = new ConsumerManager();
            // use checkid_setup
            manager.setImmediateAuth(false);

            manager.setAssociations(new InMemoryConsumerAssociationStore());
            manager.setNonceVerifier(new InMemoryNonceVerifier(5000));
            
            /*
             * Enforce realm verifier when this solution is deployed onto a
             * server with a public domain.
             */
            manager.getRealmVerifier().setEnforceRpId(false);

            // store it to application.
            request.getSession().getServletContext().setAttribute(
                    "open_id_consumer_manager", manager);
            
        }
        // perform discovery on the user-supplied identifier
        List<DiscoveryInformation> discoveries = manager
                .discover(userSuppliedString);
        // attempt to associate with the OpenID provider
        // and retrieve one service endpoint for authentication
        DiscoveryInformation discovered = manager.associate(discoveries);
        // store the discovery information in the user's session
        request.getSession().setAttribute("openid-disc", discovered);

        // obtain a AuthRequest message to be sent to the OpenID provider
        AuthRequest authReq = manager.authenticate(discovered, returnTo);

        // Attribute Exchange: fetching the email, first name,
        // middleName, last name.
        FetchRequest fetch = FetchRequest.createFetchRequest();

        if (GOOGLE_DISCOVERY_TARGET.equals(userSuppliedString)) {
            fetch.addAttribute("email",
                  "http://schema.openid.net/contact/email", true);
        } else {
            fetch.addAttribute("email", "http://axschema.org/contact/email",
                    true);
        }
        // Name
        fetch.addAttribute("firstname", "http://axschema.org/namePerson/first",
                true);
        fetch.addAttribute("lastname", "http://axschema.org/namePerson/last",
                true);
        fetch.addAttribute("middle", "http://axschema.org/namePerson/middle",
                true);
        // attach the extension to the authentication request
        authReq.addExtension(fetch);
        if (!discovered.isVersion2()) {
            // Option 1: GET HTTP-redirect to the OpenID Provider endpoint
            // The only method supported in OpenID 1.x
            // redirect-URL usually limited ~2048 bytes
            if(logger.isDebugEnabled()) {
                logger.debug("Discovered target supports OpenID 1.x only.");
            }
            
            response.sendRedirect(authReq.getDestinationUrl(true));
        } else {
            // Option 2: HTML FORM Redirection (Allows payloads >2048 bytes)
            
            if(null == formRedirectionLocation || 
                    (formRedirectionLocation.trim().length() == 0)){
                logger.error("OpenID version 2 NOT supported, but form redirection" +
                		" location is not specified.");
                throw new IllegalArgumentException("You need to specifiy the " +
                		"formRedirectionLocation since your openID provider" +
                		" does not support OpenID version 2");
            }
            
            formRedirectionLocation = formRedirectionLocation.trim();
            if(!formRedirectionLocation.startsWith("/")) {
                formRedirectionLocation = "/" + formRedirectionLocation;
            }
            
            request.setAttribute("parameterMap", authReq.getParameterMap());
            request.setAttribute("message", authReq);
            request.setAttribute("destinationUrl", authReq
                    .getDestinationUrl(false));
            
            if(logger.isDebugEnabled()) {
                logger.debug("OpenID 2.0 is supported by the endpoint and now a "
                        + "redirectform is used to submit request.");
            }
            request.getSession().getServletContext().getRequestDispatcher(
                    formRedirectionLocation).forward(request, response);
        }
        Util.logExit(logger, null, signature, null);
    }

    /**
     * <p>
     * Processing the authentication response and store the retrieved
     * information into ResponseVerificationResult instance, as will be
     * returned.
     * </p>
     * <p>
     * There might be multiple value for each attribute, it suffice to take the
     * default one.
     * </p>
     * 
     * <p>
     * Note: This method first checks if user is using Facebook to authenticate.
     * And process this scenario in priority.
     * </p>
     * 
     * @param request
     *            {@link HttpServletRequest} instance.
     * @param response
     *            {@link HttpServletResponse} instance.
     * @return {@link ResponseVerificationResult} instance,not null, containing
     *         retrieved information like email, first name, middle name and
     *         last name as well as possible errors.
     */
    public ResponseVerificationResult verifyResponse(
            HttpServletRequest request, HttpServletResponse response) {
        
        String signature = CLASS_NAME + ".verifyResponse()";
        
        logEntrance(signature, new String[]{"request", "response"},
                new Object[]{request, response});
        
        ResponseVerificationResult result = new ResponseVerificationResult();
        HttpSession session = request.getSession();
        SocialAuthManager authManager = (SocialAuthManager)session.getAttribute("socialauthManager");
        
        if(null != authManager) {
            try {
                AuthProvider provider = authManager.connect(SocialAuthUtil
                        .getRequestParametersMap(request));
                if(null != provider) {
                    Profile profile = provider.getUserProfile();
                    // no middle Name and openId is available
                    // http://graph.facebook.com/validatedId
                    result.setFirstName(profile.getFirstName());
                    result.setLastName(profile.getLastName());
                    result.setEmail(profile.getEmail());
                    
                    String providerId = profile.getProviderId();
                    
                    if("facebook".equals(providerId)) {
                        result.setOpenId("http://graph.facebook.com/" + profile.getValidatedId());
                    } else if("myspace".equals(providerId)) {
                        result.setOpenId("http://myspace.com/" + profile.getValidatedId());
                    }
                } else {
                    result.setErrorMessage("Socialauth provider is null!");
                }
                
                logExit(signature, result);
                return result;
            } catch (Exception e) {
                logger.error(e.getMessage());
            } finally {
                //reset this value to null in case a user tried to authenticate
                //with other open id provider later.
                session.setAttribute("socialauthManager", null);
            }
            
        }

        manager = (ConsumerManager) request.getSession().getServletContext()
                .getAttribute("open_id_consumer_manager");
        if (null == manager) {
            logger.error("There should have been one ConsumerManager "
                    + "instance since this the second step of OpenID");
            result.setErrorMessage("ConsumerManger is null which should NOT "
                    + "happen normally");
        }

        try {
            // extract the parameters from the authentication response
            // (which comes in as a HTTP request from the OpenID provider)
            ParameterList authResponse = new ParameterList(request
                    .getParameterMap());
            // retrieve the previously stored discovery information
            DiscoveryInformation discovered = (DiscoveryInformation) request
                    .getSession().getAttribute("openid-disc");
            // extract the receiving URL from the HTTP request
            StringBuffer receivingURL = request.getRequestURL();

            String queryString = request.getQueryString();

            if (queryString != null && queryString.length() > 0)
                receivingURL.append("?").append(request.getQueryString());

            /*
             * verify the response; ConsumerManager needs to be the same
             * (static) instance used to perform the authentication request
             */
            VerificationResult verification = manager.verify(receivingURL
                    .toString(), authResponse, discovered);
            /*
             * Identifier on which authentication and verification were
             * performed successfully and which can be used henceforth by Relying
             * Parties to identify the user.
             * Null if authentication or verification on the claimed identifier
             * failed.
             */
            Identifier identifier = verification.getVerifiedId();
            if(null == identifier) {
                String errorMsg = "Claimed identifier failed, meaning someone is phishing!";
                result.setErrorMessage(errorMsg);
                result.setErrorMessage(result.getErrorMessage() == null ? errorMsg
                                : result.getErrorMessage() + errorMsg);
            }
            
            AuthSuccess authSuccess = (AuthSuccess) verification
                    .getAuthResponse();
            // Now retrieve possibly useful information.
            if (null != authSuccess
                    && authSuccess.hasExtension(AxMessage.OPENID_NS_AX)) {

                FetchResponse fetchResp = (FetchResponse) authSuccess
                        .getExtension(AxMessage.OPENID_NS_AX);
                result.setEmail(fetchResp.getAttributeValue("email"));
                result.setLastName(fetchResp.getAttributeValue("lastname"));
                result.setFirstName(fetchResp.getAttributeValue("firstname"));
                result.setMiddleName(fetchResp.getAttributeValue("middle"));

                if (null != identifier) {
                    result.setOpenId(identifier.getIdentifier());
                }
            }
            if(logger.isDebugEnabled()) {
                logger.debug("Verification Passes.");
            }
        } catch (OpenIDException e) {
            logger.error("Verification Fails!");
            String previousErrorMessage = result.getErrorMessage();
            result.setErrorMessage(previousErrorMessage == null ? e
                    .getMessage() : previousErrorMessage + e.getMessage());
        }

        logExit(signature, result);
        return result;
    }
    
    /**
     * <p>
     * Log exiting of a method.
     * </p>
     * @param signature
     * @param ret
     */
    private void logExit(String signature, Object ret) {
        if(logger.isDebugEnabled()) {
            logger.debug("Exiting " + signature + ", returnig " + ret);
        }
    }
    /**
     * <p>
     * Log entrance of a method and parameter values.
     * </p>
     * @param signature
     * @param paramNames
     * @param paramValues
     */
    private void logEntrance(String signature, String[] paramNames, Object[] paramValues) {
        if(logger.isDebugEnabled()) {
            if(null == paramNames || paramNames.length != paramValues.length
                    ||paramNames.length == 0) {
                logger.debug("Entering: " + signature);
            } else {
                StringBuffer sb = new StringBuffer();
                sb.append("Entering: ").append(signature).append(", with parameters = [");
                for(int i=0; i<paramNames.length-1; i++) {
                    sb.append(paramNames[i]).append(":").append(paramValues[i]).append(", ");
                }
                sb.append(paramNames[paramNames.length-1]).append(":")
                    .append(paramValues[paramValues.length-1]).append("]");
            }
        }
        
    }
}
