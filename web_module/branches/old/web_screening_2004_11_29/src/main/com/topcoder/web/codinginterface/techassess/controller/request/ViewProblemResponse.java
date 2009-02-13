package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 23, 2004
 * Time: 2:52:50 PM
 */
public class ViewProblemResponse extends Base {

    protected static final Logger log = Logger.getLogger(ViewProblemSetResponse.class);

    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            /* we'll just send it right off to the view problem set page.  It has frames that
             * make servlet requests and those processors will take care of business logic
             */
            setNextPage(Constants.PAGE_VIEW_PROBLEM);
            setIsNextPageInContext(true);
        }
    }



}
