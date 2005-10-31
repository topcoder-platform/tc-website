package com.topcoder.web.admin.controller.request;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.dataAccess.Request;

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
