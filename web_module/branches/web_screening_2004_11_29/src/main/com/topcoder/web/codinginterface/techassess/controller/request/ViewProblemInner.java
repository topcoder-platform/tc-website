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
            setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
            setIsNextPageInContext(false);

            if (hasParameter(Constants.MESSAGE_ID)) {
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionDefaultsIntoRequest(messageId, false);
                loadSessionErrorsIntoRequest(messageId);
                if (hasDefault(Constants.PROBLEM)) {
                    getRequest().setAttribute(Constants.MESSAGE_ID, messageId);
                    getRequest().setAttribute(Constants.PROBLEM, getDefault(Constants.PROBLEM));
                    setNextPage(Constants.PAGE_VIEW_PROBLEM_INNER);
                    setIsNextPageInContext(true);
                //this logic is mostly for the case that they hit refresh
                } else if (hasParameter(Constants.PROBLEM_TYPE_ID) && hasParameter(Constants.COMPONENT_ID)) {
                    setNextPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM,
                            new String[] {Constants.PROBLEM_TYPE_ID, Constants.COMPONENT_ID},
                            new String[] {getRequest().getParameter(Constants.PROBLEM_TYPE_ID),
                                          getRequest().getParameter(Constants.COMPONENT_ID)}));
                    setIsNextPageInContext(false);

                }
            }
        }
    }

}
