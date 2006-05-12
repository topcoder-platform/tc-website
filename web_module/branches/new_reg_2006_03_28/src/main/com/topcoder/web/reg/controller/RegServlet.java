package com.topcoder.web.reg.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.security.WebAuthentication;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class RegServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(RegServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }




/*
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestProcessor rp;
        WebAuthentication authentication;
        SessionInfo info;

        try {

            if (1==1) throw new Exception("making an attempt");
            request.setCharacterEncoding("utf-8");
            TCRequest tcRequest = HttpObjectFactory.createRequest(request);
            TCResponse tcResponse = HttpObjectFactory.createUnCachedResponse(response);
            //set up security objects and session info
            authentication = createAuthentication(tcRequest, tcResponse);
            TCSubject user = getUser(authentication.getActiveUser().getId());
            info = createSessionInfo(tcRequest, authentication, user.getPrincipals());
            tcRequest.setAttribute(SESSION_INFO_KEY, info);
            //todo perhaps this should be configurable...so implementing classes
            //todo don't have to do it if they don't want to
            RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

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
            log.info(loginfo);

            try {
                String cmd = StringUtils.checkNull((String) tcRequest.getAttribute(MODULE));
                //log.debug("got module attribute " + cmd);
                if (cmd.equals("")) {
                    cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));
                }

                if (cmd.equals("")) {
                    cmd = DEFAULT_PROCESSOR;
                }
                if (!isLegalCommand(cmd)) {
                    throw new NavigationException();
                }

                //log.debug("path " + PATH);
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
            }
        } catch (IOException e) {
            throw e;
        } catch (Throwable e) {
            throw new ServletException(e);
        }
    }
*/

}
