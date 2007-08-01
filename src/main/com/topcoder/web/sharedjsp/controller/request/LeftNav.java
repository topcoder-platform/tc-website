package com.topcoder.web.sharedjsp.controller.request;


/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2007
 */
public class LeftNav extends Base {
    public void process() throws Exception {
        setNextPage("/global_left.jsp");
        setIsNextPageInContext(true);
    }
}
