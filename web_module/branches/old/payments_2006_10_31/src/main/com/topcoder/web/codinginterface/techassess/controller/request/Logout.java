package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;

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

        try {
            send(request);
        } catch (ServerBusyException e) {
            throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                    "When using this tool, please wait for a response before you attempt to proceed.");
        }

        getAuthentication().logout();

        //build the next page before we invalidate the session
        String nextPage = buildProcessorRequestString(Constants.RP_LOGIN,
                new String[]{Constants.COMPANY_ID, Constants.SESSION_ID},
                new String[]{String.valueOf(getCompanyId()), String.valueOf(getSessionId())});

        getRequest().getSession().invalidate();

        setNextPage(nextPage);
        setIsNextPageInContext(false);


    }

}
