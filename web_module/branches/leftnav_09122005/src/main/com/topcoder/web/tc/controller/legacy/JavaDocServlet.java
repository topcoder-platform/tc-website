package com.topcoder.web.tc.controller.legacy;

import com.topcoder.ejb.JavaDocServices.JavaDocServices;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseProcessor;

import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * A servlet to get java docs from the ProblemServicesBean.
 *
 * @author Tim Bulat
 */
public class JavaDocServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(JavaDocServlet.class);
    private static final String ERROR_PAGE = "/errorPage.jsp";
    private static final String SERVLET_NAME = "javadocs";
    private static final String WEB_SERVICE_NAME = "webServiceName";
    private static final String PATH = "path";
    private static final String PASSWORD = "password";
    private static final String HANDLE = "handle";
    private static final String DB_NAME = "OLTP";
    
    protected String getServletPath() {
        return SERVLET_NAME;
    }
    
    protected String getDB() {
        return DB_NAME;
    }

    private JavaDocServices services = null;

    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("Initializing JavaDocServlet");
        super.init(config);
    }

    private void getServices() {
        InitialContext ctx =null;
        try {
            log.debug("JavaDocServlet getting JavaDocServices...");
            ctx = TCContext.getInitial();
            services = (JavaDocServices) BaseProcessor.createEJB(ctx, JavaDocServices.class);
            log.debug("...successful");
        } catch (Exception e) {
            log.error("Error getting JavaDocServices:", e);
        } finally {
            TCContext.close(ctx);
        }
    }

    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("JavaDocServlet.doGet");
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.debug("JavaDocServlet.doPost");
        process(request, response);
    }

    public void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (services == null) {
            getServices();
            if (services == null) {
                forwardToErrorPage(request, response, null, "Cannot get JavaDocServices bean.");
                return;
            }
        }

        StringBuffer out = new StringBuffer();
        String webServiceName = request.getParameter(WEB_SERVICE_NAME);
        String path = request.getParameter(PATH);
        String password = request.getParameter(PASSWORD);
        String handle = request.getParameter(HANDLE);
        log.info("webServiceName = " + webServiceName + ", path = " + path + ", password = " + password + ", handle = " + handle );

        if (webServiceName == null) {
            forwardToErrorPage(request, response, null, "A webServiceName property must be set.");
            return;
        }

        //is the user logged in and able to view this web service?
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(webServiceName);
        boolean showPage = false;
        if (obj == null) {
            log.debug("Not logged in.");
            //the user is not logged in

            if (password == null || handle == null) {
                //the user has not yet tried to login
                log.debug("Hasn't tried to log in.");
                writeLoginHtml(out, webServiceName);
            } else {

                //try to authenticate the user
                log.debug("Has tried to login, will try to authenticate.");
                String error = "";

                try {
                    error = services.authenticateUserForWebService(handle, password, webServiceName, getDB());
                } catch (Exception e) {
                    log.error("Error authenticating " + handle);
                    forwardToErrorPage(request, response, e, "Error using JavaDocServices to authenticate user.");
                    return;
                }

                if (error.length() != 0) {
                    log.debug("Invalid login: " + error);
                    //invalid login
                    writeLoginHtmlWithError(out, webServiceName, error);
                } else {
                    log.debug("Good login.");
                    //good login
                    session.setAttribute(webServiceName, Boolean.TRUE);
                    showPage = true;
                }
            }
        } else {
            //user is already logged in
            showPage = true;
        }

        if (showPage) {
            //the user is logged in, get the file specified by path
            log.debug("Showing page.");

            String requestPath = path;
            //fill in the path if there isn't one
            if (path == null || path.length() == 0) {
                requestPath = "index.html";
            }
            //take off the #page link for the request
            if (path != null && path.indexOf("#") != -1) {
                requestPath = path.substring(0, path.indexOf("#"));
            }
            //get rid of '.' and '/' starting the path
            while (requestPath.startsWith(".") || requestPath.startsWith("/")) {
                requestPath = requestPath.substring(1);
            }

            String file = null;

            try {
                file = services.getFile(webServiceName, requestPath,getDB());
            } catch (Exception e) {
                log.error("Error getting " + path + " for " + webServiceName);
                forwardToErrorPage(request, response, e, "Error using JavaDocServices to get file.");
                return;
            }
            log.debug("file = " + file);

            //fix the links in the file to start with "javadocs?webServiceName=name&"
            file = HTMLLinkChanger.prependToAllAddresses(getServletPath() + "?" + WEB_SERVICE_NAME + "=" + webServiceName + "&path=", file);
            out.append(file);
        }

        ServletOutputStream outputStream = response.getOutputStream();
        outputStream.print(out.toString());
        outputStream.flush();
    }

    private void writeLoginHtml(StringBuffer out, String webServiceName) {
        writeLoginHtmlWithError(out, webServiceName, "");
    }

    private void writeLoginHtmlWithError(StringBuffer out, String webServiceName, String error) {
        out.append(
                "<HTML><HEAD><TITLE>Log in to view the java docs.</TITLE></HEAD>" +
                "<BODY><H1>Java Doc Viewer Login</H1>");

        if (error.length() > 0) {
            out.append(
                    "<HR><FONT COLOR=\"red\">Login Error: " + error + "</FONT><HR>");
        }

        out.append(
                "Please login to view the java docs for " + webServiceName + ".<P>" +
                "<FORM NAME=\"login_form\" METHOD=\"post\" ACTION=\"" + getServletPath() + "?" + WEB_SERVICE_NAME + "=" + webServiceName + "\">" +
                "Handle: <INPUT TYPE=\"text\" NAME=\"" + HANDLE + "\" SIZE=\"15\"<BR>" +
                "Password: <INPUT TYPE=\"password\" NAME=\"" + PASSWORD + "\" SIZE=\"15\"<BR>" +
                "<INPUT TYPE=\"submit\" NAME=\"login_button\" VALUE=\"Login\"><BR>" +
                "</FORM></BODY></HTML>");
    }

    /**
     * Forwards to the navigation error page.
     *
     * @param request the servlet request object
     * @param response the servlet response object
     *
     * @throws javax.servlet.ServletException
     */
    private void forwardToErrorPage(HttpServletRequest request, HttpServletResponse response,
                                    Throwable exception, String message) throws ServletException, IOException {

        log.error("Controller error - forwarding to error page", exception);
        request.setAttribute("Exception", exception);
        if (message != null) request.setAttribute("message", message);
        /* get the root context so we can forward to the generic error page, not just
           one within this web application
         */
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(ERROR_PAGE)).forward(request, response);
    }
}
