package com.topcoder.web.codinginterface.longcontest.controller;

import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/**
 * User: lars
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);

    public void init(ServletConfig config) throws ServletException {
        log.debug("loading up the longcontest servlet");
        super.init(config);
    }

    protected boolean hasPermission(WebAuthentication auth, Resource r) throws Exception {
        return true;
    }

    protected RequestProcessor callProcess(String processorName, TCRequest request, TCResponse response,
                                           WebAuthentication authentication) throws Exception {
        Base rp = null;

        rp = (Base) Class.forName(processorName).newInstance();
        rp.setRequest(request);
        rp.setResponse(response);
        rp.setAuthentication(authentication);
        rp.process();
        log.debug("done process");
        return rp;
    }

/*
    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        if (ApplicationServer.ENVIRONMENT==ApplicationServer.PROD) {
            return new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, response,
                    BasicAuthentication.LONG_CONTEST_SITE);

        } else {
            return new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, response,
                    BasicAuthentication.MAIN_SITE);
        }
    }
*/

}
