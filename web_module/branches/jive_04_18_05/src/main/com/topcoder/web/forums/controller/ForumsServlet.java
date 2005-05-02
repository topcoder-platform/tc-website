/*
 * Created on Apr 27, 2005 (Eclipse)
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.topcoder.web.forums.controller;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.security.TCSubject;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.MissingResourceException;
import java.util.Set;

/**
 * @author mtong
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class ForumsServlet extends BaseServlet {
	private final static Logger log = Logger.getLogger(ForumsServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }


    /**
     * todo Temp hack, implement this with something meaningful or change the base to improve this dependency
     * @param id
     * @return
     * @throws Exception
     */
    protected TCSubject getUser(long id) throws Exception {
        return new TCSubject(132456);
    }


    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        RequestProcessor rp = null;
        WebAuthentication authentication = null;
        SessionInfo info = null;

        try {

            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            //set up security objects and session info
            authentication = createAuthentication(tcRequest, tcResponse);
            TCSubject user = getUser(authentication.getActiveUser().getId());
            info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
            tcRequest.setAttribute(SESSION_INFO_KEY, info);

            StringBuffer loginfo = new StringBuffer(100);
            loginfo.append("[**** ");
            loginfo.append(info.getHandle());
            loginfo.append(" **** ");
            loginfo.append(request.getRemoteAddr());
            loginfo.append(" **** ");
            loginfo.append(request.getMethod());
            loginfo.append(" ");
            loginfo.append(info.getRequestString());
            loginfo.append(" ****]");
            log.info(loginfo);

            try {
                try {
                    String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
                    if (cmd.equals(""))
                        cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));

                    if (cmd.equals(""))
                        cmd = DEFAULT_PROCESSOR;
                    if (!isLegalCommand(cmd))
                        throw new NavigationException();

                    String processorName = PATH + (PATH.endsWith(".") ? "" : ".") + getProcessor(cmd);

                    log.debug("creating request processor for " + processorName);
                    try {
                        SimpleResource resource = new SimpleResource(processorName);
                        if (hasPermission(authentication, resource)) {
                            rp = callProcess(processorName, tcRequest, tcResponse, authentication);
                        } else {
                            throw new PermissionException(authentication.getActiveUser(), resource);
                        }
                    } catch (ClassNotFoundException e) {
                        throw new NavigationException("Invalid request", e);
                    }
                } catch (PermissionException pe) {
                    log.debug("caught PermissionException");
                    if (authentication.getUser().isAnonymous()) {
                        handleLogin(request, response, info);
                        return;
                    } else {
                        log.debug("already logged in, rethrowing");
                        throw pe;
                    }
                }
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                    return;
                }
            } catch (Exception e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Exception e) {
            log.fatal("forwarding to error page failed", e);
            e.printStackTrace();
            response.setContentType("text/html");
            response.setStatus(500);
            PrintWriter out = response.getWriter();
            out.println("<html><head><title>Internal Error</title></head>");
            out.println("<body><h4>Your request could not be processed.  Please inform TopCoder.</h4>");
            out.println("</body></html>");
            out.flush();
        }
    }





}
