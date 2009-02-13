package com.topcoder.web.servlet.admin;


import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.servlet.admin.task.Home;
import com.topcoder.web.servlet.admin.task.coder.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public final class TC extends HttpServlet {


    private HTMLRenderer renderer = null;
    private static final int MAX_REPLACEMENTS = 100;
    private static Logger log = Logger.getLogger(TC.class);


    public synchronized void init(ServletConfig config) throws ServletException {
        log.debug("SERVLET INIT CALLED");
        if (renderer == null) {
            renderer = new HTMLRenderer();
        }
        super.init(config);
    }


    public final void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // HATE CACHING!!!!!!!

        try {
            synchronized (this) {
                renderer.refresh();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        processCommands(request, response);
    }


    private void processCommands(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        String html = null;
        Navigation nav = null;
        HttpSession session = null;
        XMLDocument document = null;
        boolean timedOut = false;
        try {
            // CHECK FOR SESSION TIMEOUT
            if (request.isRequestedSessionIdValid() == false && request.getRequestedSessionId() != null) {
                timedOut = true;
            }
            // INIT SESSION AND XML DOCUMENT
            session = request.getSession(true);
            document = new XMLDocument("TC");
            nav = setupSession(request, response, session);
            addURLTags(nav, request, response, document);
            // NEED THE TASK TO SEE WHAT THE USER WANTS
            String requestTask = Conversion.checkNull(request.getParameter("Task"));
            String requestCommand = Conversion.checkNull(request.getParameter("Command"));
            log.info("ADMIN ***** " + requestTask + " ***** " + requestCommand);
            //************************ no task ************************
            if (requestTask.equals("")) {
                if (requestCommand.equals("")) {
                    html = Home.process(request, response, renderer, nav, document);
                } else {
                    html = renderer.render(document, XSL.DIR + requestCommand);
                }
            }
            //************************ request ************************
/*
      else if ( requestTask.equals("request") ) {
        html = admin.task.corp.Request.process ( request, response, renderer, nav, document );
      }
*/
            //************************ contest ************************
/*
      else if ( requestTask.equals("contest") ) {
        html = admin.task.coder.Contest.process ( request, response, renderer, nav, document );
      }
*/
            //************************ systemtestcasereport ************************
            else if (requestTask.equals("systemtestcasereport")) {
                html = SystemTestCaseReport.process(request, response, renderer, nav, document);
            }
            //************************ challenge ************************
            else if (requestTask.equals("challenge")) {
                html = Challenge.process(request, response, renderer, nav, document);
            }
            //************************ problems ************************
            else if (requestTask.equals("problems")) {
                //html = admin.task.util.PProblem.process ( request, response, renderer, nav, document );
            }

            //************************ cache ************************
/*
      else if ( requestTask.equals("cache") ) {
        html = admin.task.util.Cache.process ( request, response, renderer, nav, document );
      }
*/
            //************************ report ************************
/*
      else if ( requestTask.equals("report") ) {
        html = admin.task.report.Report.process ( request, response, renderer, nav, document );
      }
*/
            //************************ compilation ************************
            else if (requestTask.equals("compilation")) {
                html = Compilation.process(request, response, renderer, nav, document);
            }
            //************************ contact mail ************************
/*
      else if ( requestTask.equals("contact_mail") ) {
        html = admin.task.coder.ContactUs.process ( request, response, renderer, nav, document );
      }
*/
            //************************ invalid ************************
            else {
                StringBuffer msg = new StringBuffer(150);
                msg.append("com.topcoder.web.servlet.admin.TC:processCommands:ERROR:invalid task:");
                msg.append(requestTask);
                msg.append(":\n");
                throw new NavigationException(
                        msg.toString()
                        , XSL.NAVIGATION_ERROR_URL
                );
            }
            out = response.getWriter();
            out.print(html);
            out.flush();
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
                html = renderer.render(document, ne.getUrl());
                out.print(html);
                out.flush();
                log.error("com.topcoder.web.servlet.admin.TC:NAVIGATION ERROR:\n" + ne.getMessage());
            } catch (Exception end) {
                end.printStackTrace();
                try {
                    response.sendRedirect("/general_error.html");
                } catch (Exception ignore) {
                }
            }
        } catch (Exception e) {
            try {
                out = response.getWriter();
                e.printStackTrace();
                if (nav == null) {
                    session = request.getSession(true);
                    nav = setupSession(request, response, session);
                }
                if (document == null) {
                    document = new XMLDocument("TC");
                    addURLTags(nav, request, response, document);
                }
                html = renderer.render(document, XSL.INTERNAL_ERROR_URL);
                out.print(html);
                out.flush();
                log.error("com.topcoder.web.servlet.admin.TC:INTERNAL ERROR:\n" + e);
            } catch (Exception end) {
                end.printStackTrace();
                try {
                    response.sendRedirect("/general_error.html");
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
            if (out != null) {
                try {
                    out.close();
                    out = null;
                } catch (Exception end) {
                    end.printStackTrace();
                    try {
                        response.sendRedirect("/general_error.html");
                    } catch (Exception ignore) {
                    }
                }
            }
        }
    }


    private Navigation setupSession(HttpServletRequest request, HttpServletResponse response,
                                    HttpSession session) throws Exception {
        Navigation result = null;
        try {
            response.setContentType("text/html");
            if (session.getAttribute("navigation") == null) {
                result = new Navigation();
            } else {
                result = (Navigation) session.getAttribute("navigation");
            }
        } catch (Exception e) {
            throw new Exception("com.topcoder.web.servlet.admin.TC:setupSession:ERROR:\n" + e);
        }
        return result;
    }


    private void addURLTags(Navigation nav, HttpServletRequest request,
                            HttpServletResponse response, XMLDocument document) throws Exception {
        // ADD ALL XML TAGS BASIC TO ALL REQUESTS
        try {
            document.addTag(
                    new ValueTag(
                            "AdminURL"
                            , nav.getAdminURL(request, response)
                    )
            );
            document.addTag(
                    new ValueTag(
                            "Host"
                            , request.getServerName()
                    )
            );
        } catch (Exception e) {
            throw new Exception("com.topcoder.web.servlet.admin.TC:addURLTags:ERROR:\n" + e);
        }
    }


}
