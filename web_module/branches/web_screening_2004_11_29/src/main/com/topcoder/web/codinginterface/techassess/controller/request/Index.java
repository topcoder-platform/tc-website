package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Index extends Base {


    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
