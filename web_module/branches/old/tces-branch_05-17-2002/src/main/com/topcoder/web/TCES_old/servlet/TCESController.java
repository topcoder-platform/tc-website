package com.topcoder.web.tces.servlet;

import com.topcoder.common.*;
import com.topcoder.common.web.data.*;
import com.topcoder.web.tces.bean.*;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class TCESController extends HttpServlet {
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
            if (taskName == null || !TCES.navs.getHash().containsKey(taskName)) {
                Log.msg(TASK+" not found in request. Going to default nav.");
								if (TCES.navs.getDefaultNav() != null) {
									//forward(request,response, TCES.navs.getDefaultNav().getFullPageName());
									response.sendRedirect(TCESController.ALIAS + "?" + TASK + "=" + TCES.navs.getDefaultNav().getTaskKey());
								} else {
									response.sendRedirect("/index");
								}
                //forwardToError(request,response,new TaskException(TASK+" not found in request."));
                //return;
            } else {
	            session = request.getSession(true); // for now create a new session, later this'll be done in the front page
							User currentUser = getUser(session);
							if (currentUser == null) {
								response.sendRedirect("/?t=authentication&c=login");
							} else {
								TCES tces = new TCES(currentUser, taskName);
		            Enumeration parameterNames = request.getParameterNames();
		            while (parameterNames.hasMoreElements())
		            {
		                String parameterName = parameterNames.nextElement().toString();
		                String[] parameterValues = request.getParameterValues(parameterName);
		                if (parameterValues != null) {
		                    tces.setAttributes(parameterName,parameterValues);
		                }
		            }
	              Log.msg("About to call process()");
								try {
	              	Log.msg("calling process()");
									tces.process();
	              	Log.msg("called process()");
									session.setAttribute("tces", tces);
		            	forward(request,response, tces.getNextNav().getFullPageName());
								} catch (TaskException te) {
	                forwardToError(request,response,new TaskException(TASK+": " + te.getMessage()));
								}
							}
						}
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
    
    void forward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        Log.msg(" => forward() to " + url);
        if (url == null || url.length() == 0) url = TCES.PATH + "error.jsp";
        RequestDispatcher rd = null;
        synchronized(this) {
            //rd = (RequestDispatcher) dispatcherMap.get(url);
            if (rd == null) {
                rd = getServletContext().getRequestDispatcher(url);
                if (rd == null) {
        					Log.msg(" => tces.TCES RequestDispatcher is null");
									throw new ServletException("cannot obtain request dispatcher");
								} else {
                	//dispatcherMap.put(url, rd);								
								}
            }
        }
        request.setAttribute("dispatched", "true");
        rd.forward(request, response);
    }
   
    void forwardToError(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       forward(request,response,TCES.PATH + CONTROLLER_ERROR_URL);
    } 
   
    void forwardToError(HttpServletRequest request, HttpServletResponse response, Throwable exception) throws ServletException, IOException {
        if (request != null) {
            request.setAttribute(EXCEPTION,exception);
        }
        forwardToError(request,response);
    } 

    User getUser(HttpSession session) {
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

    void setNavigation ( HttpSession session ) {
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
