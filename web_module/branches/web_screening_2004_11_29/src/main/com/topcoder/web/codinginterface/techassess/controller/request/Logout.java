package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.netCommon.screening.request.ScreeningLogoutRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningLogoutResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 21, 2004
 */
public class Logout extends Base {

    protected static Logger log = Logger.getLogger(Logout.class);

    protected void businessProcessing() throws Exception {

        ScreeningLogoutRequest request = new ScreeningLogoutRequest();
        request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
        request.setSessionID(getSessionId());

        send(request);

        //todo do we need to wait for this really?
        ScreeningLogoutResponse response = (ScreeningLogoutResponse)receive(5000);


        setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
        setIsNextPageInContext(false);

        getRequest().getSession().invalidate();

    }

}
