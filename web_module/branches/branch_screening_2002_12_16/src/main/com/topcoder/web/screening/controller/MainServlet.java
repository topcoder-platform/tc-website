package com.topcoder.web.screening.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.topcoder.common.web.util.Data;
import com.topcoder.shared.security.*;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.*;
import com.topcoder.web.screening.common.*;
import com.topcoder.security.TCSubject;

/**
 * This class handles all incoming requests.
 * Utilizes similar methods and format to Controller in com.topcoder.web.query.
 * rehashed from Greg Paul with permission.
 *
 * @author Nathaniel Dean
 * @date 27-Dec-2002
 * @version 1.0.1
 *
 * History:
 * version 1.0.0 -- 27-Dec-2002 -- created.
 * version 1.0.1 -- 27-Dec-2002 -- looks up constant changes in web.xml upon initialization.
 * version 1.0.2 -- 29-Dec-2002 -- fixed RequestProcessor usage. - Porgery
 * version 1.0.3 -- 02-Jan-2003 -- fixed RequestProcessor usage again :). - Porgery
 */
 
public class MainServlet extends HttpServlet {

    /**
     * Init() is run the moment that the servlet is loaded into the web server.
     * Initializes the static variables.
     * 
     * @throws ServletException
     */
    public void init() throws ServletException {
        Constants.initialize(getServletConfig());

        if(!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");

        //initialize data types for problem component factory
        try {
            Data.initializeDataTypes();
        }
        catch(Exception e) {
            throw new ServletException(e.getMessage());
        }
    }

    /**
     * all GET requests are redirected to the doPost handler, and POST 
     * should always be used anyway.
     * 
     * @param request 
     * @param response 
     * @throws ServletException
     * @throws IOException
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
               throws ServletException, IOException {
        doPost(request, response);
    }

    /**
     * This method takes the request and locates the appropriate 
     * RequestProcessor, instantiates it, and then creates a forward call 
     * to the view (JSPs).
     * 
     * @param request 
     * @param response
     * @throws ServletException 
     * @throws IOException 
     * @throws Exception 
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
        try {
            String procParam = 
                request.getParameter(Constants.REQUEST_PROCESSOR);

            //redirect to some default page
            if (procParam == null || procParam.length() == 0){
                sendToPage(request, response, Constants.DEFAULT_PAGE, true);
                return;
            }

            if (!isLegal(procParam))
                throw new Exception("Request Processor in illegal format.");

            String className = null;
            if(Constants.PROCESSORS_PACKAGE.endsWith("."))
            {
                className = Constants.PROCESSORS_PACKAGE+procParam;
            }
            else
            {
                className = Constants.PROCESSORS_PACKAGE + "."  + procParam;
            }
            Class procClass = Class.forName(className);

            Persistor p = new SessionPersistor(request.getSession());
            WebAuthentication authen = new BasicAuthentication(p, request, response);
            
            long userId = authen.getActiveUser().getId();
            Resource r = new ClassResource(procClass);
            PrincipalMgr pm = new PrincipalMgr();
            
            TCSubject sub = pm.getUserSubject(userId);
            Authorization author = new TCSAuthorization(sub);
            
            if(!author.hasPermission(r)){
                String redirect = request.getServletPath() + '?' +
                                  request.getQueryString();
                if(userId == User.USER_ANONYMOUS_ID){
                    request.setAttribute(Constants.REDIRECT,redirect);
                    request.setAttribute(Constants.MESSAGE_PARAMETER,
                        "You must be logged in to access that resource.");
//                    throw new AnonymousUserException("Login required for "+r.getName());
                }else{
//                    throw new PermissionDeniedException("Access denied for "+r.getName());
                }
            }
            
            RequestProcessor rp = (RequestProcessor)procClass.newInstance();

            rp.setRequest(request);
            rp.setAuthentication(authen);
            rp.process();
            String wherenow = rp.getNextPage();
            boolean forward = rp.isNextPageInContext();

            sendToPage(request, response, wherenow, forward);
        } catch (AnonymousUserException e) {
            sendToPage(request, response, Constants.LOGIN_PAGE, true);
        } catch (PermissionDeniedException e) {
            sendToErrorPage(request, response, e);
        } catch (Exception e) {
            e.printStackTrace(); //temporary for debugging
            sendToErrorPage(request, response, e);
        }
    }

    /**
     * this function actually handles the redirect/forward, as dictated by the request processor
     * 
     * @param request 
     * @param response 
     * @param page where to redirect/forward
     * @param forward true==forward, false==redirect
     * @throws ServletException 
     * @throws IOException 
     */
    private void sendToPage(HttpServletRequest request, 
                            HttpServletResponse response, 
                            String page, 
                            boolean forward)
                     throws ServletException, IOException {
        if (forward) {
            javax.servlet.RequestDispatcher disp =
                getServletContext().getRequestDispatcher(response.encodeURL(page));
            if(disp == null){
                disp = getServletContext().getRequestDispatcher(Constants.ERROR_PAGE);
                request.setAttribute("Exception",
                    new ScreeningException("Resource '" + page + "' not found."));
            }
            disp.forward(request, response);
        } 
        else {
            String redirectPage = null;
            //do this so people can redirect to internal pages as well
            //as external
            if (page.startsWith("http")) {
                redirectPage = page;
            }
            else {
                redirectPage = request.getContextPath() + page;
            }
            response.sendRedirect(response.encodeRedirectURL(redirectPage));
        }
    }

    /**
     * If an error occurs, redirects to an error-handling jsp (called error.jsp for a default).
     * 
     * @param request 
     * @param response 
     * @param exception exception thrown during request processing.
     * @throws ServletException
     * @throws IOException
     */
    private void sendToErrorPage(HttpServletRequest request, 
                                 HttpServletResponse response, 
                                 Throwable exception)
                          throws ServletException, IOException {
        request.setAttribute("Exception", exception);
        sendToPage(request, response, Constants.ERROR_PAGE, true);
    }

    /**
     * Basic function to assure legality of request parameters
     * 
     * @param s String to check
     * @return true==string is okay, false==string is bad
     */
    private static boolean isLegal(String s) {
        for (int i = 0; i < s.length(); ++i) {
            char ch = s.charAt(i);

            if (Constants.VALID_CHAR_LIST.indexOf(ch) < 0) {
                return false;
            }
        }
        return true;
    }
}
