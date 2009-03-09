package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:41 AM
 */
public class TestResponse extends Base {

    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
            setIsNextPageInContext(false);

            if (hasParameter(Constants.MESSAGE_ID)) {
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionDefaultsIntoRequest(messageId);
                loadSessionErrorsIntoRequest(messageId);
                loadUserMessageIntoRequest(messageId);
                if (getRequest().getAttribute(Constants.MESSAGE)!=null) {
                    setNextPage(Constants.PAGE_TEST_RESULT);
                    setIsNextPageInContext(true);
                    //this logic is mostly for the case that they hit refresh
                } else if (hasParameter(Constants.PROBLEM_TYPE_ID) && hasParameter(Constants.COMPONENT_ID)) {
                    setNextPage(buildProcessorRequestString(Constants.RP_TEST_WINDOW,
                            new String[]{Constants.PROBLEM_TYPE_ID, Constants.COMPONENT_ID},
                            new String[]{getRequest().getParameter(Constants.PROBLEM_TYPE_ID),
                                         getRequest().getParameter(Constants.COMPONENT_ID)}));
                    setIsNextPageInContext(false);

                }
            }
        }
    }


}


