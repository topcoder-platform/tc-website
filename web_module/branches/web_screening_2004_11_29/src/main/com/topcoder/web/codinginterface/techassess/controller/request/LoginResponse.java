package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 17, 2004
 */
public class LoginResponse extends Base {

    protected static final Logger log = Logger.getLogger(LoginResponse.class);

    protected void businessProcessing() throws Exception {
        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
            setIsNextPageInContext(false);

            if (hasParameter(Constants.MESSAGE_ID)) {
                String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
                loadSessionErrorsIntoRequest(messageId);
                loadSessionDefaultsIntoRequest(messageId);
                if (hasErrors()) {
                    setNextPage(Constants.PAGE_LOGIN);
                    setIsNextPageInContext(true);
                }
            }
        }
    }
}
