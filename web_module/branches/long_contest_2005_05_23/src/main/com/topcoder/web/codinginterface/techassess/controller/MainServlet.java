package com.topcoder.web.codinginterface.techassess.controller;

import com.topcoder.security.TCSubject;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.screening.common.ScreeningContext;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.distCache.CacheClient;
import com.topcoder.shared.distCache.CacheClientFactory;
import com.topcoder.web.codinginterface.messaging.WebQueueResponseManager;
import com.topcoder.web.codinginterface.messaging.WebResponsePool;
import com.topcoder.web.codinginterface.techassess.controller.request.Base;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.common.RequestProcessor;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.Constants;
import com.topcoder.web.common.security.LightAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

/**
 * User: dok
 * Date: Dec 1, 2004
 */
public class MainServlet extends BaseServlet {

    private final static Logger log = Logger.getLogger(MainServlet.class);
    private static QueueMessageSender sender = null;
    private static WebQueueResponseManager receiver = null;


    public void init(ServletConfig config) throws ServletException {
        log.debug("loading up the techassess servlet");
        super.init(config);

        Context context = null;
        try {
            context = ScreeningContext.getJMSContext();
        } catch (NamingException e) {
            throw new ServletException(e);
        }

        log.debug("create queue message sender");
        sender = new QueueMessageSender(ScreeningApplicationServer.JMS_FACTORY,
                DBMS.REQUEST_QUEUE, context);
        sender.setPersistent(true);
        sender.setDBPersistent(false);
        sender.setFaultTolerant(false);
        log.info("created queue message sender");

        log.debug("create queue response manager");
        receiver = new WebQueueResponseManager(ScreeningApplicationServer.JMS_FACTORY,
                DBMS.RESPONSE_QUEUE, context,
                "serverID = " + ScreeningApplicationServer.WEB_SERVER_ID,
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

    protected TCSubject getUser(long id) throws Exception {
        //todo use security helper when we get it
        TCSubject ret = null;

        String key = KEY_PREFIX + String.valueOf(id);
        try {
            boolean hasCacheConnection = true;
            CacheClient cc = null;
            try {
                cc = CacheClientFactory.createCacheClient();
                ret = (TCSubject) (cc.get(key));
            } catch (Exception e) {
                log.error("UNABLE TO ESTABLISH A CONNECTION TO THE CACHE: " + e.getMessage());
                hasCacheConnection = false;
            }
            if (ret == null) {
                PrincipalMgrRemote pmgr = (PrincipalMgrRemote) Constants.createEJB(PrincipalMgrRemote.class);
                ret = pmgr.getUserSubject(id);
                if (hasCacheConnection) {
                    try {
                        cc.set(key, ret, 1000 * 60 * 30);
                    } catch (Exception e) {
                        log.error("UNABLE TO INSERT INTO CACHE: " + e.getMessage());
                    }
                }
            }
            return ret;
        } catch (Exception e) {
            throw e;
        }
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
        return new LightAuthentication(new SessionPersistor(request.getSession(true)), request, response,
                LightAuthentication.TECH_ASSESS_SITE);
    }


}
