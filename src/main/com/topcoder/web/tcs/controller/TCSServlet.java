package com.topcoder.web.tcs.controller;

import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.security.Resource;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.MissingResourceException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 3, 2005
 */
public class TCSServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(TCSServlet.class);


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



}
