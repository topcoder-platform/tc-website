package com.topcoder.web.privatelabel.controller;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.SimpleResource;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.common.model.CoderSessionInfo;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.RegistrationBase;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.MissingResourceException;
import java.util.Set;

/**
 * @author gpaul 06.26.2003
 */
public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected TCSubject getUser(long id, TCRequest request) throws Exception {
        String db = getDB(request);
        try {
            if (db == null) {
                return SecurityHelper.getUserSubject(id);
            } else {
                return SecurityHelper.getUserSubject(id, db);
            }
        } catch (NoSuchUserException e) {
            log.warn("couldn't find user " + id + " gonna get a guest instead");
            if (db == null) {
                return SecurityHelper.getUserSubject(SimpleUser.createGuest().getId());
            } else {
                return SecurityHelper.getUserSubject(SimpleUser.createGuest().getId(), db);
            }
        }
    }

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestProcessor rp;
        WebAuthentication authentication;
        SessionInfo info;

        try {
            try {

                request.setCharacterEncoding("utf-8");
                TCRequest tcRequest = HttpObjectFactory.createRequest(request);
                TCResponse tcResponse = HttpObjectFactory.createUnCachedResponse(response);
                //set up security objects and session info
                authentication = createAuthentication(tcRequest, tcResponse);
                TCSubject user = getUser(authentication.getActiveUser().getId(), tcRequest);
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
                    log.debug("got module attribute " + cmd);
                    if (cmd.equals("")) {
                        cmd = StringUtils.checkNull(tcRequest.getParameter(MODULE));
                    }

                    if (cmd.equals("")) {
                        cmd = DEFAULT_PROCESSOR;
                    }
                    if (!isLegalCommand(cmd)) {
                        throw new NavigationException();
                    }

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
                    if (authentication.getUser().isAnonymous()) {
                        log.info(info.getHandle() + " does not have access to " + pe.getResource().getName() + " sending to login");
                        handleLogin(request, response, info);
                        return;
                    } else {
                        log.info(info.getHandle() + " does not have access to " + pe.getResource().getName() + " sending to error");
                        throw pe;
                    }
                }
                if (!response.isCommitted()) {
                    fetchRegularPage(request, response, rp.getNextPage(), rp.isNextPageInContext());
                }
                //todo perhaps catch Throwable here instead
            } catch (Throwable e) {
                handleException(request, response, e);
            }

            /* things are extremely broken, or perhaps some of the response
             * buffer had already been flushed when an error was thrown,
             * and the forward to error page failed.  in any event, make
             * one last attempt to get an error message to the browser
             */
        } catch (Throwable e) {
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

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        String db = getDB(request);
        if (db == null) {
            return new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, response, BasicAuthentication.PRIVATE_LABEL_SITE);
        } else {
            return new BasicAuthentication(new SessionPersistor(request.getSession()),
                    request, response, BasicAuthentication.PRIVATE_LABEL_SITE, db);
        }
    }

    private String getDB(TCRequest request) {
        String db = null;
        long companyId = -1;
        try {
            companyId = Long.parseLong(request.getParameter(Constants.COMPANY_ID));
            db = RegistrationBase.getCompanyDb(companyId, Constants.TRANSACTIONAL);
        } catch (Exception e) {
            if (companyId > 0) {
                log.warn("no db found for company " + companyId);
            }
        }
        return db;
    }

    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        CoderSessionInfo ret = new CoderSessionInfo(request, auth, groups);
        return ret;
    }


    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("PrivateLabel");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

}