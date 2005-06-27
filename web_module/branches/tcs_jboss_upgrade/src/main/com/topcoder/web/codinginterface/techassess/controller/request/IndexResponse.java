package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 22, 2004
 * Time: 11:09:48 AM
 */
public class IndexResponse extends Base {

    protected static Logger log = Logger.getLogger(IndexResponse.class);

    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            /* we'll just send it right off to the index page.  It has frames that
             * make servlet requests and those processors will take care of business logic
             */
            //log.debug("message id " + getRequest().getParameter(Constants.MESSAGE_ID));
            //if we don't have a message id, we're in trouble...perhaps we would throw an
            //explicit message
            loadSessionDefaultsIntoRequest(getRequest().getParameter(Constants.MESSAGE_ID), false);
            loadUserMessageIntoRequest(getRequest().getParameter(Constants.MESSAGE_ID));
            //log.debug("problems " + getDefault(Constants.PROBLEM_SETS));
            getRequest().setAttribute(Constants.PROBLEM_SETS, getDefault(Constants.PROBLEM_SETS));
            setNextPage(Constants.PAGE_INDEX);
            setIsNextPageInContext(true);
        }
    }
}
