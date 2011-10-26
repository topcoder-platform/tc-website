package com.topcoder.web.distui.controller.request;


/**
 * @author dok
 * @version $Revision: 63685 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2007
 */
public class LeftNav extends Base {
    public void process() throws Exception {
        setNextPage("/leftNav.jsp");
        setIsNextPageInContext(true);
    }
}
