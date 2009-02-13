package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 21, 2004
 */
public class Logout extends Base {

    protected static Logger log = Logger.getLogger(Logout.class);

    protected void techAssessProcessing() throws Exception {

        ScreeningLogoutRequest request = new ScreeningLogoutRequest();
        request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
        request.setSessionID(getSessionId());

        send(request);

/*
        SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
        showProcessingPage(info.getServletPath()+"?"+Constants.MODULE+"="+Constants.RP_LOGOUT_RESPONSE+
                "&"+Constants.MESSAGE_ID+"="+getMessageId());
*/

        //todo do we need to wait for this really?
        //ScreeningLogoutResponse response = (ScreeningLogoutResponse)receive(5000);
        //log.debug("got response");

        getAuthentication().logout();

        //build the next page before we invalidate the session
        String nextPage = buildProcessorRequestString(Constants.RP_LOGIN,
                new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())});

        getRequest().getSession().invalidate();

        log.debug("i'm hoping we'll go to " + nextPage);

        setNextPage(nextPage);
        setIsNextPageInContext(false);


    }

}
