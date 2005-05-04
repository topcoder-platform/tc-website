package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 17, 2004
 */
public class LoginResponse extends Base {

    protected static final Logger log = Logger.getLogger(LoginResponse.class);

    protected void techAssessProcessing() throws Exception {
        setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
        setIsNextPageInContext(false);

        if (hasParameter(Constants.MESSAGE_ID)) {
            String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
            loadSessionErrorsIntoRequest(messageId);
            loadUserMessageIntoRequest(messageId);
            loadSessionDefaultsIntoRequest(messageId);
            //no handle default means that they are just loading up the login page to login
            if (hasErrors()||!hasDefault(Constants.HANDLE)) {
                setNextPage(Constants.PAGE_LOGIN);
                setIsNextPageInContext(true);
            } else if (getUser().isAnonymous()) {
                //this must mean they hit refresh on the response page as they
                //don't have any errors suggesting a user/password entry mistake
                //and they are not logged in, so why else would they be here
                setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,null, null));
                setIsNextPageInContext(false);

            }
        }
    }
}
