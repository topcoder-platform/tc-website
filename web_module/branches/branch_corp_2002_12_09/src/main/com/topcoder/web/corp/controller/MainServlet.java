package com.topcoder.web.corp.controller;

import java.io.IOException;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.AppContext;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.SessionPersistor;

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
	private static final String KEY_CFG_CONTEXT = "config-context";
    private static final String KEY_EXCEPTION   = "caught-exception";

    private static final String PFX_PROCMODULE  = "processor-";
    private static final String PFX_PAGE        = "page-";
    
    private ServletConfig servletConfig;
    private InitialContext jndiInitialContext = null;
    
    /**
     * Initializes the servlet. What content will be feed is defined from
     * servlet config accepted
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init() throws ServletException {
    	servletConfig = getServletConfig();
    	String propsFileName = servletConfig.getServletContext().getRealPath(servletConfig.getInitParameter(KEY_CFG_CONTEXT));
    	
    	try {
	    	jndiInitialContext = AppContext.getInstance(propsFileName).getJndiInitialContext();
    	}
    	catch(Exception e) {
    		log.error("can't get initial context", e);
    	}
        //com.topcoder.web.query.common.Constants.init(getServletConfig());
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
     * 
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        log.debug("URI: "+request.getRequestURI()+"["+request.getQueryString()+"]" );
        
    	String processorName = request.getParameter(KEY_MODULE);
        // prefixed to allow different resource kinds to share same name
    	String processorClassName = servletConfig.getInitParameter(PFX_PROCMODULE+processorName);
        RequestProcessor processorModule = null;
        
        try {
            processorModule = (RequestProcessor) Class.forName(processorClassName).newInstance();
            log.debug("processing module "+processorClassName+"instantiated");

        }
        catch(Exception e) {
            log.error("processing module instantiation exception ", e);
            fetchErrorPage(request, response, e);
            return;
        }

        try {
            processorModule.setRequest(request);
            processorModule.process();
            boolean forward = processorModule.isNextPageInContext();
            String destination = processorModule.getNextPage();

            log.debug((forward?"forwarding":"redirecting") + " to " + destination);

            if( forward ) {
                getServletContext().getRequestDispatcher(destination).forward(request, response);
            }
            else {
                response.sendRedirect(destination);
            }
            // well done. every successful page we will place into persistor which in
            // turn stored in http session. thus we will be able return to original
            // page after error recovering or after login
            SessionPersistor store = SessionPersistor.getInstance(request);
            String currentPage = request.getRequestURI();
            if( request.getQueryString() != null ) {
                currentPage += "?"+request.getQueryString();
            }
            store.setLastPage( currentPage );
            log.debug("last page set as "+currentPage);
        }
        catch(Exception e) {
            log.error("exception during request processing ["+processorName+"]", e);
            fetchErrorPage(request, response, e);
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
    private void fetchErrorPage(HttpServletRequest req, HttpServletResponse resp, Throwable exc) throws ServletException, IOException {
        String errorPage = servletConfig.getInitParameter(PFX_PAGE+KEY_MAINPAGE);
        req.setAttribute(KEY_EXCEPTION, exc);
        log.debug("forwarding to "+errorPage);
//        resp.sendError(HttpServletResponse.SC_FORBIDDEN);
        getServletContext().getRequestDispatcher(errorPage).forward(req, resp);
    }
    
    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doDelete(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.error(ERR_DELETE);
        fetchErrorPage(req, resp, new Exception(ERR_DELETE));
    }

    /**
     * Not supported. Will return 403 forbidden.
     * 
     * @see javax.servlet.http.HttpServlet#doOptions(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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