package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.security.NotAuthorizedException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.request.Login;


/**
 * Only two methods are supported GET & POST (identical behaviour in
 * controller). Other methods will return 403 forbidden error to user. If
 * processing module responsible for frocessing of the request can't be found
 * among init params, then same 403 returned (also log record is performed to
 * make troubleshooting easier). In practice all errors of controller level
 * would be fed '403 forbidden' content to user (i.e. processing modules
 * instantiation errors, exceptions in them, exceptions inside controller
 * itself, etc), application-level ones are supposed to be processed inside
 * processor itself. This intended to distinct web app errors with application
 * server errors.
 * 
 * @author Greg Paul , modified by djFD
 * @version 1.1.2.62
 *
 */
public class MainServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);
    private static final String ERR_OPTIONS     = "OPTIONS method invocation";
    private static final String ERR_DELETE      = "DELETE method invocation";
    private static final String ERR_PUT         = "PUT method invocation";
    private static final String ERR_TRACE       = "TRACE method invocation";
    private static final String DEFAULT_ERRPAGE = "/exc/InternalError.jsp";
    
    private ServletConfig servletConfig = null;
    private String welcomeApplicationPage = null;
    private String loginApplicationPage = null;
    private String errorPageNavigation = null;
    private String errorPageSecurity = null;
    private String errorPageInternal = null;
    
    /**
     * Initializes the servlet. Primary goal is to set up application context
     * variables and constants.
     * 
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init() throws ServletException {
        servletConfig = getServletConfig();
        Constants.init(servletConfig);
        welcomeApplicationPage = servletConfig.getInitParameter("page-welcome");
        loginApplicationPage   = servletConfig.getInitParameter("page-login");
        errorPageNavigation = servletConfig.getInitParameter("page-error-navigation");
        errorPageSecurity   = servletConfig.getInitParameter("page-error-security");
        errorPageInternal   = servletConfig.getInitParameter("page-error-internal");
        if(errorPageNavigation==null || errorPageNavigation.trim().length()==0) {
            errorPageNavigation = DEFAULT_ERRPAGE; 
        }
        if(errorPageSecurity==null || errorPageSecurity.trim().length()==0) {
            errorPageSecurity = DEFAULT_ERRPAGE;
        }
        if(errorPageInternal==null || errorPageInternal.trim().length()==0) {
            errorPageInternal = DEFAULT_ERRPAGE;
        }
    }

    /**
     * 
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        log.debug("URI: "+
            request.getRequestURI()+"["+request.getQueryString()+"]" 
        );
        
        // put prefix of the url into request
        request.setAttribute(Constants.KEY_LINK_PREFIX, Util.appRootPage(request));
        
        // same for name of page to handle internal exceptions
        request.setAttribute(Constants.KEY_INTERNAL_EXC_PAGE, errorPageInternal);
        
        String processorName = request.getParameter(Constants.KEY_MODULE);
        if( processorName == null ) {
            log.warn("processing module not specified");
            fetchRegularPage(request, response, welcomeApplicationPage, true);
            return;
        }

        // prefixed to allow different resource kinds to share same name
        String processorClassName = servletConfig.getInitParameter(
            "processor-"+processorName
        );

        // first of all, to check, if it is allower to run that processor at all
        SessionPersistor persistor = new SessionPersistor(
            request.getSession(true)
        );
        WebAuthentication authToken = null;
        RequestProcessor processorModule = null;
        
        try {
            TCSubject tcUser;
            authToken = new BasicAuthentication(persistor, request, response);
            tcUser = Util.retrieveTCSubject(authToken.getActiveUser().getId());
            Authorization authorization = new TCSAuthorization(tcUser);
            boolean allowedToRun = false;
            allowedToRun = authorization.hasPermission(
                new SimpleResource(processorClassName)
            ); 
            if(! allowedToRun ) {
                log.debug("user [id="+tcUser.getUserId()+"] has not enough "+
                    "permissions to work with module "+processorClassName
                );
                throw new NotAuthorizedException(
                    "Not enough permissions to work with requested module"
                );
            }

            processorModule = (RequestProcessor)Class.forName(
                processorClassName
            ).newInstance();
            log.debug("processing module "+processorClassName+" instantiated");

            // set main page in web.xml as homePage for Static Processor
            request.setAttribute("homePage", welcomeApplicationPage);

            processorModule.setRequest(request);
            processorModule.setAuthentication(authToken);
            processorModule.process();
            boolean forward = processorModule.isNextPageInContext();
            String destination = processorModule.getNextPage();
            if( destination != null ) {
                String lastUserPage = request.getRequestURI();
                if( request.getQueryString() != null ) {
                    lastUserPage += "?"+request.getQueryString();
                }
                persistor.pushLastPage(lastUserPage);
            }
            fetchRegularPage(request, response, destination, forward);
        }
        catch(NotAuthorizedException nae) {
            if (authToken.getUser().isAnonymous()) {
                /* If the user is anonymous and tries to access a resource they
                   are not authorized to access, send them to login page.    */
                log.debug("user unauthorized to access resource and user " +
                          "not logged in, forwarding to login page.");
                fetchLoginPage(request,response);
                return;
            } else {
                /* If the user is logged-in and is not authorized to access
                   the resource, send them to an authorization failed page */
                log.error("Unauthorized Access to ["+processorName+"]", nae);
                fetchErrorPage(request, response, errorPageSecurity, nae);
                //fetchAuthorizationFailedPage(request, response, nae);
            }
        }
        catch(AuthenticationException aex) {
            log.error("probably wrong username/password", aex);
            fetchErrorPage(request, response, errorPageSecurity, aex);
        }
        catch(Exception e) {
            /* All Non authorization errors are cought here  */
            log.error("exception during request processing ["
                +processorName+"]", e
            );
            fetchErrorPage(request, response, errorPageInternal, e);
        }
    }
    
    /**
     * 
     * @param req
     * @param resp
     * @param dest
     * @param forward
     * @throws IOException
     * @throws ServletException
     */
    private void fetchRegularPage(
        HttpServletRequest req,
        HttpServletResponse resp,
        String dest,
        boolean forward
    )
    throws IOException, ServletException
    {
        if( dest == null ) {
            // it is supposed when processor returns null as next page, then
            // controller must use defaul page
            dest = new SessionPersistor(req.getSession(true)).popLastPage();
            if( dest == null ) { //still null
                dest = req.getContextPath()+"/"; // default page is web app root
            } 
        }
        log.debug((forward?"forwarding":"redirecting") + " to " + dest);

        String contextPrefix = req.getContextPath();
        boolean startsWithContextPath = dest.startsWith(contextPrefix); 
        if( forward ) {
            // forwarded pages *must not* contain servlet context path
            if( startsWithContextPath ) {
                dest = dest.substring(contextPrefix.length());
            }
            getServletContext().getRequestDispatcher(dest).forward(req, resp);
        }
        else {
            resp.sendRedirect(dest);
        }
    }                                    

    /**
     * Forces error page to be returned to user. As I think, all errors must
     * look similarly for the user - 403 forbidden. There is not any need to
     * show him software internals because he was going on the page for
     * some other reason. The only exception is debug time, at that time page
     * may optionally include stack trace.
     * 
     * @param req
     * @param resp
     * @param errPage
     * @param exc
     * @throws ServletException
     * @throws IOException
     */
    private void fetchErrorPage(
        HttpServletRequest req,
        HttpServletResponse resp,
        String errPage,
        Throwable exc
    )
    throws ServletException, IOException
    {
        // error page is regular page too with the only difference - it
        // has an error attribute set in request, so..
        if( exc != null ) {
            req.setAttribute(Constants.KEY_EXCEPTION, exc);
        }
        String contextPath = req.getContextPath();
        if(! errPage.startsWith(contextPath) ) {
            errPage = contextPath+errPage;
        }
        fetchRegularPage(req, resp, errPage, true);
    }
    

    /**
     * private method for sending user to login page.
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void fetchLoginPage(
        HttpServletRequest req,
        HttpServletResponse resp
    )
    throws ServletException, IOException 
    {
        String originatingPage = req.getRequestURI();
        if( req.getQueryString() != null ) {
            originatingPage += "?"+req.getQueryString();
        }
        log.debug("fetchLoginPage request, orginatingPage = "+originatingPage);
        
        StringBuffer loginPageDest = new StringBuffer(128);
        loginPageDest
            .append(loginApplicationPage).append('?')
            .append(Login.KEY_DESTINATION_PAGE).append('=')
            .append(URLEncoder.encode(originatingPage));
        fetchRegularPage(req, resp, loginPageDest.toString(), true);
    }


    /**
     * For now it is just synonym for doGet.
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        doGet(request, response);
    }

    /**
     * Not supported. Will return internal error page.
     */
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException
    {
        log.error(ERR_DELETE);
        fetchErrorPage(req, resp, errorPageInternal, new Exception(ERR_DELETE));
    }

    /**
     * Not supported. Will return internal error page.
     */
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException
    {
        log.error(ERR_OPTIONS);
        fetchErrorPage(req, resp,errorPageInternal, new Exception(ERR_OPTIONS));
    }

    /**
     * Not supported. Will return internal error page.
     */
    protected void doPut(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException
    {
        log.error(ERR_PUT);
        fetchErrorPage(req, resp, errorPageInternal, new Exception(ERR_PUT));
    }

    /**
     * Not supported. Will return internal error page.
     */
    protected void doTrace(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException 
    {
        log.error(ERR_TRACE);
        fetchErrorPage(req, resp, errorPageInternal, new Exception(ERR_TRACE));
    }
}