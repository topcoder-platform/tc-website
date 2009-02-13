package com.topcoder.web.tc.controller;

import com.topcoder.common.web.data.Navigation;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.model.CoderSessionInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.MissingResourceException;
import java.util.Set;

public class MainServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(MainServlet.class);

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        if (request.getServerName().equals("topcoder.com")) {
            response.sendRedirect("http://www.topcoder.com/tc");
            return;
        }
        super.process(request, response);

    }


    protected SessionInfo createSessionInfo(TCRequest request,
                                            WebAuthentication auth, Set groups) throws Exception {
        //todo get rid of this junk, we end up doing all the same stuff anyway, when the navigation object
        //goes, so does this crap
        Navigation nav = (Navigation) request.getSession(true).getAttribute("navigation");
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