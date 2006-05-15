package com.topcoder.web.reg.controller.request;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 15, 2006
 */
public class ViewSchoolSearch extends Base  {
    protected void registrationProcessing() throws Exception {
        setNextPage("/school.jsp");
        setIsNextPageInContext(true);
    }
}
