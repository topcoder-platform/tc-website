package com.topcoder.web.tc.controller.legacy.reg.servlet;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.common.web.data.User;
import com.topcoder.common.web.data.Coder;
import com.topcoder.common.web.util.Data;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.tc.controller.legacy.reg.bean.Task;
import com.topcoder.web.tc.controller.legacy.reg.bean.TaskException;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCRequestFactory;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.TCSubject;

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
    public static final String RESUME = "ResumeUpload";
    static final String CONTROLLER_ERROR_URL = "errorPage.jsp";
    static final String TASK_PACKAGE = "com.topcoder.web.tc.controller.legacy.reg.bean";

    public void init(Servlet servletConfig)
            throws ServletException {
    }

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        log.debug("service called...");
        HttpSession session = null;
        Navigation nav = null;
        try {
            session = request.getSession(true);
            nav = (Navigation)session.getAttribute("navigation");
            if (nav == null) nav = new Navigation(request, response);

            /* we're doing this basically just so that we can get the right page for redirect if
             * they are asked to log in.  if we don't do this, we get the wrong info for the
             * request cuz it's stored in the session from some old request.
             */
            TCRequest tcRequest = TCRequestFactory.createRequest(request);
            WebAuthentication authentication = new BasicAuthentication(new SessionPersistor(request.getSession()), tcRequest, response, BasicAuthentication.MAIN_SITE);
            PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
            TCSubject user = pmgr.getUserSubject(authentication.getActiveUser().getId());
            CoderSessionInfo info = new CoderSessionInfo(tcRequest, authentication, user.getPrincipals());
            nav.setCoderSessionInfo(info);

            if (nav.isIdentified() && !nav.isLoggedIn())
                throw new PermissionException(new SimpleUser(nav.getUserId(), "", ""), new ClassResource(this.getClass()));


            if (request.getContentType() == null || request.getContentType().indexOf(MULTIPART_FORM_DATA) < 0) {
                String taskName = request.getParameter(TASK);
                if (taskName == null) {
                    taskName= "Registration";  // handle null task gracefully
                } else if (!isWord(taskName)) {
                    log.debug(TASK + " not found in request.");
                    forwardToError(request, response, new TaskException(TASK + " not found in request."));
                    return;
                }
                Object taskObject = session.getAttribute(taskName);
                Task task = null;
                Class taskClass = null;
                if (taskObject == null) {
                    log.debug("taskObject was null");
                    try {
                        taskClass = Class.forName(TASK_PACKAGE + "." + taskName);
                    } catch (ClassNotFoundException e) {
                        log.error(e.getMessage());
                        forwardToError(request, response, e);
                        return;
                    }
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
                task.setStep(request.getParameter(STEP));  //the only use for this seems to be to clear notifications

                Enumeration parameterNames = request.getParameterNames();
                while (parameterNames.hasMoreElements()) {
                    String parameterName = parameterNames.nextElement().toString();
                    String[] parameterValues = request.getParameterValues(parameterName);
                    if (parameterValues != null) {
                        task.setAttributes(parameterName, parameterValues);
                    }
                }

                try {
                    task.process();
                } catch (TaskException e) {
                    forwardToError(request, response, e);
                    return;
                }

                forward(request, response, task.getNextPage());
            }
        } catch (ServletException se) {
            throw se;
        } catch (PermissionException pe) {
            log.debug("caught PermissionException");
            try {
                if (nav==null)
                    nav = new Navigation(request, response);
                if (!nav.isLoggedIn()) {
                    CoderSessionInfo info = nav.getSessionInfo();
                    /* forward to the login page, with a message and a way back */
                    request.setAttribute(BaseServlet.MESSAGE_KEY, "In order to continue, you must provide your user name " +
                            "and password.");
                    request.setAttribute(BaseServlet.NEXT_PAGE_KEY, info.getRequestString());
                    log.debug("after login go to: " + info.getRequestString());

                    request.setAttribute("module", "Login");
                    fetchRegularPage(request, response, "/tc", true);
                    return;

                 } else {
                    log.info("already logged in, rethrowing");
                    throw pe;
                 }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e.getMessage());
        } finally {
            if (session != null) {
                setNavigation(session);
            }
        }
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

    boolean isWord(String s) {
        if (s == null || s.length() == 0) return false;
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isLetter(s.charAt(i))) return false;
        }
        return true;
    }

    void forward(HttpServletRequest request, HttpServletResponse response, String url)
            throws ServletException {
        log.debug("forwarding to " + url);
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
        exception.printStackTrace();
        if (request != null) {
            request.setAttribute(EXCEPTION, exception);
        }
        forwardToError(request, response);
    }

    User getUser(HttpSession session) throws Exception {
        if (session != null) {
            Object navigation = session.getAttribute(NAVIGATION);
            if (navigation == null) { 
                log.debug("navigation object was null");
                navigation = new Navigation();
                session.setAttribute(NAVIGATION, navigation);
            }
            log.debug("navigation is serializable: " + ((Navigation)navigation).userIsSerializable());
            if (navigation instanceof Navigation) {
//                ((Navigation) navigation).makeUserSerializable();
                Data.loadUser((Navigation)navigation);
                User user = ((Navigation) navigation).getUser();
                log.debug("loaded user " + user.getUserId());
                if (user.getUserId() == 0) {
                    log.debug("returning a null user");
                    return null;
                }
                return user;
            } else {
                log.debug("WTF navigation object is not the right class");
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
