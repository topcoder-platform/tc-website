package com.topcoder.web.ep.controller.request.admin;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Oct 18, 2007
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        setNextPage("/admin/index.jsp");
        setIsNextPageInContext(true);
    }
}
