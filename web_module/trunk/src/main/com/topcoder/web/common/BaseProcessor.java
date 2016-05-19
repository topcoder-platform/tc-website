package com.topcoder.web.common;

import com.topcoder.shared.security.User;
import com.topcoder.shared.util.TCException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.cache.CacheClient;
import com.topcoder.web.common.cache.CacheClientFactory;
import com.topcoder.web.common.cache.TCCacheException;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPattern;
import com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig
    .CONTEXT_ATTR_PATTERN_IMPL;
import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig
    .SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES;
import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig
    .SESSION_ATTR_OPERATION_TYPE_TOKENS;
import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig
    .SUPPORTED_OPERATION_TYPES;

public abstract class BaseProcessor implements RequestProcessor {

    protected static final Logger log = Logger.getLogger(BaseProcessor.class);
    /* set by the creator */
    private TCRequest request;
    private TCResponse response;
    private WebAuthentication auth;

    private InitialContext ctx;
    protected HashMap errors;
    protected HashMap defaults;

    protected User user;

    public static final String ERRORS_KEY = "processor_errors";
    public static final String DEFAULTS_KEY = "processor_defaults";

    /* return values */
    private String nextPage = "";
    private boolean nextPageInContext = false;

    public BaseProcessor() {
        //log.debug("constructing " + this.getClass().getName());
        errors = new HashMap();
        defaults = new HashMap();
    }

    public void setRequest(TCRequest request) {
        this.request = request;
    }

    public void setResponse(TCResponse response) {
        this.response = response;
    }

    public void setAuthentication(WebAuthentication auth) {
        this.auth = auth;
    }

    /**
     * Return the identified user.  We do it here so that we can
     * "cache" the user for the life of the processor and not
     * continuously retrieve it.  subclasses may override this
     * to demand a login this session etc.
     *
     * @return the user
     */
    protected User getUser() {
        if (user == null)
            user = auth.getActiveUser();
        return user;
    }

    protected User getLoggedInUser() {
        return auth.getUser();
    }

    /**
     * Some things we want to do for most subclassed request processors.
     * Override this to disable auth setup and adding default beans.
     */
    protected void baseProcessing() throws TCWebException {
        getRequest().setAttribute(ERRORS_KEY, errors);
        getRequest().setAttribute(DEFAULTS_KEY, defaults);
/*
        if (log.isDebugEnabled()) {
            log.debug("session id: " + getRequest().getSession().getId());
        }
*/
    }

    /**
     * Subclasses should do their work by implementing this method.
     */
    abstract protected void businessProcessing() throws Exception;

    /**
     * This is final to discourage overriding it.  Instead subclasses should implement businessProcessing().
     */
    public final void process() throws Exception {
        try {
            baseProcessing();
            //log.debug("calling businessProcessing");
            try {
                businessProcessing();
            } catch (TCException e) {
                throw e;
            } catch (Exception e) {
                e.printStackTrace();
                throw new TCException(e);
            }
        } finally {
            close(ctx);
        }
    }

    public String getNextPage() {
        return nextPage;
    }

    public boolean isNextPageInContext() {
        return nextPageInContext;
    }

    /**
     * Call this to let the controller know where to go next.
     * An empty string is magical, and means the same servlet with an empty query.
     */
    protected void setNextPage(String page) {
        if (page == null || page.equals(""))
            page = request.getContextPath() + request.getServletPath();
        nextPage = page;
    }

    /**
     * False if a redirect is necessary, ie you need the URL
     * in the browser to change.  True otherwise.
     */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }

    /**
     * Returns true iff the user has an active logged in session.
     *
     * @return boolean
     */
    protected boolean userLoggedIn() {
        return !auth.getActiveUser().isAnonymous();
    }

    /**
     * Returns true iff we can identify the user.  Basically, if the user
     * has a cookie, or an active logged in session.
     *
     * @return boolean
     */
    protected boolean userIdentified() {
        return !auth.getActiveUser().isAnonymous();
    }

    protected InitialContext getInitialContext() throws NamingException {
        if (ctx == null) {
            ctx = new InitialContext();
        }
        return ctx;
    }

    protected void addError(String key, Object error) {
        if (log.isDebugEnabled()) {
            log.debug("adding error on " + key + " " + error.toString());
        }
        ArrayList errs = (ArrayList) errors.get(key);
        if (errs == null) {
            errs = new ArrayList();
            errors.put(key, errs);
        }
        errs.add(error);
    }

    public Object getError(String key) {
        if (errors.containsKey(key) && errors.get(key) != null) {
            return errors.get(key);
        }
        return "";
    }

    public boolean hasError(String key) {
        return errors.containsKey(key);
    }

    protected void removeError(String key) {
        if (log.isDebugEnabled()) {
            log.debug("removing error on " + key);
        }
        if (hasError(key)) {
            errors.remove(key);
        }
    }

    protected void clearErrors() {
        errors.clear();
    }

    protected boolean hasErrors() {
        if (log.isDebugEnabled()) {
            log.debug(errors.size() + " errors found\n" + errors.keySet());
        }
        return !errors.isEmpty();
    }

    protected void setDefault(String key, Object o) {
        if (log.isDebugEnabled()) {
            log.debug("setting " + key + " to " + o);
        }
        defaults.put(key, o);
    }

    /* some utility methods */
    protected boolean isEmpty(String s) {
        return !(s != null && s.trim().length() > 0);
    }

    protected String checkNull(String s) {
        return s == null ? "" : s;
    }

    protected WebAuthentication getAuthentication() {
        return auth;
    }

    protected TCRequest getRequest() {
        return request;
    }

    protected TCResponse getResponse() {
        return response;
    }

    protected boolean hasParameter(String param) {
        return !"".equals(StringUtils.checkNull(getRequest().getParameter(param)));
    }

    protected String getTrimmedParameter(String param) {
        return StringUtils.getTrimmedParameter(getRequest(), param);
    }
    
    protected String getEscapedParameter(String param) {
        return StringUtils.htmlEncode(param);
    }


    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param ctx         the IntialContext to use on the lookup
     * @param remoteclass The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception       if something goes wrong when creating or calling
     *                         the method on the ejb.
     */
    public static Object createEJB(InitialContext ctx, Class remoteclass) throws NamingException, Exception {
        Object remotehome = ctx.lookup(remoteclass.getName() + "Home");
        Method createmethod = PortableRemoteObject.narrow(remotehome,
                remotehome.getClass()).getClass().getMethod("create", null);
        return createmethod.invoke(remotehome, null);
    }

    /**
     * Get a local instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param ctx the IntialContext to use on the lookup
     * @param c   The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception       if something goes wrong when creating or calling
     *                         the method on the ejb.
     */
    public static Object createLocalEJB(InitialContext ctx, Class c) throws NamingException, Exception {
        Object home = ctx.lookup("java:/" + c.getName() + "LocalHome");
        Method createmethod = PortableRemoteObject.narrow(home,
                home.getClass()).getClass().getMethod("create", null);
        return createmethod.invoke(home, null);
    }

    public static void close(Context ctx) {
        if (ctx != null) {
            try {
                ctx.close();
            } catch (Exception e) {
                log.error("couldn't close context");
            }
        }
    }

    protected SessionInfo getSessionInfo() {
        return (SessionInfo) getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
    }


    /**
     * This method is left empty here.  By default, we don't
     * need to do anything.  But subclasses may want to provide an implementation.
     *
     * @throws Exception
     */
    public void postProcessing() throws Exception {

    }

    /**
     * This method is left empty here.  By default, we don't
     * need to do anything.  But subclasses may want to provide an implementation.
     */
    public void rollback() {
 
    }

    /**
     * <p>Checks if synchronizer patterns are set for current session. If not then new ones are generated and saved both
     * to current session and cache.</p>
     * 
     * @throws TCCacheException if an unexpected error occurs.
     */
    protected void setSynchronizerTokens() throws TCCacheException {
        HttpSession session = getRequest().getSession();
        
        // Check if tokens are already bound to current session
        boolean noSynchronizerTokensSet = (session.getAttribute(SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES) == null
            || session.getAttribute(SESSION_ATTR_OPERATION_TYPE_TOKENS) == null);

        log.debug("noSynchronizerTokensSet = " + noSynchronizerTokensSet);

        // If not then obtain then from cache or generate new ones if there are no tokens in cache 
        if (noSynchronizerTokensSet) {
            final long currentUserId = getLoggedInUser().getId();
            final String cacheKey1 = SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES + "_" + currentUserId;
            final String cacheKey2 = SESSION_ATTR_OPERATION_TYPE_TOKENS + "_" + currentUserId;

            // Check if tokens are already in cache
            CacheClient cacheClient = CacheClientFactory.create();
            Map<String, String> parameterNames = (Map<String, String>) cacheClient.get(cacheKey1);
            Map<String, String> operationTypeTokens = (Map<String, String>) cacheClient.get(cacheKey2);
            
            // If not then generate new one and put them to cache
            boolean needToGenerate = (parameterNames == null) || (operationTypeTokens == null);
            log.debug("needToGenerateTokens = " + needToGenerate);
            if (needToGenerate) {
                SynchronizerTokenPattern synchronizerTokenPattern
                    = (SynchronizerTokenPattern) session.getServletContext().getAttribute(CONTEXT_ATTR_PATTERN_IMPL);

                // For each of the "protected" operation types define the name of the request parameter which will carry the
                // synchronizer token for all requests in context of this session and a synchronizer token to be used for all
                // such requests
                parameterNames = new HashMap<String, String>();
                operationTypeTokens = new HashMap<String, String>();
                for (String operationType : SUPPORTED_OPERATION_TYPES) {
                    parameterNames.put(operationType, synchronizerTokenPattern.generateParameterName());
                    operationTypeTokens.put(operationType, synchronizerTokenPattern.generateToken());
                }

                cacheClient.set(cacheKey1, parameterNames);
                cacheClient.set(cacheKey2, operationTypeTokens);
            }

            session.setAttribute(SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES, parameterNames);
            session.setAttribute(SESSION_ATTR_OPERATION_TYPE_TOKENS, operationTypeTokens);
        }
    }

    /**
     * <p>Verifies that the current request does not represent a potential CSRF attack. Checks if request follows the
     * <code>Synchronizer Token Pattern</code> and provides appropriate synchronizer token which is valid for current
     * session and requested type of operation.</p>
     * 
     * @param operationType a <code>String</code> specifying the type of "protected" operation mapped to current
     *        request.
     * @throws TCException if request presents a potential CSRF attack. 
     * @throws IllegalStateException if there is no active session.       
     */
    protected void preventCSRFAttack(String operationType) throws TCException {
        HttpSession session = getRequest().getSession(false);
        if (session == null) {
            throw new IllegalStateException("There is no active session");
        } else {
            setSynchronizerTokens();
            TCRequest request = getRequest();
            if (SynchronizerTokenPatternConfig.checkReferrer()) {
                String referrer = request.getHeader("Referer");
                if (referrer != null) {
                    String referrerCut = removeProtocol(referrer);
                    String expectedReferrer = request.getServerName() +
                        (request.getServerPort() == 80 ? "" : ":" + request.getServerPort()) + "/";
                    if (!referrerCut.startsWith(expectedReferrer)) {
                        handlePotentialCSRFAttack("Wrong 'Referer' header: " + referrer, operationType);
                    }
                }
            }
            if (SynchronizerTokenPatternConfig.checkOrigin()) {
                String origin = request.getHeader("Origin");
                if (origin != null) {
                    String originCut = removeProtocol(origin);
                    String expectedOrigin = request.getServerName() +
                        (request.getServerPort() == 80 ? "" : ":" + request.getServerPort());
                    if (!originCut.equals(expectedOrigin)) {
                        handlePotentialCSRFAttack("Wrong 'Origin' header: " + origin, operationType);
                    }
                }
            }

            ServletContext servletContext = session.getServletContext();
            SynchronizerTokenPattern synchronizerTokenPattern
                = (SynchronizerTokenPattern) servletContext.getAttribute(CONTEXT_ATTR_PATTERN_IMPL);
            boolean valid = synchronizerTokenPattern.validateSynchronizerToken(getRequest(), operationType);
            if (!valid) {
                handlePotentialCSRFAttack("Wrong synchronizer token", operationType);
            }
        }
    }

    /**
     * <p>Handles the case when potential CSRF attack is detected. Logs the details on current request and invalidates
     * the current session.</p>
     * 
     * @param details a <code>String</code> providing the details.
     * @param operationType a <code>String</code> specifying the type of "protected" operation mapped to current
     *        request.
     * @throws TCException always.
     */
    private void handlePotentialCSRFAttack(String details, String operationType) throws TCException {
        TCRequest request = getRequest();
        StringBuilder requestDetails = new StringBuilder();
        
        requestDetails.append("\n");
        requestDetails.append("METHOD: ").append(request.getMethod()).append("\n");
        requestDetails.append("URL: ").append(request.getRequestURL()).append("\n");
        requestDetails.append("Remote User: ").append(request.getRemoteUser()).append("\n");
        requestDetails.append("Remote Host: ").append(request.getRemoteHost()).append("\n");
        requestDetails.append("Remote Port: ").append(request.getRemotePort()).append("\n");
        requestDetails.append("Remote Addr: ").append(request.getRemoteAddr()).append("\n");
        Enumeration headerNames = request.getHeaderNames();
        if (headerNames != null) {
            requestDetails.append("HEADERS: ").append("\n");
            while (headerNames.hasMoreElements()) {
                String headerName = (String) headerNames.nextElement();
                if (!"cookie".equalsIgnoreCase(headerName)) {
                    requestDetails.append("    ").append(headerName).append(": ").append(request.getHeader(headerName)).append("\n");
                }
            }
        } 
        
        Enumeration parameterNames = request.getParameterNames();
        if (parameterNames != null) {
            requestDetails.append("PARAMETERS: ").append("\n");
            while (parameterNames.hasMoreElements()) {
                String paramName = (String) parameterNames.nextElement();
                requestDetails.append("    ").append(paramName).append(": ").append(request.getParameter(
                    paramName)).append("\n");
            }
        }

        log.error("Potential CSRF attack detected for " + operationType + " operation. Details: " + details
            + ". Request: " + requestDetails);
        
        HttpSession session = getRequest().getSession(false);
        session.invalidate();
        
        throw new TCException("Invalid request. Potential CSRF attack.");
    }

    /**
     * <p>Removes the protocol from the specified URL.</p>
     * 
     * @param url a <code>String</code> providing the URL to remove protocol from.
     * @return a <code>String</code> providing the specified URL with removed protocol.
     */
    private static String removeProtocol(String url) {
        int pos = url.indexOf("://");
        if (pos >= 0) {
            return url.substring(pos + 3);
        } else {
            return url;
        }
    }
}

