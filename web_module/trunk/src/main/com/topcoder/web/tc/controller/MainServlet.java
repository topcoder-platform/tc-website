package com.topcoder.web.tc.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.CoderSessionInfo;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.security.Resource;
import com.topcoder.common.web.data.Navigation;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;
import java.util.MissingResourceException;
import java.io.IOException;
import java.io.PrintWriter;

public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        Constants.initialize();

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected void process(HttpServletRequest request, HttpServletResponse response )
            throws IOException  {
        //just trying to protect against invalid requests getting to the
        //app server.  currently, we don't have a way to stop this ad the web
        //server layer.
            if (request.getServerName().startsWith(ApplicationServer.SERVER_NAME))
                if (ApplicationServer.PROD==ApplicationServer.ENVIRONMENT) {
                    super.process(request, response);
                }
            else {
                log.error(request.getRemoteHost() + " Made an Invalid Request - Wrong Server Name " + request.getServerName());
                response.setStatus(400);
                PrintWriter out = response.getWriter();
                out.println("<html><head><title>IInvalid Request - Wrong Server Name</title></head>");
                out.println("<body><h4>Your request was invalid for this server.</h4>");
                out.println("</body></html>");
                out.flush();
            }

    }


    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        //todo get rid of this junk, we end up doing all the same stuff anyway, when the navigation object
        //goes, so does this crap
        Navigation nav = (Navigation)request.getSession(true).getAttribute("navigation");
        CoderSessionInfo ret = null;
        ret = new CoderSessionInfo(request, auth, groups);
        if (nav == null) {
            nav = new Navigation(request, ret);
            nav.setCoderSessionInfo(ret);
            request.getSession(true).setAttribute("navigation", nav);
        } else {
            nav.setCoderSessionInfo(ret);
            request.setAttribute("navigation", nav);
        }
        return ret;
    }

    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("TC");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

}