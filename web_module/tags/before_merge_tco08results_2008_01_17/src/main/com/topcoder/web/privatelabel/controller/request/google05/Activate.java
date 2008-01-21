package com.topcoder.web.privatelabel.controller.request.google05;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 7, 2005
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE05_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
