package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.BaseActivate;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Activate extends BaseActivate {
    protected void setNextPage() {
        if (regInfo.getEventId()==1) {
            setNextPage("/doubleclick/col_reg.jsp");
        } else {
            setNextPage("/doubleclick/int_reg.jsp");
        }
        setIsNextPageInContext(true);

/*
        setNextPage(Constants.DC_ACTIVATION_PAGE);
        setIsNextPageInContext(true);
*/
    }
}
