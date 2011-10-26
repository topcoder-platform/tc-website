package com.topcoder.web.privatelabel.controller.request.googleeurope06;

import com.topcoder.web.privatelabel.controller.request.BaseActivate;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * @version $Revision: 44242 $ Date: 2005/01/01 00:00:00
 *          Create Date: Apr 17, 2006
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.GOOGLE_EUROPE_06_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
