/*
    CmDispatchServlet
    A Servlet to accept requests and forward them to the appropriate JSP.

    By John C. Bollinger
    Copyright 2002, TopCoder, Inc.
 */
package com.topcoder.web.render.servlet;

import javax.naming.AuthenticationException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Map;

public class CmDispatchServlet extends HttpServlet {
    /* the path to use for calling JSPs */
    static final String defaultJspPath = "/";
    String jspPath;

    public CmDispatchServlet() {
        super();
    }

    public void init() {
        /* get path for JSPs */
        String s = getInitParameter("jspPath");
        jspPath = (s == null) ? defaultJspPath : s;
        s = getInitParameter("previewPath");
        com.topcoder.web.render.bean.CmStateBean.previewPath = s;
        s = getInitParameter("previewLink");
        com.topcoder.web.render.bean.CmStateBean.previewLink = s;
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String qs = req.getQueryString();
        processRequest(req, resp, (qs == null) ? new Hashtable() :
                HttpUtils.parseQueryString(qs));
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        int cl = req.getContentLength();
        processRequest(req, resp, (cl <= 0) ? new Hashtable() :
                HttpUtils.parsePostData(cl, req.getInputStream()));
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp,
                                  Map parameters) throws IOException, ServletException {
        HttpSession ses = req.getSession(false);
        if (ses == null) {
            req.setAttribute("message", "Log in to use PageBuilder");
            forwardRequest(req, resp, "login");
        } else {
            Object obj = null;
            try {
                /* update the state bean */
                obj = ses.getAttribute("state");
                if (obj == null) {
                    /* this should never happen, but we recover semi-gracefully
                       if it does */
                    ses.invalidate();
                    req.setAttribute("message",
                            "Session information lost; please log in again.");
                    forwardRequest(req, resp, "login");
                } else {
                    com.topcoder.web.render.bean.CmStateBean state =
                            (com.topcoder.web.render.bean.CmStateBean) obj;
                    try {
                        state.processForm(parameters);
                        String[] message = (String[]) parameters.get("message");
                        if (message != null) req.setAttribute("message", message[0]);
                    } catch (AuthenticationException ae) {
                        ses.invalidate();
                        String[] message = (String[]) parameters.get("message");
                        req.setAttribute("message", (message == null || message.length < 1) ?
                                "Authentication Failed" : message[0]);
                        forwardRequest(req, resp, "login");
                    }

                    /* forward to requested resource */
                    String[] page = (String[]) parameters.get("page");
                    forwardRequest(req, resp, (page == null) ? "blank" : page[0],
                            (parameters.get("pageAsIs") != null));
                }
            } catch (IllegalStateException e) {
                /* redirect to the login page with appropriate message */
                req.setAttribute("message",
                        "Session expired -- please log in again:");
                forwardRequest(req, resp, "login");
            } catch (ClassCastException cce) { /* mostly a debugging tool */
                req.setAttribute("message", "Can't cast " + obj.getClass().getName() +
                        " to com.topcoder.web.render.bean.CmStateBean");
                forwardRequest(req, resp, "blank");
            }
        }
    }

    protected void forwardRequest(HttpServletRequest req,
                                  HttpServletResponse resp, String target)
            throws ServletException, IOException {
        forwardRequest(req, resp, target, false);
    }

    protected void forwardRequest(HttpServletRequest req,
                                  HttpServletResponse resp, String target, boolean targetAdorned)
            throws ServletException, IOException {
        if (target == null || target.length() == 0) target = "blank";
        RequestDispatcher rd = null;
        if (targetAdorned) {
            rd = getServletContext().getRequestDispatcher(target);
        } else {
            rd = getServletContext().getRequestDispatcher(jspPath + target + ".jsp");
        }
        if (rd == null)
            throw new ServletException("cannot obtain request dispatcher");
        resp.setHeader("Content-type", "text/html");
        req.setAttribute("dispatched", "true");
        rd.forward(req, resp);
    }

}
