package com.topcoder.web.tc.controller.rooms;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.security.TCSubject;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.dao.PageTrackerDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.MissingResourceException;
import java.util.Set;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.io.PrintWriter;
import java.net.URLDecoder;


public class TimerServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(TimerServlet.class);

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        WebAuthentication authentication;
        SessionInfo info;
	 BufferedWriter out = null;

        try {
                request.setCharacterEncoding("utf-8");

                TCRequest tcRequest = createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createResponse(response);

                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId());
                info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
                //we can let browsers/proxies cache pages if the user is anonymous or it's https (they don't really cache https setuff)
                if (log.isDebugEnabled()) {
                    log.debug("uri: " + request.getRequestURL().toString());
                }
                if (!authentication.getActiveUser().isAnonymous() &&
                        !request.getRequestURL().toString().toLowerCase().startsWith("https")) {
                    if (log.isDebugEnabled()) {
                        log.debug("using an uncached response");
                    }
                    tcResponse = HttpObjectFactory.createUnCachedResponse(response);
                }
                tcRequest.setAttribute(SESSION_INFO_KEY, info);
                
		  StringBuffer loginfo = new StringBuffer(100);
                loginfo.append("[* ");
                loginfo.append(info.getHandle());
                loginfo.append(" * ");
                loginfo.append(request.getRemoteAddr());
                loginfo.append(" * ");
                loginfo.append(request.getMethod());
                loginfo.append(" ");
                loginfo.append(info.getRequestString());
                loginfo.append(" *]");
                //log.info(loginfo);

		//File file = new File(getServletConfig().getInitParameter("outFile"));
		
		//out= new BufferedWriter(new FileWriter(file, true));
		
		PageTrackerDAO pageTrackerDAO = new PageTrackerDAO();
		int actionId = 0;
		
		String key = request.getParameter("key");
		String url = null;
		String logInfo = null;
		if(key == null || key.trim().length() == 0) {
			logInfo = user.getUserId() + " hits timer page at time ";
			actionId = PageTrackerDAO.LOG_IN_ACTION_ID;
		} else if(key.equals("1")) {
			logInfo = user.getUserId() + " leaves page after timeout at time ";
			actionId = PageTrackerDAO.TIME_OUT_ACTION_ID;
		} else if(key.equals("0")) {
			logInfo = user.getUserId() + " leaves page by closing the window at time ";
			actionId = PageTrackerDAO.BROWSER_CLOSE_ACTION_ID;
		} else if(key.equals("2")) {
			url = URLDecoder.decode(request.getParameter("link"),"UTF-8");
			logInfo = user.getUserId() + " leaves page and go to " + url + " at time ";
			actionId = PageTrackerDAO.LINK_CLICK_ACTION_ID;
		}
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("HH:mm:ss,SSS");
		
		log.info(logInfo + dateFormatter.format(new Date()));
		if (!authentication.getActiveUser().isAnonymous()) {
			Long userId = new Long(user.getUserId());
			pageTrackerDAO.createPageTrackRecord(userId.toString(), actionId, url);
		}
		
		//out.write(logInfo + dateFormatter.format(new Date()));
		//out.newLine();
		
			  
		//getServletContext().getRequestDispatcher("/timer.jsp").forward(request, response); 

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
	     log.fatal("forwarding to error page failed", e);
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter pOut = response.getWriter();
            pOut.println("<html><head><title>Internal Error</title></head>");
            pOut.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            pOut.println("</body></html>");
            pOut.flush();
        } finally {
		if(out!=null) {
			out.close();
		}
	  }
    }
}