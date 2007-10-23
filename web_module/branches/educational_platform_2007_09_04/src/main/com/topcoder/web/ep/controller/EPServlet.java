/*
* EPServlet
*
* Created Sep 5, 2007
*/
package com.topcoder.web.ep.controller;

import java.util.MissingResourceException;

import com.topcoder.shared.util.TCResourceBundle;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.ep.controller.request.RoundEventInitializer;

/**
 * @author Pablo Wolfus (pulky)
 * @version $Id$
 */
public class EPServlet extends BaseServlet {
    private final static Logger log = Logger.getLogger(EPServlet.class);

//    @Override
//    protected WebAuthentication createAuthentication(TCRequest request,
//                                                     TCResponse response) throws Exception {
//        return new BasicAuthentication(new SessionPersistor(request.getSession()), request, response,
//                BasicAuthentication.EP_SITE);
//    }

    @Override
    protected String getProcessor(String key) {
        String ret = super.getProcessor(key);
        if (ret.equals(key)) {
            //yuck, gonna throw errors all over the place
            TCResourceBundle bundle = new TCResourceBundle("EP");
            try {
                ret = bundle.getProperty(key);
            } catch (MissingResourceException ignore) {
                //just return what we got
            }
        }
        return ret;
    }

//    @Override
//    protected void handleException(HttpServletRequest request, HttpServletResponse response, Throwable e) throws Exception {
//        log.error("caught exception, forwarding to error page", e);
//        if (e instanceof PermissionException) {
//            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
//            request.setAttribute(MESSAGE_KEY, "Sorry, you do not have permission to access the specified resource.  Please confirm that you are a member of Educational Platform.");
//        } else if (e instanceof NavigationException) {
//            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            request.setAttribute(MESSAGE_KEY, e.getMessage());
//            if (((NavigationException) e).hasUrl())
//                request.setAttribute(URL_KEY, ((NavigationException) e).getUrl());
//        } else {
//            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
//            request.setAttribute(MESSAGE_KEY, "An error has occurred when attempting to process your request.");
//        }
//        request.setAttribute("exception", e);
//        fetchRegularPage(request, response, ERROR_PAGE, true);
//    }
//    
    
    @Override
    public void destroy() {
        super.destroy();
        RoundEventInitializer.release();
    }
}
