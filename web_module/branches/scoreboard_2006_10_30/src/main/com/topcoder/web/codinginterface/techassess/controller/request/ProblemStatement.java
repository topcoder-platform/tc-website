package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 29, 2004
 * Time: 3:07:24 PM
 */
public class ProblemStatement extends Base {

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
                if (hasDefault(Constants.PROBLEM)) {
                    //log.debug("has defaults");
                    getRequest().setAttribute(Constants.PROBLEM, getDefault(Constants.PROBLEM));
                    setNextPage(Constants.PAGE_PROBLEM_STATEMENT);
                    setIsNextPageInContext(true);
                }
            }

        }
    }


}
