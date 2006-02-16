package com.topcoder.web.forums.controller.request;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 16, 2006
 */
public class NavList extends ForumsProcessor {

    protected void businessProcessing() throws Exception {
        super.businessProcessing();
        setNextPage("/navList.jsp");
        setIsNextPageInContext(true);
    }

}
