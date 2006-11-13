package com.topcoder.web.privatelabel.controller.request.googleindia06;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_INDIA_06_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
