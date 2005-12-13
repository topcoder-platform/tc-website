package com.topcoder.web.codinginterface.longcontest.controller;

import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.codinginterface.messaging.WebResponsePool;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * User: lars
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);
    private static QueueMessageSender sender = null;
    private static WebQueueResponseManager receiver = null;

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        super.process(request, response);
    }

    public void init(ServletConfig config) throws ServletException {
        log.debug("loading up the longcontest servlet");
        super.init(config);

        Context context = null;
        try {
            context = TCContext.getInitial();
        } catch (NamingException e) {
            throw new ServletException(e);
        }

        log.debug("create queue message sender");
        sender = new QueueMessageSender(ApplicationServer.JMS_FACTORY,
                DBMS.COMPILE_QUEUE, context);
        sender.setPersistent(true);
        sender.setDBPersistent(false);
        sender.setFaultTolerant(false);
        log.info("created queue message sender");

        log.debug("create queue response manager");
        receiver = new WebQueueResponseManager(ApplicationServer.JMS_FACTORY,
                DBMS.LONG_RESPONSE_QUEUE, context,
                "serverID = " + ApplicationServer.WEB_SERVER_ID,
                new WebResponsePool());
        log.info("created queue response manager");

/*
        Constants.initialize();

        if (!Constants.isInitialized())
            throw new ServletException("Constants did not initialize properly");
*/
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
        rp.setSender(sender);
        rp.setReceiver(receiver);
        rp.setAuthentication(authentication);
        rp.process();
        log.debug("done process");
        return rp;
    }

    protected WebAuthentication createAuthentication(TCRequest request,
                                                     TCResponse response) throws Exception {
        return new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, response,
                BasicAuthentication.LONG_CONTEST_SITE);
    }

}
