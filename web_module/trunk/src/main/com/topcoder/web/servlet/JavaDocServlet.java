package com.topcoder.web.servlet;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.ejb.JavaDocServices.*;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.naming.InitialContext;

/**
 * A servlet to get java docs from the ProblemServicesBean.
 *
 * @author Tim Bulat
 */
public final class JavaDocServlet extends HttpServlet {

    private static Logger log = Logger.getLogger(JavaDocServlet.class);
    private static final String ERROR_PAGE = "/errorPage.jsp";
    private static final String SERVLET_NAME = "JavaDocServlet";
    private static final String WEB_SERVICE_NAME = "webServiceName";
    private static final String PATH = "path";
    private static final String PASSWORD = "password";
    private static final String HANDLE = "handle";

    private JavaDocServices services = null;

    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("Initializing JavaDocServlet");
        super.init(config);
    }

    private void getServices() {
        try {
            log.info("JavaDocServlet getting JavaDocServices...");
            InitialContext ctx = (InitialContext)TCContext.getInitial();
            JavaDocServicesHome home =
                (JavaDocServicesHome) ctx.lookup(ApplicationServer.JAVA_DOC_SERVICES);
            services = home.create();
            log.info("...successful");
        } catch(Exception e) {
            log.error("Error getting JavaDocServices:", e);
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

        if(services == null) {
            getServices();
            if(services == null) {
                forwardToErrorPage(request, response, null, "Cannot get JavaDocServices bean.");
                return;
            }
        }

        StringBuffer out = new StringBuffer();
        String webServiceName = request.getParameter(WEB_SERVICE_NAME);
        String path = request.getParameter(PATH);
        String password = request.getParameter(PASSWORD);
        String handle = request.getParameter(HANDLE);
        log.info("webServiceName = " + webServiceName + ", path = " + path + ", password = " + password + ", handle = " + handle);

        if(webServiceName == null) {
            forwardToErrorPage(request, response, null, "A webServiceName property must be set.");
            return;
        }

        //is the user logged in and able to view this web service?
        HttpSession session = request.getSession();
        Object obj = session.getAttribute(webServiceName);
        boolean showPage = false;
        if(obj == null) {
            log.info("Not logged in.");
            //the user is not logged in

            if(password == null || handle == null) {
                //the user has not yet tried to login
                log.info("Hasn't tried to log in.");
                writeLoginHtml(out, webServiceName);
            } else {

                //try to authenticate the user
                log.info("Has tried to login, will try to authenticate.");
                String error = "";

                try {
                    error = services.authenticateUserForWebService(handle, password, webServiceName);
                } catch(Exception e) {
                    log.error("Error authenticating " + handle);
                    forwardToErrorPage(request, response, e, "Error using JavaDocServices to authenticate user.");
                    return;
                }

                if(error.length() != 0) {
                    log.info("Invalid login: " + error);
                    //invalid login
                    writeLoginHtmlWithError(out, webServiceName, error);
                } else {
                    log.info("Good login.");
                    //good login
                    session.setAttribute(webServiceName, Boolean.TRUE);
                    showPage = true;
                }
            }
        } else {
            //user is already logged in
            showPage = true;
        }

        if(showPage) {
            //the user is logged in, get the file specified by path
            log.info("Showing page.");

            //fill in the path if there isn't one 
            if(path == null || path.length() == 0) {
                path = "index.html";
            }

            String file = null;

            try {
                file = services.getFile(webServiceName, path);
            } catch(Exception e) {
                log.error("Error getting " + path + " for " + webServiceName);
                forwardToErrorPage(request, response, e, "Error using JavaDocServices to get file.");
                return;
            }
            log.info("file = " + file);

            //fix the links in the file to start with "JavaDocServlet?webServiceName=name&"
//              file = HTMLLinkChanger.preppendToAllAddresses(SERVLET_NAME + "?" + 
//                        WEB_SERVICE_NAME + "=" + webServiceName + "&");
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

        if(error.length() > 0) {
            out.append(
                "<HR><FONT COLOR=\"red\">Login Error: " + error + "</FONT><HR>");
        }

        out.append(
                "Please login to view the java docs for " + webServiceName + ".<P>" +
                "<FORM NAME=\"login_form\" METHOD=\"post\" ACTION=\"" + SERVLET_NAME + "?" + WEB_SERVICE_NAME + "="+webServiceName+\"">" +
                "Handle: + <INPUT TYPE=\"text\" NAME=\"" + PASSWORD + "\" SIZE=\"15\"<BR>" +
                "Password: + <INPUT TYPE=\"password\" NAME=\"" + HANDLE + "\" SIZE=\"15\"<BR>" +
                "<INPUT TYPE=\"submit\" NAME=\"login_button\" VALUE=\"Login\"><BR>" + 
                "</FORM></BODY></HTML>");
    }

    /**
     * Forwards to the navigation error page.
     *
     * @param HttpServletRequest    the servlet request object
     * @param HttpServletResponse    the servlet response object
     *
     * @throws ServletException
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
