package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.AppContext;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

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
 * @version 1.1.2.2
 *
 */
public class MainServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);
    private static final String ERR_OPTIONS     = "OPTIONS method invocation";
    private static final String ERR_DELETE      = "DELETE method invocation";
    private static final String ERR_PUT         = "PUT method invocation";
    private static final String ERR_TRACE       = "TRACE method invocation";
    
    private static final String KEY_MODULE      = "module";
    private static final String KEY_MAINPAGE    = "main";
    private static final String KEY_ERRORPAGE   = "error";
	private static final String KEY_CFG_CONTEXT = "config-context";
    private static final String KEY_EXCEPTION   = "caught-exception";
    public  static final String KEY_COOKIES_SET = "cookies-to-set";

    private static final String PFX_PROCMODULE  = "processor-";
    private static final String PFX_PAGE        = "page-";
    
    private ServletConfig servletConfig;
    private InitialContext jndiInitialContext = null;
    
    /**
     * Initializes the servlet. Primary goal is to set up application context. 
     * 
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init() throws ServletException {
    	servletConfig = getServletConfig();
    	String propsFileName = servletConfig.getServletContext().getRealPath(servletConfig.getInitParameter(KEY_CFG_CONTEXT));
    	
    	try {
	    	jndiInitialContext = AppContext.getInstance(propsFileName).getJndiInitialContext();
            log.debug("initial context successfully instantiated");
    	}
    	catch(Exception e) {
    		log.error("can't get initial context", e);
    	}
        //com.topcoder.web.query.common.Constants.init(getServletConfig());
    }

    /**
     * 
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("URI: "+request.getRequestURI()+"["+request.getQueryString()+"]" );

    	String processorName = request.getParameter(KEY_MODULE);
        if( processorName == null ) {
            log.warn("processing module not specified");
            String dest = servletConfig.getInitParameter(PFX_PAGE+KEY_MAINPAGE);
            fetchRegularPage(request, response, dest, true);
            return;
        }

        // prefixed to allow different resource kinds to share same name
    	String processorClassName = servletConfig.getInitParameter(PFX_PROCMODULE+processorName);
        RequestProcessor processorModule = null;
        
        try {
            processorModule = (RequestProcessor) Class.forName(processorClassName).newInstance();
            log.debug("processing module "+processorClassName+" instantiated");
        }
        catch(Exception e) {
            log.error("processing module instantiation exception ", e);
            fetchErrorPage(request, response, e);
            return;
        }

        try {
            processorModule.setRequest(request);
            SessionPersistor persistor = SessionPersistor.getInstance(request.getSession(true));
            WebAuthentication authToken;
            authToken = new BasicAuthentication(persistor, request, response); 
            processorModule.setAuthToken(authToken);
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
        catch(Exception e) {
            log.error("exception during request processing ["+processorName+"]", e);
            fetchErrorPage(request, response, e);
        }
    }
    
    /**
     * 
     * @param req
     * @param resp
     * @param dest
     * @param forward
     * @throws Exception
     */
    private void fetchRegularPage( HttpServletRequest req, HttpServletResponse resp,
                                    String dest, boolean forward ) throws IOException, ServletException
    {
        if( dest == null ) {
            // it is supposed when processor returns null as next page, then
            // controller must use defaul page
            dest = SessionPersistor.getInstance(req.getSession(true)).popLastPage();
            if( dest == null ) { //still null
                dest = req.getContextPath()+"/"; // deefault page is web app root
            } 
        }
        log.debug((forward?"forwarding":"redirecting") + " to " + dest);

        // if there are any cookies to be set, then populate response with them
        HashSet cookies = (HashSet)req.getAttribute(KEY_COOKIES_SET);
        if( cookies != null ) {
            Iterator i = cookies.iterator();
            while (i.hasNext()) {
                resp.addCookie((Cookie) i.next());
            }
        }
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
            // redirected pages *must* contain servlet context path
            if( ! startsWithContextPath ) {
                dest = contextPrefix+dest;
            }
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
     * @param request 
     * @param response
     * @param exception original exception
     *   
     * @throws ServletException
     * @throws IOException
     */
    private void fetchErrorPage(HttpServletRequest req, HttpServletResponse resp, Throwable exc)
                                 throws ServletException, IOException
    {
        // error page is regular page too with the only difference - it
        // has an error attribute set in request, so..
        String errorPage = servletConfig.getInitParameter(PFX_PAGE+KEY_ERRORPAGE);
        if( exc != null ) {
            req.setAttribute(KEY_EXCEPTION, exc);
        }
        fetchRegularPage(req, resp, errorPage, true);
    }
    
    /**
     * For now it is just synonym for doGet.
     *
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doDelete(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp)
                             throws ServletException, IOException
    {
        log.error(ERR_DELETE);
        fetchErrorPage(req, resp, new Exception(ERR_DELETE));
    }

    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doOptions(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp)
                               throws ServletException, IOException
    {
        log.error(ERR_OPTIONS);
        fetchErrorPage(req, resp, new Exception(ERR_OPTIONS));
    }

    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doPut(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.error(ERR_PUT);
        fetchErrorPage(req, resp, new Exception(ERR_PUT));
    }

    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doTrace(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doTrace(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.error(ERR_TRACE);
        fetchErrorPage(req, resp, new Exception(ERR_TRACE));
    }
}