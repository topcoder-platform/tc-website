package com.topcoder.web.screening.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

import com.topcoder.common.web.util.Data;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.*;
import com.topcoder.shared.util.logging.Logger;

import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.security.*;
import com.topcoder.web.screening.common.*;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.RequestInfo;
import com.topcoder.web.corp.request.Login;

/**
 * This class handles all incoming requests.
 * Utilizes similar methods and format to Controller in com.topcoder.web.query.
 * rehashed from Greg Paul with permission.
 *
 * @author Nathaniel Dean
 *
 */

public class MainServlet extends HttpServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    /**
     * Init() is run the moment that the servlet is loaded into the web server.
     * Initializes the static variables.
     *
     * @throws ServletException
     */
    public void init() throws ServletException {
        Constants.initialize(getServletConfig());

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");

        //initialize data types for problem component factory
        try {
            Data.initializeDataTypes();
        } catch (Exception e) {
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
     * @throws ServletException
     * @throws IOException
     */
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WebAuthentication authen = null;
        try {
            Persistor p = new SessionPersistor(request.getSession());
            authen = new BasicAuthentication(p, request, response);
            long userId = authen.getActiveUser().getId();
            PrincipalMgr pm = new PrincipalMgr();
            TCSubject sub = pm.getUserSubject(userId);
            Authorization author = new TCSAuthorization(sub);

            RequestInfo rInfo = new RequestInfo();
            Set groups = ((TCSAuthorization) author).getGroups();
            rInfo.setAll(authen.getActiveUser(), groups);
            request.setAttribute(Constants.REQUEST_INFO, rInfo);

            String procParam = request.getParameter(Constants.REQUEST_PROCESSOR);

            //redirect to some default page
            if (procParam == null || procParam.length() == 0) {
                sendToPage(request, response, Constants.DEFAULT_PAGE, true);
                return;
            }

            if (!isLegal(procParam))
                throw new Exception("Request Processor in illegal format.");

            String className = null;
            if (Constants.PROCESSORS_PACKAGE.endsWith(".")) {
                className = Constants.PROCESSORS_PACKAGE + procParam;
            } else {
                className = Constants.PROCESSORS_PACKAGE + "." + procParam;
            }
            log.info(new StringBuffer(100).append("[**** ").append(procParam).append(" **** ").
                    append(authen.getActiveUser().getUserName()).append(" **** ").
                    append(request.getRemoteHost() + " ****]"));

            Class procClass = Class.forName(className);
            Resource r = new ClassResource(procClass);

            RequestProcessor rp = null;
            try {
                if (!author.hasPermission(r)) {
                    if (authen.getActiveUser().isAnonymous()) {
                        throw new AnonymousUserException("Must log in to access this resource.");
                    } else {
                        throw new PermissionDeniedException(authen.getActiveUser(), r);
                    }
                }

                rp = (RequestProcessor) procClass.newInstance();

                rp.setRequest(request);
                rp.setAuthentication(authen);
                rp.process();
            } catch (AnonymousUserException e) {
                request.setAttribute("message", "In order to continue, you must provide your user name " +
                        "and password, even if you’ve logged in already.");
                request.setAttribute(Login.KEY_DESTINATION_PAGE,
                        HttpUtils.getRequestURL(request) + "?" + request.getQueryString());
                request.setAttribute(com.topcoder.web.corp.Constants.KEY_MODULE, "Login");
                boolean forward = true;
                sendToPage(request, response, "/", forward);
                return;
            }
            String wherenow = rp.getNextPage();
            boolean forward = rp.isNextPageInContext();

            sendToPage(request, response, wherenow, forward);
        } catch (PermissionDeniedException e) {
            sendToPermErrorPage(request, response, e);
        } catch (ScreeningException e) {
            sendToErrorPage(request, response, e);
        } catch (Exception e) {
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
        log.debug("sending to page " + page);
        if (forward) {
            javax.servlet.RequestDispatcher disp =
                    getServletContext().getRequestDispatcher(response.encodeURL(page));
            if (disp == null) {
                disp = getServletContext().getRequestDispatcher(Constants.ERROR_PAGE);
                request.setAttribute("Exception",
                        new ScreeningException("Resource '" + page + "' not found."));
            }
            disp.forward(request, response);
        } else {
            String redirectPage = null;
            //do this so people can redirect to internal pages as well
            //as external
            if (page.startsWith("http")) {
                redirectPage = page;
            } else {
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
     * If an error occurs, redirects to an error-handling jsp (called error.jsp for a default).
     *
     * @param request
     * @param response
     * @param exception exception thrown during request processing.
     * @throws ServletException
     * @throws IOException
     */
    private void sendToPermErrorPage(HttpServletRequest request,
                                     HttpServletResponse response,
                                     Throwable exception)
            throws ServletException, IOException {
        request.setAttribute("Exception", exception);
        sendToPage(request, response, Constants.PERM_ERROR_PAGE, true);
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
