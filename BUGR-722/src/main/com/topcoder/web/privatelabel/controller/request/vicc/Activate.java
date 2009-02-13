package com.topcoder.web.privatelabel.controller.request.vicc;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 24, 2006
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        setNextPage(Constants.VICC_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
    }
}
