package com.topcoder.web.privatelabel.controller.request.googlesouthamerica07;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 13, 2006
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_SOUTH_AMERICA_07_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
