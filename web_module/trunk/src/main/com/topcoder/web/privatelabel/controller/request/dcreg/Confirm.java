package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends FullRegConfirm {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.DC_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.DC_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }

}
