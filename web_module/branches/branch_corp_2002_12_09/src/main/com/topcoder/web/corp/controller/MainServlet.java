package com.topcoder.web.corp.controller;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;
//import com.topcoder.web.corp.request.PrimaryRegistrationProcessor;
import com.topcoder.web.query.common.Constants;

/**
 * Final class comment will go gere
 * 
 * 
 * ----- some realization notes (to be removed upon completion) ---------<br>
 * 
 * 2002/12/17 by djFD
 * 
 * Well, that step has gone. I do not know how it will be implemented in
 * reality, so I am placing the simplest code the only goal of which is to call
 * my primary registration processor. Neoturi, just let me know when u will
 * check in your controller stuff, so I will be able to get things synchronized.
 * 
 * initial by djFD
 * 
 * The servlet to handle requests to corporate site. For now it
 * is a stub only. It is supposed, that all requests to corporate site will go
 * thru it. It implements next simple logic. Request is valid if URI has next
 * representation: /portal/?N where n is number from 1 to 2. Any other requests
 * supposed to be invalid and will result as 404 not found. What content will
 * send to user is defined by web.xml.
 * 
 * 
 * @author Greg Paul , modified by djFD
 * @version 1.1.2.2
 *
 */
public class MainServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);
    
//    private RequestProcessor proc1 = null;
//    private RequestProcessor proc2 = null;

    /**
     * Initializes the servlet. What content will be feed is defined from
     * servlet config accepted
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init() throws ServletException {
        com.topcoder.web.query.common.Constants.init(getServletConfig());
//        try {
//            proc1 = (RequestProcessor)Class.forName(config.getInitParameter("processor-1")).newInstance();
//            log.debug("destination 1 ok");
//        }
//        catch (Exception e) {
//            log.error("destination1 disabled ("+e.getMessage()+")");
//        }
//
//        try {
//            proc2 = (RequestProcessor)Class.forName(config.getInitParameter("processor-2")).newInstance();
//            log.debug("destination 2 ok");
//        }
//        catch (Exception e) {
//            log.error("destination2 disabled ("+e.getMessage()+")");
//        }
    }

//    /**
//     * Returns -1 when URI specified is invalid (look at class description to
//     * see what requests are valid). 
//     * @param req request to the content
//     * @return int destination: eiter 1 or two when URI is valid, otherwise -1
//     */
//    private int getDestination(HttpServletRequest req) {
//        int n = req.getContextPath().trim().length();
//        String reqRelURI = req.getRequestURI().trim().substring(n);
//        if( ! "/".equals(reqRelURI) ) {
//            return -1;
//        }
//        try {
//            int dest = Integer.parseInt(req.getQueryString());
//            if( dest == 1 || dest ==2 ) {
//                return dest;
//            }
//        }
//        catch(Exception e) {
//        }
//        return -1;
//    }

    /**
     * Method comments will go here  
     * 
     * 
     * 
     * ----- some realization notes (to be removed upon completion) ---------<br>
     * 
     * -- 2002/12/17 by djFD
     * for now I just filtering mine (to be processed by me) URIs to be fed into
     * my primary Registrations processor. All others are processed by default
     * processing scheme (through servlet dispatcher).
     * 
     * initial by djFD
     * First of all checks if URI is valid. If it is not, then responds by HTTP
     * 404 not found. When request is valid, method process it with either of
     * two supplied request processors (if they were successfuly instantiated at
     * init stage, else same 404 not found). If processor fails to process
     * request, 404 not found returned again.
     * 
     * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest, HttpServletResponse)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String moduleName = request.getParameter("module");
        ServletConfig srvCfg = getServletConfig();
        Enumeration initNames = srvCfg.getInitParameterNames();
        String initParam, initValue, nextPage;
        Class opClass;
        RequestProcessor req = null;
        boolean found = false;
        
        if( moduleName != null ) {
            while( initNames.hasMoreElements() ) {
                initParam = (String)initNames.nextElement();
                if( initParam == null ) continue;
                initValue = srvCfg.getInitParameter( initParam );
                if( initValue == null ) continue;
                log.debug( "doGet: initParam = " + initParam + ", initValue = " + initValue );
                if( initParam.equals( moduleName ) ) {
                    try {
                        /* 12/19/2002 - NeoTuri
                         * I'm considering using the prefix Constants.QUERY_PACKAGE for all
                         * servlets hiding behind this controller.  The associated items in
                         * web.xml will be modified to reflect this change.
                         */
                        opClass = Class.forName( initValue );
                        req = (RequestProcessor) opClass.newInstance();
                    }
                    catch( Exception e ) {
                        log.debug( "doGet: bad module" );
                        break;
                    }
                    try {
                        req.setRequest( request );
                        req.process();
                        sendToPage( request, response, req.getNextPage(), req.isNextPageInContext() );
                        found = true;
                    }
                    catch( Exception e ) {
                        /* Could not process module */
                        log.debug( "doGet: unable to properly forward " );
                    }
                    break;
                }
            }
        }
        
        if( !found ) {
            log.debug( "doGet: module not found" );
            //sendToErrorPage( request, response, new Exception("404?") );
        }
        /*
    	// I suppose for testing purposes that 'pr' request parameter defines
    	// what action to pefrorm, so if it is 'prim_reg' literal then my
    	// processor must be called.
    	// all others parameters (if any) in that case is my responsibility
    	String param1 = request.getParameter("pr");
    	if( "prim-reg".equalsIgnoreCase(param1) ) {
    		RequestProcessor proc = new PrimaryRegistrationProcessor();
    		proc.setRequest(request);
    		try {
    			proc.process();
    		}
    		catch(Exception e) {
    			String errPage = proc.getNextPage();
    			if( proc.isNextPageInContext() ) {
    				getServletContext().getRequestDispatcher(errPage).forward(request, response);
    			}
    			else {
    				response.sendRedirect(errPage);
    			}
    		}
    	}
    	else {
    		String entireUri = request.getRequestURI();
    		if( null != request.getQueryString() ) {
    			entireUri += "?"+request.getQueryString();
    		}
    		//possible situations when dispatcher for the given URI is absent,
    		// and then dispatcher will be null  
    		getServletContext().getRequestDispatcher(entireUri).forward(request, response);
    	}
    	return;
        */
    }
    
    /**
     * For now it is just synonym for doGet.
     *
     * @param request the servlet request object
     * @param  response the servlet response object
     *
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     *
     * */
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doDelete(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doDelete(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doDelete(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doOptions(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doOptions(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doOptions(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doPut(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doPut(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doPut(arg0, arg1);
    }

    /**
     * For now it is just synonym for doGet.
     * 
     * @see javax.servlet.http.HttpServlet#doTrace(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    protected void doTrace(HttpServletRequest arg0, HttpServletResponse arg1)
        throws ServletException, IOException {
        super.doTrace(arg0, arg1);
    }
    
    private void sendToLoginPage(HttpServletRequest request, HttpServletResponse response, boolean forward)
            throws ServletException, IOException {
        if (forward) {
            sendToPage(request, response, Constants.LOGIN_PAGE, forward);
        } else {
            sendToPage(request,
                    response,
                    "http://" + request.getServerName() + request.getContextPath() + request.getServletPath() + "?" +
                    Constants.TASK_PARAM + "=" + Constants.LOGIN_TASK,
                    false);
        }
    }

    private void sendToPage(HttpServletRequest request, HttpServletResponse response, String page, boolean forward)
            throws ServletException, IOException {
        log.debug((forward?"forwarding ":"redirecting ") + "to " + page);
        if (forward) {
            getServletContext().getRequestDispatcher(page).forward(request, response);
        } else {
            response.sendRedirect(page);
        }
    }

    private void sendToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception) throws ServletException, IOException {
        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        sendToPage(request, response, Constants.ERROR_PAGE, true);
    }

    private static boolean isLegal(String s) {
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if ("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_".indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}