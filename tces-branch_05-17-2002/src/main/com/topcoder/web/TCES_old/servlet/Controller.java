package com.topcoder.web.tces.servlet;
// package com.topcoder.web.servlet;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.web.tces.bean.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Controller
    extends HttpServlet
{
    static final String MULTIPART_FORM_DATA = "multipart/form-data";
    public static final String ALIAS = "/tcesctx";
    public static final String EXCEPTION = "exception";
    public static final String NAVIGATION = "navigation";
    public static final String TASK = "task";
    public static final String STEP = "step";
    static final String CONTROLLER_ERROR_URL = "error.jsp";
    static final String TASK_PACKAGE = "com.topcoder.web.tces.bean";
		 
    private Map dispatcherMap;

    public void init(Servlet servletConfig) throws ServletException {
	    /* a previous instance of the servlet may have already created the dispatcherMap */
			dispatcherMap = (Map) getServletContext().getAttribute("dispatcherMap");
	    /* if not, then create the map and bind it to the ServletContext */
			if (dispatcherMap == null) {
				dispatcherMap = new Hashtable();
				getServletContext().setAttribute("dispatcherMap", dispatcherMap);
			}
    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException {
      HttpSession session = null;
      try {
        if (request.getContentType()==null || request.getContentType().indexOf(MULTIPART_FORM_DATA) < 0)
        {
            String taskName = request.getParameter(TASK);
            if (taskName == null || !Registration.htValidTasks.containsKey(taskName)) {
                Log.msg(TASK+" not found in request.");
                forwardToError(request,response,new TaskException(TASK+" not found in request."));
                return;
            }
            session = request.getSession(true); // for now create a new session, later this'll be done in the front page
/*
            Object taskObject = session.getAttribute(taskName);
            Task task = null;
            Class taskClass = null;
            try
            {
                taskClass = Class.forName(TASK_PACKAGE + "." + taskName);
            }
            catch (ClassNotFoundException e)
            {
                Log.msg(e.getMessage());
                forwardToError(request,response,e);
                return;
            }
            if (taskObject == null)
            {
                try
                {
                    task = (Task) taskClass.newInstance();
                }
                catch (Exception e)
                {
                    Log.msg(e.getMessage());
                    forwardToError(request,response,e);
                    return;
                }
                session.setAttribute(taskName,task);
            }
            else
            {
                try
                {
                    task = (Task) taskObject;
                }
                catch (ClassCastException e)
                {
                    Log.msg(e.getMessage());
                    forwardToError(request,response,e);
                    return;
                }
            }
            task.setUser(getUser(session));
            task.setStep(request.getParameter(STEP));
            Enumeration parameterNames = request.getParameterNames();
            while (parameterNames.hasMoreElements())
            {
                String parameterName = parameterNames.nextElement().toString();
                String[] parameterValues = request.getParameterValues(parameterName);
                if (parameterValues != null) {
                    task.setAttributes(parameterName,parameterValues);
                }
            }

            try {
                task.process();
            }
            catch (TaskException e)
            {
                Log.msg(e.getMessage());
                forwardToError(request,response,e);
            }
*/
            forward(request,response,taskName);
         } 
      } catch ( ServletException se ) {
        throw se;
      } catch ( Exception e ) {
        e.printStackTrace();
        throw new ServletException ( e.getMessage() );
      } finally {
        if ( session != null ) 
        {
            setNavigation ( session );
        }
      }
    }

    boolean isWord(String s)
    {
        if (s==null || s.length() == 0) return false;
        for (int i=0;i<s.length();i++)
        {
            if (!Character.isLetter(s.charAt(i))) return false;
        }
        return true;
    }
    
    void forward(HttpServletRequest request, HttpServletResponse response, String url)
        throws ServletException, IOException
    {
        Log.msg(" => forward() to " + url);
/*				
        response.setHeader("Cache-Control","no-store");
        response.setHeader("Pragma","no-cache");
        response.setDateHeader ("Expires", 0);
        try
        {
            if (url != null) {
                response.sendRedirect(response.encodeURL(url));
            } else {
                response.sendRedirect(response.encodeURL(CONTROLLER_ERROR_URL));
            }
        } catch (IOException e) {
            Log.msg(e.getMessage());
            throw new ServletException(e);
        }
*/
        if (url == null || url.length() == 0) url = "error";
        RequestDispatcher rd = null;
        synchronized(this) {
            //rd = (RequestDispatcher) dispatcherMap.get(url);
            if (rd == null) {
                rd = getServletContext().getRequestDispatcher(Registration.PATH + url + ".jsp");
                if (rd == null) {
        					Log.msg(" => tces.Controller RequestDispatcher is null");
									throw new ServletException("cannot obtain request dispatcher");
								} else {
                	//dispatcherMap.put(url, rd);								
								}
            }
        }
        request.setAttribute("dispatched", "true");
        rd.forward(request, response);
    }
   
    void forwardToError(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
       forward(request,response,CONTROLLER_ERROR_URL);
    } 
   
    void forwardToError(HttpServletRequest request, HttpServletResponse response, Throwable exception)
        throws ServletException, IOException
    {
        if (request != null) {
            request.setAttribute(EXCEPTION,exception);
        }
        forwardToError(request,response);
    } 

    User getUser(HttpSession session)
    {
        if (session != null)
        {
            Object navigation = session.getAttribute(NAVIGATION);
            if (navigation instanceof Navigation)
            {
                User user = ((Navigation)navigation).getUser();
                if (user.getUserId() == 0)
                {
                    return null;
                }
                return user;
            }
        }
        return null;
    }

  
    // this method may seem insane, but weblogic requires a setAttribute at the 
    // end of the request processing... SB 

    void setNavigation ( HttpSession session ) 
    {
        if (session != null)
        {
            Object navigation = session.getAttribute(NAVIGATION);
            if (navigation instanceof Navigation)
            {
                session.setAttribute ( NAVIGATION, ((Navigation)navigation) );
            }
        }
    }
 
    public void destroy() {}
}
