package com.topcoder.web.codinginterface.techassess.model;

import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.io.Serializable;
import java.util.HashMap;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 5, 2005
 */
public class SessionInfo implements Serializable, HttpSessionBindingListener {

    private long sessionId = -1;
    private QueueMessageSender sender = null;

    public SessionInfo(long sessionId, QueueMessageSender sender) {
        this.sessionId = sessionId;
        this.sender = sender;
    }

    public void valueBound(HttpSessionBindingEvent event) {
        //whoopie, we're in the session!!
    }

    public void valueUnbound(HttpSessionBindingEvent event) {
        //send a logout request
        ScreeningLogoutRequest request = new ScreeningLogoutRequest();
        request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
        request.setSessionID(sessionId);
        sender.sendMessage(new HashMap(), request);
    }

    public long getSessionId() {
        return sessionId;
    }

    public void setSessionId(long sessionId) {
        this.sessionId = sessionId;
    }
}
