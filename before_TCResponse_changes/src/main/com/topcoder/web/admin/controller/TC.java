package com.topcoder.web.admin.controller;


import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.error.NavigationException;
import com.topcoder.common.web.util.Conversion;
import com.topcoder.common.web.xml.HTMLRenderer;
import com.topcoder.shared.docGen.xml.ValueTag;
import com.topcoder.shared.docGen.xml.XMLDocument;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.admin.task.*;
import com.topcoder.web.admin.XSLConstants;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.TCSAuthorization;
import com.topcoder.web.common.TCRequestFactory;
import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.naming.Context;
import java.io.IOException;
import java.io.PrintWriter;

public final class TC extends HttpServlet {


    private HTMLRenderer renderer = null;
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
/*
        try {
            synchronized (this) {
                renderer.refresh();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
*/
        processCommands(request, response);
    }


    private void processCommands(HttpServletRequest request, HttpServletResponse response) {
        PrintWriter out = null;
        String html = null;
        Navigation nav = null;
        HttpSession session = null;
        XMLDocument document = null;
        try {
            // INIT SESSION AND XML DOCUMENT
            session = request.getSession(true);
            document = new XMLDocument("TC");
            nav = setupSession(response, session);
            addURLTags(request, document);
            // NEED THE TASK TO SEE WHAT THE USER WANTS
            String requestTask = Conversion.checkNull(request.getParameter("Task"));
            String requestCommand = Conversion.checkNull(request.getParameter("Command"));
            log.info("ADMIN ***** " + requestTask + " ***** " + requestCommand);
            //************************ no task ************************
            if (isAdmin(request, response)) {
                if (requestTask.equals("")) {
                    if (requestCommand.equals("")) {
                        html = Home.process(request, response, renderer, nav, document);
                    } else {
                        html = renderer.render(document, XSLConstants.DIR + requestCommand);
                    }
                }
                //************************ challenge ************************
                else if (requestTask.equals("challenge")) {
                    html = Challenge.process(request, response, renderer, nav, document);
                }
                //************************ compilation ************************
                else if (requestTask.equals("compilation")) {
                    html = Compilation.process(request, response, renderer, nav, document);
                } else {
                        StringBuffer msg = new StringBuffer(150);
                        msg.append("com.topcoder.web.admin.controller.TC:processCommands:ERROR:invalid task:");
                        msg.append(requestTask);
                        msg.append(":\n");
                        throw new NavigationException(
                                msg.toString()
                                , XSLConstants.NAVIGATION_ERROR_URL
                        );
                    }
                out = response.getWriter();
                out.print(html);
                out.flush();
            } else {
                Login processor = new Login();
                processor.process(request, response);
                log.debug("forwarding to " + processor.getNextPage());
                if(processor.isPageInContext()) {
                    getServletContext().getRequestDispatcher(response.encodeURL(processor.getNextPage())).forward(request, response);
                } else {
                    response.sendRedirect(response.encodeRedirectURL(processor.getNextPage()));
                }
            }
        } catch (NavigationException ne) {
            try {
                out = response.getWriter();
                ne.printStackTrace();
                if (nav == null) {
                    session = request.getSession(true);
                    nav = setupSession(response, session);
                }
                if (document == null) {
                    document = new XMLDocument("TC");
                    addURLTags(request, document);
                }
                html = renderer.render(document, ne.getUrl());
                out.print(html);
                out.flush();
                log.error("com.topcoder.web.admin.controller.TC:NAVIGATION ERROR:\n" + ne.getMessage());
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
                    nav = setupSession(response, session);
                }
                if (document == null) {
                    document = new XMLDocument("TC");
                    addURLTags(request, document);
                }
                html = renderer.render(document, XSLConstants.INTERNAL_ERROR_URL);
                out.print(html);
                out.flush();
                log.error("com.topcoder.web.admin.controller.TC:INTERNAL ERROR:\n" + e);
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


    private Navigation setupSession(HttpServletResponse response,HttpSession session) throws Exception {
        Navigation result = null;
        try {
            response.setContentType("text/html");
            if (session.getAttribute("navigation") == null) {
                result = new Navigation();
            } else {
                result = (Navigation) session.getAttribute("navigation");
            }
        } catch (Exception e) {
            throw new Exception("com.topcoder.web.admin.controller.TC:setupSession:ERROR:\n" + e);
        }
        return result;
    }


    private void addURLTags(HttpServletRequest request, XMLDocument document) throws Exception {
        try {
            document.addTag(new ValueTag("AdminURL", "/admin"));
            document.addTag(new ValueTag("Host", request.getServerName()));
        } catch (Exception e) {
            throw new Exception("com.topcoder.web.admin.controller.TC:addURLTags:ERROR:\n" + e);
        }
    }


    private boolean isAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        WebAuthentication authToken = new BasicAuthentication(new SessionPersistor(request.getSession()), TCRequestFactory.createRequest(request), response, BasicAuthentication.MAIN_SITE);
        Context ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
        PrincipalMgrRemoteHome principalMgrHome = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
        PrincipalMgrRemote principalMgr = principalMgrHome.create();
        TCSubject user = principalMgr.getUserSubject(authToken.getActiveUser().getId());
        TCSAuthorization authorization = new TCSAuthorization(user);
        log.debug("groups: " + authorization.getGroups().toString());
        boolean isAdmin = authorization.getGroups().contains("Admin");
        log.debug(String.valueOf(authToken.getActiveUser().getId()) + (isAdmin?" is":" is not") + " an admin");
        return isAdmin;
    }


}
