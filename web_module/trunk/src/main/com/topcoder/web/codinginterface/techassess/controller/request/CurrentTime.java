package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: rfairfax
 * Date: Dec 16, 2004
 */
public class CurrentTime extends Base {

    protected static Logger log = Logger.getLogger(CurrentTime.class);

    protected void techAssessProcessing() throws Exception {

        setNextPage(Constants.PAGE_CURRENT_TIME);
        setIsNextPageInContext(true);

    }

}
