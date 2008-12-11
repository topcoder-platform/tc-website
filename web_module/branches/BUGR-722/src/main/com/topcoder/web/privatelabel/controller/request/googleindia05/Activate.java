package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author  dok
 * @version  $Revision: 31164 $ $Date$
 * Create Date: Jan 26, 2005
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_INDIA_05_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}

