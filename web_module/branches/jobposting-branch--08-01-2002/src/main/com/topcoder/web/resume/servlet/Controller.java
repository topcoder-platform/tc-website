package com.topcoder.web.resume.servlet;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.resume.bean.ResumeTask;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;

public class Controller
        extends HttpServlet {
    private static Logger log = Logger.getLogger(Controller.class);
//    static final String MULTIPART_FORM_DATA = "multipart/form-data";
    public static final String EXCEPTION = "exception";
    public static final String NAVIGATION = "navigation";
    public static final String TASK = "task";
    static final String CONTROLLER_ERROR_URL = "error.jsp";
    static final String TASK_PACKAGE = "com.topcoder.web.resume.bean";

    public void init(Servlet servletConfig)
            throws ServletException {
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        service(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        service(request,response);
    }

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        HttpSession session = null;
        try {
            log.debug("In com.topcoder.web.resume.servlet.Controller.service()");
//            if (request.getContentType() == null || request.getContentType().indexOf(MULTIPART_FORM_DATA) < 0) {
                String taskName = request.getParameter(TASK);
                if (taskName == null || !isWord(taskName)) {
                    log.debug(TASK + " not found in request.");
                    forwardToError(request, response, new Exception(TASK + " not found in request."));
                    return;
                }
                session = request.getSession();
                ResumeTask task = null;
                Class taskClass = null;
                try {
                    taskClass = Class.forName(TASK_PACKAGE + "." + taskName);
                } catch (ClassNotFoundException e) {
                    log.error(e.getMessage());
                    forwardToError(request, response, e);
                    return;
                }
                log.debug("about to make task: "+taskName);
                try {
                    task = (ResumeTask) taskClass.getConstructor(new Class[]{HttpServletRequest.class}).newInstance(new Object[]{request});
                    log.debug("about to process task: "+taskName);
                    task.process();
                } catch (Exception e) {
                    log.error(e.getMessage());
                    forwardToError(request, response, e);
                    return;
                }
                forward(request, response, task.getNextPage());
//            }
        } catch (ServletException se) {
            throw se;
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e.getMessage());
        } finally {
            if (session != null) {
                setNavigation(session);
            }
        }
    }

    boolean isWord(String s) {
        if (s == null || s.length() == 0) return false;
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isLetter(s.charAt(i))) return false;
        }
        return true;
    }

    void forward(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException {
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        try {
            if (url != null) {
                response.sendRedirect(response.encodeURL(url));
            } else {
                response.sendRedirect(response.encodeURL(CONTROLLER_ERROR_URL));
            }
        } catch (IOException e) {
            log.error(e.getMessage());
            throw new ServletException(e);
        }
    }

    void forwardToError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getContext("/").getRequestDispatcher(
                response.encodeURL(CONTROLLER_ERROR_URL)).forward(request, response);
    }

    void forwardToError(HttpServletRequest request, HttpServletResponse response, Throwable exception)
            throws ServletException, IOException {
        if (request != null) {
            request.setAttribute(EXCEPTION, exception);
        }
        forwardToError(request, response);
    }

    User getUser(HttpSession session) {
        if (session != null) {
            Object navigation = session.getAttribute(NAVIGATION);
            if (navigation instanceof Navigation) {
                User user = ((Navigation) navigation).getUser();
                if (user.getUserId() == 0) {
                    return null;
                }
                return user;
            }
        }
        return null;
    }


    // this method may seem insane, but weblogic requires a setAttribute at the
    // end of the request processing... SB

    void setNavigation(HttpSession session) {
        if (session != null) {
            Object navigation = session.getAttribute(NAVIGATION);
            if (navigation instanceof Navigation) {
                session.setAttribute(NAVIGATION, ((Navigation) navigation));
            }
        }
    }

    public void destroy() {
    }
}
