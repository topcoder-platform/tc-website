package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;

/**
 * User: dok
 * Date: Dec 17, 2004
 */
public class LoginResponse extends Base {

    protected static Logger log = Logger.getLogger(LoginResponse.class);

    protected void businessProcessing() throws Exception {
        if (hasParameter(Constants.MESSAGE_ID)) {
            String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
            loadSessionErrorsIntoRequest(messageId);
            loadSessionDefaultsIntoRequest(messageId);
            setDefault(Constants.COMPANY_ID,
                    getRequest().getSession().getAttribute(Constants.COMPANY_ID));
            getRequest().getSession().removeAttribute(Constants.COMPANY_ID);
            setNextPage(Constants.PAGE_LOGIN);
            setIsNextPageInContext(true);
        } else {
            //we must be all set then, just forward on to the next page
            setNextPage(Constants.PAGE_INDEX);
            setIsNextPageInContext(true);
        }

    }
}
