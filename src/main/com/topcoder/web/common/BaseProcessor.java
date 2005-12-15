package com.topcoder.web.common;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;
import com.topcoder.shared.util.TCException;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;

public abstract class BaseProcessor implements RequestProcessor {

    protected static Logger log = Logger.getLogger(BaseProcessor.class);
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
        log.debug("constructing " + this.getClass().getName());
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

    /**
     * call this to send the browser a new cookie when the user updates their password;
     * probably ought to use auth.login() instead
     */
    protected void reissueCookie(Resource r) {
        try {
            ((BasicAuthentication) auth).setCookie(getUser().getId(), false);
        } catch (Exception e) {
            /* this should not happen, but is not a big deal if it does... they just have to login again later */
            log.warn("caught exception reissuing cookie", e);
        }
    }

    /**
     * Some things we want to do for most subclassed request processors.
     * Override this to disable auth setup and adding default beans.
     */
    protected void baseProcessing() throws TCWebException {
        getRequest().setAttribute(ERRORS_KEY, errors);
        getRequest().setAttribute(DEFAULTS_KEY, defaults);
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

    /** False if a redirect is necessary, ie you need the URL
     * in the browser to change.  True otherwise.
     */
    protected void setIsNextPageInContext(boolean flag) {
        nextPageInContext = flag;
    }

    /**
     * Returns true iff the user has an active logged in session.
     * @return boolean
     */
    protected boolean userLoggedIn() {
        return !auth.getUser().isAnonymous();
    }

    /**
     * Returns true iff we can identify the user.  Basically, if the user
     * has a cookie, or an active logged in session.
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
        log.debug("adding error on " + key + " " + error.toString());
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
        log.debug("removing error on " + key);
        if (hasError(key)) {
            errors.remove(key);
        }
    }

    protected void clearErrors() {
        errors.clear();
    }

    protected boolean hasErrors() {
        log.debug(errors.size() + " errors found\n" + errors.keySet());
        return !errors.isEmpty();
    }

    protected void setDefault(String key, Object o) {
        log.debug("setting " + key + " to " + o);
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


    /**
     * Get a remote instance of the specified EJB.
     * Assumes the home class will have the same name plus "Home".
     *
     * @param ctx the IntialContext to use on the lookup
     * @param remoteclass The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception if something goes wrong when creating or calling
     * the method on the ejb.
     *
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
     * @param c The class of the interface which should be returned.
     * @throws NamingException if we can't find the get context
     * @throws Exception if something goes wrong when creating or calling
     * the method on the ejb.
     *
     */
    public static Object createLocalEJB(InitialContext ctx, Class c) throws NamingException, Exception {
        Object home = ctx.lookup(c.getName() + "LocalHome");
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
        return (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
    }


}

