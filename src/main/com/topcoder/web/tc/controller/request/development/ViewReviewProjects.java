package com.topcoder.web.tc.controller.request.development;

import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * Date: Feb 10, 2004
 */
public class ViewReviewProjects extends Base {

    protected void developmentProcessing() throws TCWebException {
        setNextPage("/dev/reviewProjects.jsp");
        setIsNextPageInContext(true);
    }


}
