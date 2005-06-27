package com.topcoder.dde.servlet;

import com.topcoder.web.common.*;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.security.User;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.security.TCSubject;
import com.topcoder.dde.util.TCSAuthentication;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.MissingResourceException;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 3, 2005
 */
public class TCSServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(TCSServlet.class);

    private static final User GUEST = SimpleUser.createGuest();

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        RequestProcessor rp = null;
        WebAuthentication authentication = null;
        SessionInfo info = null;

        try {

            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createResponse(response);
            //set up security objects and session info
            authentication = createAuthentication(request, response);
            TCSubject user = (TCSubject)request.getSession().getAttribute("TCSUBJECT");
            //this isn're really useful cuz it does't have any permissions in the subject object
            if (user==null) user = new TCSubject(GUEST.getId());

            info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
            tcRequest.setAttribute(SESSION_INFO_KEY, info);
            //RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

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

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("TCS");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }


    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {

        request.getSession().setAttribute("nav_redirect", info.getRequestString());
        request.getSession().setAttribute("nav_redirect_msg", "In order to continue, you must provide your user name " +
                "and password.");

        fetchRegularPage(request, response, LOGIN_SERVLET, false);
    }


    protected WebAuthentication createAuthentication(HttpServletRequest request,
                                                     HttpServletResponse response) throws Exception {
        return new TCSAuthentication(request, response);
    }




}
