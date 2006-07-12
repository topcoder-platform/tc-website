package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.BROOKS_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
