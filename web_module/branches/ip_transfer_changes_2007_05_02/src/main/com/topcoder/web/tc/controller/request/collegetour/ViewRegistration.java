package com.topcoder.web.tc.controller.request.collegetour;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 9, 2006
 */
public class ViewRegistration extends Base {
    protected void collegeTourProcessing() throws Exception {
        setNextPage("/collegetour/confirm.jsp");
        setIsNextPageInContext(true);
    }

}
