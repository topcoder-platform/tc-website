package com.topcoder.web.tc.controller.request.tournament.tchs07;

import com.topcoder.web.tc.controller.request.tournament.BaseSubmitTravelInfo;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.ApplicationServer;

/**
 * @author dok
 * @version $Revision: 58341 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 8, 2007
 */
public class TravelInfoSubmit  extends BaseSubmitTravelInfo {
    protected String getSuccessPage() {
        StringBuffer next = new StringBuffer(100);
        next.append(getSessionInfo().getServletPath());
        next.append("?").append(Constants.MODULE_KEY).append("=Static&");
        next.append(Constants.STATIC_PREFIX).append("1=tournaments&");
        next.append(Constants.STATIC_PREFIX).append("2=tchs07&");
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
        return new String[0];
    }
}
