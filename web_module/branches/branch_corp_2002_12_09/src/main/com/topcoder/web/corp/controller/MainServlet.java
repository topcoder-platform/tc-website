package com.topcoder.web.corp.controller;

import java.io.IOException;
//import java.util.Enumeration;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.RequestProcessor;
//import com.topcoder.web.corp.request.PrimaryRegistrationProcessor;
//import com.topcoder.web.query.common.Constants;

/**
 * Final class comment will go gere
 * 
 * 
 * ----- some realization notes (to be removed upon completion) ---------<br>
 * 
 * 2002/12/20 by djFD 
 * I just have commentted all related to Constants to avoid reference to
 * foreign package com.topcoder.web.query.common.Constants.
 * All references are replaced by dumbly hardcoded literals so we have to decide
 * what to do with them
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
    
    /**
     * Initializes the servlet. What content will be feed is defined from
     * servlet config accepted
     * @see javax.servlet.Servlet#init(javax.servlet.ServletConfig)
     * @throws     ServletException
     * */
    public void init() throws ServletException {
        //com.topcoder.web.query.common.Constants.init(getServletConfig());
    }

    /**
     * Method comments will go here  
     * ----- some realization notes (to be removed upon completion) ---------<br>
     *
     * 2002/12/20 by NeoTuri
     * I changed the search to directly read the initialization parameter.
     * 
     * 2002/12/20 by djFD
     * Hi NeoTuri, maybe is it better instead of iterating thru entire bundle of
     * init parameters to get one from some HashTable created upon servlet
     * initialization?
     * 
     * -- 2002/12/19 by NeoTuri
     * All requests will be distributed on the 'module' query parameter in the 
     * request string.  The associated servlet will receive the entire query 
     * string.  I plan to later modify web.xml only use request servlets that
     * contain a common prefix (i.e. com.topcoder.web.corp.request ). This value
     * will reside in the Constants.QUERY_PACKAGE property.
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
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException 
    {
    	String moduleName = request.getParameter("module");
        ServletConfig srvCfg = getServletConfig();
        String initValue;
        RequestProcessor req = null;
        
        if( moduleName != null && isLegal(moduleName) ) {
            initValue = srvCfg.getInitParameter( moduleName );
            if( initValue != null ) {
                log.debug( "doGet: moduleName = " + moduleName );
                log.debug( "doGet: initValue = " + initValue );
                try {
                    req = (RequestProcessor) Class.forName(initValue).newInstance();
                    req.setRequest( request );
                    req.process();
                    if( req.getNextPage() != null ) {
                        sendToPage( request, response, req.getNextPage(), req.isNextPageInContext() );
                    }
                    else {
                        sendQuickError( request, response, "doGet: " + initValue + " returned null" );
                    }
                }
                catch( Exception e ) {
                    sendQuickError( request, response, "doGet: " + e.getMessage() );
                }
            }
            else {
                sendQuickError( request, response, "doGet: moduleName not found" );
            }
        }
        else {
            sendQuickError( request, response, "doGet: moduleName is null" );
        }
    }
    
    private void sendQuickError( HttpServletRequest request, HttpServletResponse response, String msg ) 
        throws ServletException, IOException {
        log.debug( msg );
        sendToErrorPage( request, response, new Exception( msg ) );
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
            sendToPage(request, response, "login.jsp" /*Constants.LOGIN_PAGE*/, forward);
        } else {
            sendToPage(request,
                    response,
                    "http://" + request.getServerName() + request.getContextPath() + request.getServletPath() + "?" +
                    "module=login"/*Constants.TASK_PARAM + "=" + Constants.LOGIN_TASK*/,
                    false);
        }
    }

    private void sendToPage(HttpServletRequest request, HttpServletResponse response, String page, boolean forward)
            throws ServletException, IOException {
        if( page == null ) {
            log.debug("null URL");
            return;
        }
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
        sendToPage(request, response, "error.jsp" /*Constants.ERROR_PAGE*/, true);
    }

    private static boolean isLegal(String s) {
        for (int i=0; i<s.length(); i++) {
            char ch = s.charAt(i);
            if ("-0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_".indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}