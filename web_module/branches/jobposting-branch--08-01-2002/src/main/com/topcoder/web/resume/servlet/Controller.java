package com.topcoder.web.resume.servlet;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.ejb.AuthenticationServices.User;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.resume.bean.ResumeTask;
import com.topcoder.servlet.request.FileUpload;
import com.topcoder.servlet.request.UploadedFile;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.lang.reflect.InvocationTargetException;

public class Controller
        extends HttpServlet {
    private static Logger log = Logger.getLogger(Controller.class);
    static final String MULTIPART_FORM_DATA = "multipart/form-data";
    public static final String MESSAGE = "message";
    public static final String NAVIGATION = "navigation";
    public static final String TASK = "task";
    public static final String ALIAS = "/Resume";
    public static final String RESUME_UPLOAD_TASK = "ResumeUploadTask";
    public static final String RESUME_DOWNLOAD_TASK = "ResumeDownloadTask";
    public static final String CONTROLLER_ERROR_URL = "/errorPage.jsp";
    static final String TASK_PACKAGE = "com.topcoder.web.resume.bean";

    public void init(Servlet servletConfig)
            throws ServletException {
    }
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
        HttpSession session = null;
        try {
            log.debug("In com.topcoder.web.resume.servlet.Controller.service()");
            FileUpload fu = null;
            String taskName = null;
            if (request.getContentType() != null && request.getContentType().indexOf(MULTIPART_FORM_DATA) >= 0) {
                fu = new FileUpload(request, false);
                taskName = fu.getParameter(TASK);
            }else{
                taskName = request.getParameter(TASK);
            }
            log.debug(taskName);
            if (taskName == null || !isWord(taskName)) {
                log.debug(TASK + " not found in request. - "+taskName);
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
                User user = getUser(request.getSession());
                if(user == null)throw new Exception("You must log in to use this area.");
                task = (ResumeTask) taskClass.getConstructor(new Class[]{FileUpload.class,ServletContext.class}).newInstance(new Object[]{fu,getServletContext()});
                task.setUser(user);
                task.process();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
                forwardToError(request, response, e.getTargetException());
                return;
            } catch (Exception e) {
                e.printStackTrace();
                forwardToError(request, response, e);
                return;
            }
            task.getNextPage(request,response);
        } catch (ServletException se) {
            throw se;
        } catch (Exception e) {
            log.error("Exception in resume Controller");
            e.printStackTrace();
            try{
                forwardToError(request, response, e);
            }
            catch(Exception e2){
                throw new ServletException(e2.getMessage());
            }
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

    void forwardToError(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext sc = getServletContext();
        sc = sc.getContext("/");
        RequestDispatcher requestDispatcher = sc.getRequestDispatcher(response.encodeURL(CONTROLLER_ERROR_URL));
        requestDispatcher.forward(request, response);
    }

    void forwardToError(HttpServletRequest request, HttpServletResponse response, Throwable exception)
            throws ServletException, IOException {
        if (request != null) {
            request.setAttribute(MESSAGE, exception.getMessage());
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
