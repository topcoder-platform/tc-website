package com.topcoder.web.servlet;

import com.topcoder.common.web.constant.TCServlet;
import com.topcoder.common.web.data.*;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.error.TCException;
import com.topcoder.common.web.util.*;
import com.topcoder.common.web.xml.ExcludeRange;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.Context;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.util.zip.GZIPOutputStream;


public final class TCSerlvet extends HttpServlet {


    private HTMLRenderer htmlMaker;
    private static final String SESSION_TIMEOUT_PAGE = TCServlet.XSL_ROOT + "session_timeout.xsl";
    private static final int MAX_REPLACEMENTS = 100;
    private static Logger log = Logger.getLogger(TCSerlvet.class);


    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        if (htmlMaker == null) {
            htmlMaker = new HTMLRenderer();
        }
        super.init(config);
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
        //==============================================================
        // REMOVE THIS CACHE REFRESH BLOCK AFTER TESTING COMPLETED...
        //==============================================================
        try {
            synchronized (this) {
                htmlMaker.refresh();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //==============================================================

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
        try {
            //referral
            if (request.getRequestURI().indexOf("/referral") != -1) {
                goTo("/index?t=about_tc&c=membr_referrals", request, response);
                return;
            }
            // CHECK FOR SESSION TIMEOUT
            if (request.isRequestedSessionIdValid() == false && request.getRequestedSessionId() != null) {
                timedOut = true;
            }
            String loggedIn = Conversion.checkNull(request.getParameter("LoggedIn"));
            if (timedOut && loggedIn.equals("true")) {
                throw new NavigationException("TCSerlvet:processCommands:ERROR:session timeout:", SESSION_TIMEOUT_PAGE);
            }
            // INIT SESSION AND XML DOCUMENT
            session = request.getSession(true);
            document = new XMLDocument("TC");
            nav = setupSession(request, response, session);
            addURLTags(nav, request, response, document);
            // NEED THE TASK TO SEE WHAT THE USER WANTS
            requestTask = Conversion.checkNull(request.getParameter("t"));
            requestCommand = Conversion.checkNull(request.getParameter("c"));
            String handle = "";
            if (nav.getUser() != null) {
                handle = Conversion.checkNull(nav.getUser().getHandle());
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
            User user = null;
            if (nav.getUser() == null) {
                user = new User();
                nav.setUser(user);
            } else {
                user = nav.getUser();
            }
            if (nav.getLoggedIn() && ProcessAuthentication.hasMinimumPermission(user)) {
                // CHECK TO SEE IF THE SERIALIZED NAV OBJECT
                // IN SESSION HAS LOGGED IN ATTRIB = TRUE.
                // IF THE USER'S SESSION INDICATES LOGGED IN,
                // BUT THE NON-SERIALIZABLE USER OBJECT INFO
                // IS MISSING, THE OTHER SERVER IN THE
                // CLUSTER MUST HAVE CRAPPED OUT.
                // IN THAT CASE RELOAD THE USER FROM
                // THE USER ENTITY BEAN (DATABASE).
                if (user.getUserId() == 0) {
                    Context ctx = null;
                    try {
                        StringBuffer msg = new StringBuffer(250);
                        msg.append("TCSerlvet: logged in user found with no user attributes:\n");
                        msg.append("TCSerlvet: user id = ");
                        msg.append(nav.getUserId());
                        msg.append("\n");
                        msg.append("TCSerlvet: Loading user attributes from user entity bean...");
                        log.debug(msg.toString());
                        ctx = TCContext.getInitial();
                        UserServicesHome userHome = (UserServicesHome) ctx.lookup("UserServicesHome");
                        UserServices userEJB = (UserServices) userHome.findByPrimaryKey(new Integer(nav.getUserId()));
                        user = userEJB.getUser();
                        nav.setUser(user);
                        log.debug("TCSerlvet: user loaded from entity bean");
                    } catch (Exception e) {
                        throw new NavigationException("TCSerlvet:processCommands:ERROR READING DATABASE\n" + e, TCServlet.INTERNAL_ERROR_PAGE);
                    } finally {
                        if (ctx != null) {
                            try {
                                ctx.close();
                            } catch (Exception ignore) {
                            }
                        }
                    }
                }
                user.setLoggedIn("Y");
                document.addTag(new ValueTag("LoggedIn", "true"));
            } else {
                if (loggedIn.equals("true")) {
                    StringBuffer msg = new StringBuffer(200);
                    msg.append("TCSerlvet:processCommands:ERROR:");
                    msg.append("request indicates user is logged in, ");
                    msg.append("but the server session indicates otherwise.");
                    throw new NavigationException(msg.toString(), TCServlet.LOGGED_OUT_ERROR_PAGE);
                }
                user.setLoggedIn("N");
            }
            // USE THE 'TASK' PARAMETER FROM THE
            // INCOMING REQUEST TO DETERMINE
            // STATIC PROCESSOR TO USE TO CREATE THE
            // RESPONSE HTML. SOME WILL REQUIRE CHECK
            // FOR SESSION TIMEOUTS TO WARN USER.
            //************************ authenitcation ************************
            if (requestTask.equals("authentication")) {
                HTMLString = TaskAuthentication.process(request, response, htmlMaker, nav, document);
                if (HTMLString.equals("logout")) {
                    nav = null;
                    document = new XMLDocument("TC");
                    session = request.getSession(true);
                    nav = setupSession(request, response, session);
                    addURLTags(nav, request, response, document);
                    HTMLString = "home";
                }
            }
            //************************ home ************************
            else if (requestTask.equals("home")) {
                HTMLString = TaskHome.process(request, response, htmlMaker, nav, document);
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
                o.write(TaskImage.process(request, response, nav));
            }
            //************************ search ************************
            else if (requestTask.equals("search")) {
                HTMLString = TaskSearch.process(request, response, htmlMaker, nav, document);
            }
            //************************ static  ************************
            else {
                // begin disgusting burrows hoke
                if (requestTask.equals("statistics") && requestCommand.equals("index")) {
                    DataAccessInt dai = null;
                    RequestInt dataRequest = null;
                    ResultSetContainer rsc = null;
                    Map resultMap = null;

                    dataRequest = new Request();
                    dai = new CachedDataAccess((javax.sql.DataSource)TCContext.getInitial().lookup(DBMS.DW_DATASOURCE_NAME));
                    dataRequest.setProperty("c", "top_room_winners");
                    dataRequest.setProperty("dn", "1");
                    dataRequest.setProperty("sr", "1");
                    dataRequest.setProperty("er", "3");   // just get the top 3
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Room_Winners");
                    document.addTag(rsc.getTag("Div1RoomWinners", "RoomWinner"));

                    dataRequest = new Request();
                    dataRequest.setProperty("c", "top_room_winners");
                    dataRequest.setProperty("dn", "2");
                    dataRequest.setProperty("sr", "1");
                    dataRequest.setProperty("er", "3");   // just get the top 3
                    resultMap = dai.getData(dataRequest);
                    rsc = (ResultSetContainer) resultMap.get("Top_Room_Winners");
                    document.addTag(rsc.getTag("Div2RoomWinners", "RoomWinner"));
                    // end disgusting burrows hoke

                }
                HTMLString = TaskStatic.process(request, response, htmlMaker, nav, document);
            }
            // IF ANY OF THE PROCESSORS RETURN A STRING
            // OF "HOME" INSTEAD OF A RENDERED DOCUMENT,
            // REDIRECT TO HOMEPAGE.
            if (!requestTask.equals("forum") && !requestTask.equals("graph") && !requestTask.equals("download") && !requestTask.equals("image")) {
                if (HTMLString.equals("home")) {
                    response.sendRedirect(response.encodeURL("http://" + request.getServerName()));
                } else if (HTMLString.startsWith("login~")) {
                    StringTokenizer params = new StringTokenizer(HTMLString, "~");
                    params.nextToken();
                    if (params.hasMoreTokens()) {
                        response.sendRedirect(params.nextToken());
                    }
                } else {
                    if (!nav.cookiesEnabled(request, response)) {
                        if (!requestTask.equals("arena")) {
                            HTMLString = appendSessionIdToURL(HTMLString, request, response);
                        }
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
        } catch (NavigationException ne) {
            try {
                out = response.getWriter();
                ne.printStackTrace();
                if (nav == null) {
                    session = request.getSession(true);
                    nav = setupSession(request, response, session);
                }
                if (document == null) {
                    document = new XMLDocument("TC");
                    addURLTags(nav, request, response, document);
                }
                document.addTag(new ValueTag("ErrorMsg", ne.getMessage()));
                document.addTag(new ValueTag("ErrorURL", Conversion.checkNull(ne.getErrorURL())));
                HTMLString = htmlMaker.render(document, ne.getUrl());
                if (!nav.cookiesEnabled(request, response)) {
                    HTMLString = appendSessionIdToURL(HTMLString, request, response);
                }
                out.print(HTMLString);
                log.debug("TCSerlvet:NAVIGATION ERROR:\n" + ne.getMessage());
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


    private void showInternalError(HttpServletRequest request, HttpServletResponse response)
            throws TCException {
        PrintWriter out = null;
        String HTMLString = null;
        XMLDocument document = null;
        HttpSession session = null;
        Navigation nav = null;
        try {
            String requestTask = Conversion.checkNull(request.getParameter("t"));
            String requestCommand = Conversion.checkNull(request.getParameter("c"));
            session = request.getSession(true);
            nav = setupSession(request, response, session);
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
            if (!nav.cookiesEnabled(request, response)) {
                HTMLString = appendSessionIdToURL(HTMLString, request, response);
            }
            out.print(HTMLString);
        } catch (Exception e) {
            throw new TCException("TCSerlvet.showInternalError:" + e.getMessage());
        }
    }


    /*********************************************************************************
     SETUP/CLEANING METHODS...
     *********************************************************************************/


    private Navigation setupSession(HttpServletRequest request,
                                    HttpServletResponse response, HttpSession session)
            throws TCException {
        Navigation result = null;
        try {
            // SET THE CONTENT TYPE OF THE RESPONSE
            response.setContentType("text/html");
            // GET/SET ALL BROWSER INFO
            String appName = Conversion.checkNull(request.getParameter("AppName"));
            Browser browser = null;
            if (session.getAttribute("navigation") == null) {
                result = new Navigation();
                browser = new Browser();
                browser.setAppName(appName);
                browser.setAppVersion(Conversion.checkNull(request.getParameter("AppVersion")));
                browser.setUserAgent(Conversion.checkNull(request.getParameter("UserAgent")));
                result.setBrowser(browser);
            } else {
                result = (Navigation) session.getAttribute("navigation");
                browser = result.getBrowser();
                if (!appName.equals("") && browser.getAppName().equals("")) {
                    browser.setAppName(appName);
                    browser.setAppVersion(Conversion.checkNull(request.getParameter("AppVersion")));
                    browser.setUserAgent(Conversion.checkNull(request.getParameter("UserAgent")));
                }
            }
        } catch (Exception e) {
            throw new TCException("TCSerlvet:setupSession:ERROR:\n" + e);
        }
        return result;
    }

    private void addURLTags(Navigation nav, HttpServletRequest request,
                            HttpServletResponse response, XMLDocument document) throws TCException {
        // ADD ALL XML TAGS BASIC TO ALL REQUESTS
        try {
            document.addTag(new ValueTag("CookiesEnabled", nav.cookiesEnabled(request, response)));
            document.addTag(new ValueTag("Host", request.getServerName()));
            document.addTag(new ValueTag("Task", Conversion.checkNull(request.getParameter("t"))));
            document.addTag(new ValueTag("Command", Conversion.checkNull(request.getParameter("c"))));
            document.addTag(new ValueTag("Today", DateTime.getCurrentDate().getTime()));
            DataCache cache = Cache.get();
            document.addTag(new ValueTag("MemberCount", cache.getMemberCount()));
            if (nav.getLoggedIn() && ProcessAuthentication.hasMinimumPermission(nav.getUser())) {
                document.addTag(new ValueTag("UserId", nav.getUser().getUserId()));
                document.addTag(new ValueTag("Handle", nav.getUser().getHandle()));
                HashMap userTypeDetails = nav.getUser().getUserTypeDetails();
                CoderRegistration reg = null;
                if (userTypeDetails.containsKey("Coder")) {
                    reg = (CoderRegistration) userTypeDetails.get("Coder");
                    document.addTag(new ValueTag("Rating", reg.getRating().getRating()));
                    document.addTag(new ValueTag("Ranking", reg.getRanking()));
                    document.addTag(new ValueTag("HasImage", reg.getHasImage()));
                    document.addTag(new ValueTag("ActivationCode", reg.getActivationCode()));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new TCException("TCSerlvet:addURLTags:ERROR:\n" + e);
        }
    }


    /*********************************************************************************
     COOKIES DISABLED METHODS (FOR REQUESTS WITH COOKIES TURNED OFF...)
     *********************************************************************************/


    private String appendSessionIdToURL(String HTMLString, HttpServletRequest request,
                                        HttpServletResponse response) throws TCException {
        log.debug("***TCSerlvet.appendSessionIdToURL:replaceURL:***");
        StringBuffer msg = null;
        msg = new StringBuffer(350);
        msg.append("  :Task=");
        msg.append(Conversion.checkNull(request.getParameter("t")));
        msg.append("\n  :Command=");
        msg.append(Conversion.checkNull(request.getParameter("c")));
        log.debug(msg.toString());
        // ONLY CALL THIS METHOD IF
        // COOKIES ARE TURNED OFF
        // ON A CACHED PAGE.  NEED TO ADD
        // SESSION ID TO ALL LINKS TO KEEP SESSION.
        // CREATE A SORTED TREESET THAT CONTAINS
        // RANGES TO EXCLUDE FROM REPEAT
        // REPLACEMENT CALLS
        TreeSet excludes = new TreeSet();
        // REPLACE URLs WITH URL+SESSION IDs
        String[] cookieURL = {
            "://" + request.getServerName() + "/stat"
            , "://" + request.getServerName() + "/reg"
            , "://" + request.getServerName() + "/rtables/index.jsp"
            , "://" + request.getServerName() + "/corporate"
            , "://" + request.getServerName() + "/rtables/viewForum.jsp"
            , "://" + request.getServerName() + "/contest/arena/launch.html"
            , "://" + request.getServerName() + "/contest/time.html"
        };
        String[] noCookieURL = {
            response.encodeURL("://" + request.getServerName() + "/stat")
            , response.encodeURL("://" + request.getServerName() + "/reg")
            , response.encodeURL("://" + request.getServerName() + "/rtables/index.jsp")
            , response.encodeURL("://" + request.getServerName() + "/corporate")
            , response.encodeURL("://" + request.getServerName() + "/rtables/viewForum.jsp")
            , response.encodeURL("://" + request.getServerName() + "/contest/arena/launch.html")
            , response.encodeURL("://" + request.getServerName() + "/contest/time.html")
        };

        try {
            for (int i = 0; i < cookieURL.length; i++) {
                // REPLACE URLS
                if (msg != null) {
                    msg.delete(0, 350);
                    msg.append("  :cookieURL=");
                    msg.append(cookieURL[i]);
                    msg.append(" [ len = ");
                    msg.append(cookieURL[i].length());
                    msg.append(" ]\n  :noCookieURL=");
                    msg.append(noCookieURL[i]);
                    msg.append(" [ len = ");
                    msg.append(noCookieURL[i].length());
                    msg.append(" ]");
                    log.debug(msg.toString());
                }
                //
                HTMLString = replaceURL(HTMLString, cookieURL[i], noCookieURL[i], excludes);
                for (Iterator j = excludes.iterator(); j.hasNext();) {
                    ExcludeRange range = (ExcludeRange) j.next();
                    log.debug("[" + range.getStart() + "," + range.getEnd() + "]");
                }
            }
        } catch (Exception e) {
            throw new TCException("TCSerlvet:appendSessionIdToURL:ERROR:\n" + e);
        }
        return HTMLString;
    }


    private boolean excluded(TreeSet excludes, int pos) {
        // RETURN TRUE IF THE URL LOCATION HAS
        // ALREADY BEEN REPLACED IN THE DOCUMENT.
        boolean result = false;
        for (Iterator i = excludes.iterator(); i.hasNext();) {
            ExcludeRange range = (ExcludeRange) i.next();
            if (pos < range.getEnd()) {
                log.debug(" pos is less than " + range.getEnd());
                if (pos > (range.getStart() - 1)) {
                    result = true;
                    break;
                }
            }
        }
        return result;
    }


    private void shiftExcludeRanges(TreeSet excludes, int startPos, int num) {
        // NEED TO SHIFT REMAINING LOCATIONS
        // AFTER A REPLACE.
        for (Iterator i = excludes.iterator(); i.hasNext();) {
            ExcludeRange range = (ExcludeRange) i.next();
            if (range.getStart() > startPos) {
                range.shift(num);
            }
        }
    }


    private String replaceURL(String HTMLString, String cookieOnURL, String cookieOffURL, TreeSet excludes)
            throws TCException {
        // REPLACE URLs WITH URL+SESSION IDs
        // FOR USERS WITH COOKIES TURNED OFF.
        String result = HTMLString;
        try {
            int cookieOnURLPos = HTMLString.indexOf(cookieOnURL);
            // if the URL is found ,start process to replace it with URL+SessionId (cookieOffURL)
            if (cookieOnURLPos > -1) {
                int cookieOnURLLen = cookieOnURL.length();
                int cookieOffURLLen = cookieOffURL.length();
                // replace first instance of URL with URL+SessionId
                StringBuffer buf = new StringBuffer(HTMLString);
                if (!excluded(excludes, cookieOnURLPos)) {
                    buf = buf.replace(cookieOnURLPos, cookieOnURLPos + cookieOnURLLen, cookieOffURL);
                    excludes.add(new ExcludeRange(cookieOnURLPos, cookieOnURLPos + cookieOffURLLen));
                    shiftExcludeRanges(excludes, cookieOnURLPos + cookieOnURLLen, cookieOffURLLen - cookieOnURLLen);
                }
                int loopCount = 0;
                // look for 2nd URL
                cookieOnURLPos = buf.toString().indexOf(cookieOnURL, cookieOnURLPos + cookieOffURLLen);
                // if more URLs exists, loop to replace them all with URL+SessionId...
                for (; cookieOnURLPos > -1; cookieOnURLPos = buf.toString().indexOf(cookieOnURL, cookieOnURLPos + cookieOffURLLen)) {
                    if (!excluded(excludes, cookieOnURLPos)) {
                        buf = buf.replace(cookieOnURLPos, cookieOnURLPos + cookieOnURLLen, cookieOffURL);
                        excludes.add(new ExcludeRange(cookieOnURLPos, cookieOnURLPos + cookieOffURLLen));
                        shiftExcludeRanges(excludes, cookieOnURLPos + cookieOnURLLen, cookieOffURLLen - cookieOnURLLen);
                    }
                    // keep count of loop to avoid possibility of infinite loop...
                    loopCount++;
                    if (loopCount > MAX_REPLACEMENTS) {
                        StringBuffer msg = new StringBuffer(100);
                        msg.append("TCSerlvet:replaceURL:ERROR:");
                        msg.append(Integer.toString(MAX_REPLACEMENTS));
                        msg.append(" max replacements exceeded.");
                        throw new TCException(msg.toString());
                    }
                }
                result = buf.toString();
            }
        } catch (Exception e) {
            throw new TCException("TCSerlvet:replaceURL:ERROR:\n" + e);
        }
        return result;
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
