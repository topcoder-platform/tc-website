package com.topcoder.web.codinginterface.longcontest.controller;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.screening.common.ScreeningContext;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.common.ApplicationServer;
import com.topcoder.shared.common.TCContext;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.codinginterface.messaging.WebResponsePool;
import com.topcoder.web.codinginterface.longcontest.controller.request.Base;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/**
 * User: lars
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);
    private static QueueMessageSender sender = null;
    private static WebQueueResponseManager receiver = null;


    public void init(ServletConfig config) throws ServletException {
        log.debug("loading up the longcontest servlet");
        super.init(config);

        Context context = null;
        try {
            context = TCContext.getJMSContext();
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

    private static final String KEY_PREFIX = "user_subject:";

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
    protected void handleLogin(HttpServletRequest request, HttpServletResponse response, SessionInfo info) throws Exception {
        /* forward to the login page, with a message and a way back */
        request.setAttribute(MESSAGE_KEY, "In order to continue, you must provide your user name " +
                "and password.");
        log.debug("going to " + info.getRequestString() + " on success login");
        request.setAttribute(NEXT_PAGE_KEY, info.getRequestString());

        request.setAttribute(MODULE, LOGIN_PROCESSOR);
        getServletContext().getContext(LOGIN_SERVLET).getRequestDispatcher(response.encodeURL(LOGIN_SERVLET)).forward(request, response);
    }

}
