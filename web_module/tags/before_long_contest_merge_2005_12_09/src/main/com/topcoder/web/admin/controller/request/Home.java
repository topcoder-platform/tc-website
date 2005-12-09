package com.topcoder.web.admin.controller.request;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Apr 27, 2005
 */
public class Home extends Base {

    protected void businessProcessing() throws Exception {

        setNextPage("/home.jsp");
        setIsNextPageInContext(true);

    }


}
