package com.topcoder.web.reg.servlet;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.reg.bean.Task;
import com.topcoder.web.reg.bean.TaskException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;

public class Controller
        extends HttpServlet {
    private static Logger log = Logger.getLogger(Controller.class);
    static final String MULTIPART_FORM_DATA = "multipart/form-data";
    public static final String ALIAS = "/Registration";
    public static final String EXCEPTION = "exception";
    public static final String NAVIGATION = "navigation";
    public static final String TASK = "task";
    public static final String STEP = "step";
    static final String CONTROLLER_ERROR_URL = "error.jsp";
    static final String TASK_PACKAGE = "com.topcoder.web.reg.bean";

    public void init(Servlet servletConfig)
            throws ServletException {
    }

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        HttpSession session = null;
        try {
            if (request.getContentType() == null || request.getContentType().indexOf(MULTIPART_FORM_DATA) < 0) {
                String taskName = request.getParameter(TASK);
                if (taskName == null || !isWord(taskName)) {
                    log.debug(TASK + " not found in request.");
                    forwardToError(request, response, new TaskException(TASK + " not found in request."));
                    return;
                }
                session = request.getSession(true); // for now create a new session, later this'll be done in the front page
                Object taskObject = session.getAttribute(taskName);
                Task task = null;
                Class taskClass = null;
                try {
                    taskClass = Class.forName(TASK_PACKAGE + "." + taskName);
                } catch (ClassNotFoundException e) {
                    log.error(e.getMessage());
                    forwardToError(request, response, e);
                    return;
                }
                if (taskObject == null) {
                    try {
                        task = (Task) taskClass.newInstance();
                    } catch (Exception e) {
                        log.error(e.getMessage());
                        forwardToError(request, response, e);
                        return;
                    }
                    session.setAttribute(taskName, task);
                } else {
                    try {
                        task = (Task) taskObject;
                    } catch (ClassCastException e) {
                        log.error(e.getMessage());
                        forwardToError(request, response, e);
                        return;
                    }
                }
                task.setUser(getUser(session));
                task.setStep(request.getParameter(STEP));
                Enumeration parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String parameterName = parameterNames.nextElement().toString();
                    String[] parameterValues = request.getParameterValues(parameterName);
                    if (parameterValues != null) {
                        //if (parameterValues.length == 1)
                        //{
                        //task.setAttribute(parameterName,request.getParameter(parameterName));
                        //}
                        //else if (parameterValues.length > 1)
                        //{

                        task.setAttributes(parameterName, parameterValues);

                        //}
                    }
                }

                try {
                    task.process();
                } catch (TaskException e) {
                    log.error(e.getMessage());
                    forwardToError(request, response, e);
                }

                forward(request, response, task.getNextPage());
            }
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
            throws ServletException {
        forward(request, response, CONTROLLER_ERROR_URL);
    }

    void forwardToError(HttpServletRequest request, HttpServletResponse response, Throwable exception)
            throws ServletException {
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
