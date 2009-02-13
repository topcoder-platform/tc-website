package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.util.logging.Logger;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 18, 2005
 */
public class SubmitResponse extends Base {
    protected static final Logger log = Logger.getLogger(SubmitResponse.class);


    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            loadSessionErrorsIntoRequest(getRequest().getParameter(Constants.MESSAGE_ID));
            log.debug("defaults: " + defaults);
            loadSessionDefaultsIntoRequest(getRequest().getParameter(Constants.MESSAGE_ID));
            log.debug("defaults: " + defaults);
            setNextPage(Constants.PAGE_SUBMIT_CONFIRM);
            setIsNextPageInContext(true);
        }
    }

}
