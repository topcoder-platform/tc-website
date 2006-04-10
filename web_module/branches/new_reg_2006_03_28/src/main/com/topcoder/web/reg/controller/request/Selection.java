package com.topcoder.web.reg.controller.request;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Selection extends Base {

    protected void registrationProcessing() throws Exception {
        setNextPage("/selection.jsp");
        setIsNextPageInContext(true);
    }

}
