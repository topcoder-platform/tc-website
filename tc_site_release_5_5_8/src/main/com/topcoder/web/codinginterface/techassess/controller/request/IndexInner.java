package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 21, 2004
 * Time: 3:19:32 PM
 */
public class IndexInner extends Base {


    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
            setIsNextPageInContext(false);

            if (hasParameter(Constants.MESSAGE_ID)) {
                //log.debug("has message id");
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionErrorsIntoRequest(messageId);
                loadSessionDefaultsIntoRequest(messageId);
                loadUserMessageIntoRequest(messageId);
                //log.debug("defaults: " + defaults);
                if (hasDefault(Constants.PROBLEM_SETS)) {
                    //log.debug("has defaults");
                    getRequest().setAttribute(Constants.PROBLEM_SETS, getDefault(Constants.PROBLEM_SETS));
                    setNextPage(Constants.PAGE_INDEX_INNER);
                    setIsNextPageInContext(true);
                }
            }
        }
    }
}
