package com.topcoder.web.tc.controller.request.tournament;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 1, 2005
 */
public class TCCC05TravelInfoSubmit extends BaseSubmitTravelInfo {
    protected String getSuccessPage() {
         return "/tournaments/tccc05/travelInfoSet.jsp";
    }
    protected String[] getRecipients() {
        return new String[] {"mluce@topcoder.com"};
    }
}
