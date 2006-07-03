package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 24, 2006
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.VERISIGN_06_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
