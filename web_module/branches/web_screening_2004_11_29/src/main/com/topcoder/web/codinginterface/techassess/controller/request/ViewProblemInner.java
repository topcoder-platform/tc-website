package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 23, 2004
 */
public class ViewProblemInner extends Base {

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            setNextPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM, null, null));
            setIsNextPageInContext(false);

            if (hasParameter(Constants.MESSAGE_ID)) {
                log.debug("has message id");
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionErrorsIntoRequest(messageId);
                loadSessionDefaultsIntoRequest(messageId);
                log.debug("defaults: " + defaults);
                if (hasDefault(Constants.PROBLEM)) {
                    log.debug("has defaults");
                    getRequest().setAttribute(Constants.PROBLEM, getDefault(Constants.PROBLEM));
                    setNextPage(Constants.PAGE_VIEW_PROBLEM_INNER);
                    setIsNextPageInContext(true);
                }
            }
        }
    }

}
