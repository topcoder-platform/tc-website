package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 22, 2004
 * Time: 11:09:48 AM
 */
public class IndexResponse extends Base {


    protected static Logger log = Logger.getLogger(IndexResponse.class);

    protected void businessProcessing() throws Exception {
        /* we'll use this as our default.
         * most likely this means they hit refresh, or they got here via some magic force
         * in either case, lets try sending them back to the index
         */
        setNextPage(buildProcessorRequestString(Constants.RP_INDEX, null, null));
        setIsNextPageInContext(false);

        if (hasParameter(Constants.MESSAGE_ID)) {
            String messageId = getRequest().getParameter(Constants.MESSAGE_ID);
            loadSessionErrorsIntoRequest(messageId);
            loadSessionDefaultsIntoRequest(messageId);
            if (hasDefault(Constants.PROBLEM_SETS)&&hasDefault(Constants.LANGUAGES)) {
                getRequest().setAttribute(Constants.PROBLEM_SETS, getDefault(Constants.PROBLEM_SETS));
                getRequest().setAttribute(Constants.LANGUAGES, getDefault(Constants.LANGUAGES));
                setNextPage(Constants.PAGE_INDEX);
                setIsNextPageInContext(true);
            }
        }

    }


}
