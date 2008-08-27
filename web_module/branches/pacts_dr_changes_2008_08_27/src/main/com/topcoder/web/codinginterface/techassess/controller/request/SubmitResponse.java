package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 18, 2005
 */
public class SubmitResponse extends Base {
    protected static final Logger log = Logger.getLogger(SubmitResponse.class);


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
                setNextPage(Constants.PAGE_SUBMIT_CONFIRM);
                setIsNextPageInContext(true);
            }
        }
    }

}
