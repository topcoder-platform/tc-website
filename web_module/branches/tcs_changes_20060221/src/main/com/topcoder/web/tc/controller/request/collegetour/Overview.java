package com.topcoder.web.tc.controller.request.collegetour;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 5, 2005
 */
public class Overview extends Base {

    protected void collegeTourProcessing() throws Exception {
        loadConfigInfo();
        setNextPage("/collegetour/overview.jsp");
        setIsNextPageInContext(true);
    }

}
