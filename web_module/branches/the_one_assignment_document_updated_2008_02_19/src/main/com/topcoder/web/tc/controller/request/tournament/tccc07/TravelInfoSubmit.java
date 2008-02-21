package com.topcoder.web.tc.controller.request.tournament.tccc07;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.BaseSubmitTravelInfo;

/**
 * User: gpaul
 * Date: Sep 4, 2007
 * Time: 8:04:49 PM
 * To change this template use File | Settings | File Templates.
 */
public class TravelInfoSubmit extends BaseSubmitTravelInfo {
    protected String getSuccessPage() {
        StringBuffer next = new StringBuffer(100);
        next.append(getSessionInfo().getServletPath());
        next.append("?").append(Constants.MODULE_KEY).append("=Static&");
        next.append(Constants.STATIC_PREFIX).append("1=tournaments&");
        next.append(Constants.STATIC_PREFIX).append("2=tccc07&");
        next.append(Constants.STATIC_PREFIX).append("3=docs&");
        next.append(Constants.STATIC_PREFIX).append("4=travelInfoSent");
        return next.toString();
    }

    protected String[] getRecipients() {
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            return new String[]{"jdamato@topcoder.com", "bhealy@topcoder.com", "coakes@topcoder.com"};
        } else {
            return new String[]{"gpaul@topcoder.com"};
        }
    }

    protected String[] getTravelAgentRecipients() {
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            return new String[0];
        } else {
            return new String[0];
        }
    }
}

