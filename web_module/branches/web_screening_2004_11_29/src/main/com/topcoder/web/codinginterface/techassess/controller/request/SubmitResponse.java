package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 18, 2005
 */
public class SubmitResponse extends Base {

    protected void techAssessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {
            setDefault(Constants.PROBLEM_TYPE_ID, getRequest().getParameter(Constants.PROBLEM_TYPE_ID));
            setDefault(Constants.COMPONENT_ID, getRequest().getParameter(Constants.COMPONENT_ID));
            setNextPage(Constants.PAGE_SUBMIT_CONFIRM);
            setIsNextPageInContext(true);
        }
    }

}
