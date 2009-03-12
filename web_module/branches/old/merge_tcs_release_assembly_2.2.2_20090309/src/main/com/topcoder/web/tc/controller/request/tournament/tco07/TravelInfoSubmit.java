package com.topcoder.web.tc.controller.request.tournament.tco07;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.tournament.BaseSubmitTravelInfo;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 1, 2007
 */
public class TravelInfoSubmit extends BaseSubmitTravelInfo {
    protected String getSuccessPage() {
        StringBuffer next = new StringBuffer(100);
        next.append(getSessionInfo().getServletPath());
        next.append("?").append(Constants.MODULE_KEY).append("=Static&");
        next.append(Constants.STATIC_PREFIX).append("1=tournaments&");
        next.append(Constants.STATIC_PREFIX).append("2=tco07&");
        next.append(Constants.STATIC_PREFIX).append("3=docs&");
        next.append(Constants.STATIC_PREFIX).append("4=travelInfoSent");
        return next.toString();
    }

    protected String[] getRecipients() {
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            return new String[]{"jdamato@topcoder.com", "bhealy@topcoder.com"};
        } else {
            return new String[]{"gpaul@topcoder.com"};
        }
    }

    protected String[] getTravelAgentRecipients() {
        if (ApplicationServer.ENVIRONMENT == ApplicationServer.PROD) {
            return new String[]{"claudiau@globetvl.com"};
        } else {
            return new String[]{"gpaul@topcoder.com"};
        }
    }
}
