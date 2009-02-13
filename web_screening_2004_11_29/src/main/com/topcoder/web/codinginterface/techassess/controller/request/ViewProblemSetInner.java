package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 22, 2004
 */
public class ViewProblemSetInner extends Base {

    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
            setIsNextPageInContext(false);
            if (hasParameter(Constants.MESSAGE_ID)) {
                log.debug("has message id");
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionErrorsIntoRequest(messageId);
                loadSessionDefaultsIntoRequest(messageId);
                log.debug("defaults: " + defaults);
                if (hasDefault(Constants.PROBLEMS) && hasDefault(Constants.PROBLEM_TYPE_ID) &&
                        hasDefault(Constants.CONTINUE_LINK) && hasDefault(Constants.CONTINUE_DESC)) {
                    log.debug("has defaults");
                    getRequest().setAttribute(Constants.PROBLEMS, getDefault(Constants.PROBLEMS));
                    getRequest().setAttribute(Constants.PROBLEM_TYPE_ID, getDefault(Constants.PROBLEM_TYPE_ID));
                    getRequest().setAttribute(Constants.CONTINUE_LINK, getDefault(Constants.CONTINUE_LINK));
                    getRequest().setAttribute(Constants.CONTINUE_DESC, getDefault(Constants.CONTINUE_DESC));
                    setNextPage(Constants.PAGE_VIEW_PROBLEM_SET_INNER);
                    setIsNextPageInContext(true);
                } else {
                    //this logic is mostly for the case that they hit refresh
                    if (hasParameter(Constants.PROBLEM_TYPE_ID)) {
                        setNextPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET,
                                new String[] {Constants.PROBLEM_TYPE_ID},
                                new String[] {getRequest().getParameter(Constants.PROBLEM_TYPE_ID)}));
                        setIsNextPageInContext(false);
                    }
                }
            }
        }


    }
}
