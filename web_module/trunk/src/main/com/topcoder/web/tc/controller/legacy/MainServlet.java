package com.topcoder.web.tc.controller.legacy;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.common.web.data.User;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.*;
import java.util.zip.GZIPOutputStream;
import java.text.SimpleDateFormat;


public final class MainServlet extends HttpServlet {


    private HTMLRenderer htmlMaker;
    private static final String SESSION_TIMEOUT_PAGE = TCServlet.XSL_ROOT + "error/session_timeout.xsl";
    private static Logger log = Logger.getLogger(MainServlet.class);

    private static TCResourceBundle bundle = null;
    private static boolean xslCaching = false;


    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        if (htmlMaker == null) {
            htmlMaker = new HTMLRenderer();
        }
        super.init(config);
        bundle = new TCResourceBundle("ApplicationServer");
        xslCaching = new Boolean(bundle.getProperty("XSL_CACHING", "false")).booleanValue();

    }


    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getServerName().equals("topcoder.com")) {
            response.sendRedirect("http://www.topcoder.com/");
            return;
        }
        doPost(request, response);
    }


    private void goTo(String addr, HttpServletRequest request, HttpServletResponse response) {
        try {
            log.debug("goTo called...");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(addr);
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!xslCaching) {
            try {
                synchronized (this) {
                    htmlMaker.refresh();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        processCommands(request, response);
    }


    private void processCommands(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        ServletOutputStream o = null;
        OutputStream outputStream = null;
        GZIPOutputStream gzipStream = null;
        String HTMLString = null;
        Navigation nav = null;
        HttpSession session = null;
        XMLDocument document = null;
        boolean timedOut = false;
        String requestTask = null;
        String requestCommand = null;
        boolean responseWritten = false;
        try {
            // CHECK FOR SESSION TIMEOUT
            if (request.isRequestedSessionIdValid() == false && request.getRequestedSessionId() != null) {
                timedOut = true;
            }
            String loggedIn = Conversion.checkNull(request.getParameter("LoggedIn"));
            if (timedOut && loggedIn.equals("true")) {
                throw new NavigationException("Your session has been idle for more that 30 minutes.",
                        SESSION_TIMEOUT_PAGE);
            }
            // INIT SESSION AND XML DOCUMENT
            session = request.getSession(true);
            document = new XMLDocument("TC");
            nav = getNav(HttpObjectFactory.createRequest(request), response);
            addURLTags(nav, request, response, document);
            // NEED THE TASK TO SEE WHAT THE USER WANTS
            requestTask = request.getParameter("t");
            requestCommand = request.getParameter("c");
            if (requestTask==null)
                requestTask = Conversion.checkNull((String) request.getAttribute("t"));
            if (requestCommand==null)
                requestCommand = Conversion.checkNull((String) request.getAttribute("c"));
            String handle = "";
            if (nav.isIdentified()) {
                handle = Conversion.checkNull(nav.getSessionInfo().getHandle());
            }
            StringBuffer trail = new StringBuffer(1000);
            trail.append("[**** ");
            trail.append(requestTask);
            trail.append(" **** ");
            trail.append(requestCommand);
            trail.append(" **** ");
            trail.append(handle);
            trail.append(" **** ");
            trail.append(request.getRemoteHost());
            trail.append(" ****]");
            log.info(trail.toString());
            User user = nav.getUser();
            if (user==null)  {
                //user must have been transient and we got a navigation object that had been serialized at some point
                user = new User();
                nav.setUser(user);
            }
            if (nav.isLoggedIn()) {
                user.setLoggedIn("Y");
            } else {
                if (loggedIn.equals("true")) {
                    StringBuffer msg = new StringBuffer(200);
                    msg.append("MainServlet:processCommands:ERROR:");
                    msg.append("request indicates user is logged in, ");
                    msg.append("but the server session indicates otherwise.");
                    throw new NavigationException(msg.toString(), TCServlet.LOGGED_OUT_ERROR_PAGE);
                }
                user.setLoggedIn("N");
            }
            //we should be able to get away with isIdentified here cuz no xsl requires a true login
            document.addTag(new ValueTag("LoggedIn", String.valueOf(nav.isIdentified())));

            // USE THE 'TASK' PARAMETER FROM THE
            // INCOMING REQUEST TO DETERMINE
            // STATIC PROCESSOR TO USE TO CREATE THE
            // RESPONSE HTML. SOME WILL REQUIRE CHECK
            // FOR SESSION TIMEOUTS TO WARN USER.
            //************************ home ************************
            if (requestTask.equals("home")) {
                response.sendRedirect(response.encodeURL("http://" + request.getServerName() + "/tc"));
                return;
//                HTMLString = TaskHome.process(request, response, htmlMaker, nav, document);
            }
            //************************ home ************************
            else if (requestTask.equals("affidavit")) {
                HTMLString = TaskAffidavit.process(request, response, htmlMaker, nav, document);
            }
            //************************ sponsor ************************
            else if (requestTask.equals("sponsor")) {
                HTMLString = TaskSponsor.process(request, response, htmlMaker, nav, document);
            }
            //************************ time ************************
            else if (requestTask.equals("time")) {
                HTMLString = TaskTime.process(request, response, htmlMaker, nav, document);
            }
            //************************ pic ************************
            else if (requestTask.equals("pic")) {
                HTMLString = TaskPic.process(request, response, htmlMaker, nav, document);
            }
            //************************ schedule ************************
            else if (requestTask.equals("schedule")) {
                HTMLString = TaskSchedule.process(request, htmlMaker, nav, document);
            }
            //************************ jobs ************************
            else if (requestTask.equals("jobs")) {
                HTMLString = TaskJob.process(request, response, htmlMaker, nav, document);
            }
            //************************ arena ************************
            else if (requestTask.equals("arena")) {
                HTMLString = TaskArena.process(request, response, htmlMaker, nav, document);
            }
            //************************ development ************************
            else if (requestTask.equals("development")) {
                HTMLString = TaskDevelopment.process(request, response, htmlMaker, nav, document);
            }
            //************************ xsl cache refresh ************************
            else if (requestTask.equals("refresh_xsl")) {
                htmlMaker.refresh();
                response.setContentType("text/html");
                o = response.getOutputStream();
                o.write(Conversion.ipBytesToString(java.net.InetAddress.getLocalHost().getAddress()).getBytes());
                responseWritten = true;
            }
            //************************ statistics ************************
            else if (requestTask.equals("statistics") && requestCommand.equals("member_profile")) {
                //if we get a "old" version of a member_profile request, just send it off to the new version
                String coderId = Conversion.checkNull(request.getParameter("Coder_Id"));
                response.sendRedirect(response.encodeURL("http://" + request.getServerName() + "/stat?c=member_profile&cr=" + coderId));
                return;
            }
            //************************ image ************************
            else if (requestTask.equals("image")) {
                response.setContentType("image/gif");
                o = response.getOutputStream();
                o.write(TaskImage.process(request));
                responseWritten = true;
            }
            //************************ search ************************
            else if (requestTask.equals("search")) {
                HTMLString = TaskSearch.process(request, response, htmlMaker, nav, document);
            }
            //************************ static  ************************
            else if (requestTask.equals("") || requestCommand.equals("")) {
                response.sendRedirect(response.encodeURL("http://" + request.getServerName() + "/tc"));
                return;
            }
            else {
                HTMLString = TaskStatic.process(request, response, htmlMaker, nav, document);
            }
            // IF ANY OF THE PROCESSORS RETURN A STRING
            // OF "HOME" INSTEAD OF A RENDERED DOCUMENT,
            // REDIRECT TO HOMEPAGE.
            if (!responseWritten) {
                if (HTMLString.equals("home")) {
                    response.sendRedirect(response.encodeURL("http://" + request.getServerName()));
                } else if (HTMLString.startsWith("login~")) {
                    StringTokenizer params = new StringTokenizer(HTMLString, "~");
                    params.nextToken();
                    if (params.hasMoreTokens()) {
                        String temp = params.nextToken();
                        log.debug("redirecting to " + temp + " after login");
                        response.sendRedirect(temp);
                    }
                }
                String encode = request.getHeader("Accept-Encoding");
                if (
                        encode != null
                        && encode.indexOf("gzip") != -1
                ) {
                    outputStream = response.getOutputStream();
                    gzipStream = new GZIPOutputStream(outputStream);
                    response.setHeader("Content-Encoding", "gzip");
                    byte[] HTMLByte = asciiGetBytes(HTMLString);
                    gzipStream.write(HTMLByte);
                } else {
                    outputStream = response.getOutputStream();
                    byte[] HTMLByte = asciiGetBytes(HTMLString);
                    outputStream.write(HTMLByte);
                    //out = response.getWriter();
                    //out.print ( HTMLString );
                }
            }
        } catch (PermissionException pe) {
            log.debug("caught PermissionException");
            try {
                if (!nav.isLoggedIn()) {
                    /* forward to the login page, with a message and a way back */
                    request.setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name " +
                            "and password.");
                    request.setAttribute(BaseServlet.NEXT_PAGE_KEY, nav.getSessionInfo().getRequestString());

                    request.setAttribute("module", "Login");
                    fetchRegularPage(request, response, "/tc", true);
                    return;

                 } else {
                    log.info("already logged in, rethrowing");
                    throw pe;
                 }
            } catch (Exception e) {
                e.printStackTrace();
                try {
                    showInternalError(request, response);
                } catch (Exception end) {
                    try {
                        goTo("general_error.html", request, response);
                    } catch (Exception ignore) {
                    }
                }
            }
        } catch (NavigationException ne) {
            try {
                out = response.getWriter();
                ne.printStackTrace();
                if (nav == null) {
                    session = request.getSession(true);
                    nav = new Navigation(request, response);
                }
                if (document == null) {
                    document = new XMLDocument("TC");
                    addURLTags(nav, request, response, document);
                }
                document.addTag(new ValueTag("ErrorMsg", ne.getMessage()));
                document.addTag(new ValueTag("ErrorURL", Conversion.checkNull(ne.getErrorURL())));
                HTMLString = htmlMaker.render(document, ne.getUrl());
                out.print(HTMLString);
                log.debug("MainServlet:NAVIGATION ERROR:\n" + ne.getMessage());
            } catch (Exception neFail) {
                neFail.printStackTrace();
                try {
                    showInternalError(request, response);
                } catch (Exception end) {
                    try {
                        goTo("general_error.html", request, response);
                    } catch (Exception ignore) {
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                showInternalError(request, response);
            } catch (Exception end) {
                end.printStackTrace();
                try {
                    goTo("general_error.html", request, response);
                } catch (Exception ignore) {
                }
            }
        } finally {
            session = request.getSession(false);
            if (session != null && nav != null) {
                session.setAttribute("navigation", nav);
            }
            session = null;
            nav = null;
            document = null;
            if (gzipStream != null) {
                try {
                    gzipStream.finish();
                    gzipStream.flush();
                    gzipStream.close();
                } catch (Exception ignore) {
                    log.debug("gzipStream.finish() FAILED!!!");
                }
            }
        }
    }

    private Navigation getNav(TCRequest request, HttpServletResponse response) throws Exception {
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        if (nav==null) {
            nav = new Navigation(request, response);
        }
        TCResponse tcResponse = HttpObjectFactory.createResponse(response);
        WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, tcResponse, BasicAuthentication.MAIN_SITE);
        PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
        TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
        CoderSessionInfo info = new CoderSessionInfo(request, authentication, user.getPrincipals());
        nav.setCoderSessionInfo(info);
        request.getSession(true).setAttribute("navigation", nav);

        return nav;
    }

    protected final void fetchRegularPage(HttpServletRequest request, HttpServletResponse response, String dest,
                                  boolean forward) throws Exception {

        if (forward) {
            if (!dest.startsWith("/")) {
                dest = "/" + dest;
            }
            log.debug("forwarding to " + dest);
            getServletContext().getRequestDispatcher(response.encodeURL(dest)).forward(request, response);
        } else {
            log.debug("redirecting to " + dest);
            response.sendRedirect(response.encodeRedirectURL(dest));
        }
    }


    private void showInternalError(HttpServletRequest request, HttpServletResponse response)
            throws TCException {
        PrintWriter out = null;
        String HTMLString = null;
        XMLDocument document = null;
        Navigation nav = null;
        try {
            String requestTask = Conversion.checkNull(request.getParameter("t"));
            String requestCommand = Conversion.checkNull(request.getParameter("c"));
            nav = new Navigation(request, response);
            out = response.getWriter();
            StringBuffer msg = new StringBuffer();
            msg.append("\n***************");
            msg.append("\nINTERNAL ERROR:");
            msg.append("\n***************");
            msg.append("\nTask = ");
            msg.append(requestTask);
            msg.append("\nCommand = ");
            msg.append(requestCommand);
            msg.append("\nUserId = ");
            msg.append(nav.getUserId());
            try {
                msg.append("\nUserName = ");
                msg.append(nav.getUser().getHandle());
            } catch (Exception ignore) {
            }
            msg.append("\n***************");
            log.debug(msg.toString());
            document = new XMLDocument("TC");
            addURLTags(nav, request, response, document);
            HTMLString = htmlMaker.render(document, TCServlet.INTERNAL_ERROR_PAGE);
            out.print(HTMLString);
        } catch (Exception e) {
            throw new TCException("MainServlet.showInternalError:" + e.getMessage());
        }
    }


    /*********************************************************************************
     SETUP/CLEANING METHODS...
     *********************************************************************************/



    private void addURLTags(Navigation nav, HttpServletRequest request,
                            HttpServletResponse response, XMLDocument document) throws TCException {
        // ADD ALL XML TAGS BASIC TO ALL REQUESTS
        try {
            document.addTag(new ValueTag("CookiesEnabled", nav.cookiesEnabled(request, response)));
            document.addTag(new ValueTag("Host", request.getServerName()));
            document.addTag(new ValueTag("CorpHost", ApplicationServer.CORP_SERVER_NAME));
            document.addTag(new ValueTag("SoftwareHost", ApplicationServer.SOFTWARE_SERVER_NAME));
            document.addTag(new ValueTag("Task", Conversion.checkNull(request.getParameter("t"))));
            document.addTag(new ValueTag("Command", Conversion.checkNull(request.getParameter("c"))));
            SimpleDateFormat sdf = new SimpleDateFormat("MMMM d, yyyy");
            document.addTag(new ValueTag("Today", sdf.format(nav.getSessionInfo().getDate())));
            document.addTag(new ValueTag("MemberCount", nav.getSessionInfo().getMemberCount()));
            if (nav.isIdentified()) {
                document.addTag(new ValueTag("UserId", nav.getUserId()));
                document.addTag(new ValueTag("Handle", nav.getSessionInfo().getHandle()));
                document.addTag(new ValueTag("Rating", nav.getSessionInfo().getRating()));
                document.addTag(new ValueTag("Ranking", nav.getSessionInfo().getRank()));
                document.addTag(new ValueTag("HasImage", nav.getSessionInfo().hasImage()));
                document.addTag(new ValueTag("ActivationCode", nav.getSessionInfo().getActivationCode()));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("MainServlet:addURLTags:ERROR:\n" + e);
        }
    }

    // CUSTOM GET_BYTES BECAUSE THE PERFORMANCE OF String.getBytes() ROTS!!!
    public static byte[] asciiGetBytes(String s) {
        int size = s.length();
        byte[] result = new byte[size];
        for (int i = 0; i < size; i++) {
            result[i] = (byte) s.charAt(i);
        }
        return result;
    }


}
