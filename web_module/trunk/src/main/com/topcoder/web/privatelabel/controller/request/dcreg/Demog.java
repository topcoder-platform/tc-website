package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Demog extends FullRegDemog {
    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.DC_REG_PAGE);
        } else {
            setNextPage(Constants.DC_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }


    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);
        //we're not bothering with an email confirmation field, so don't require it
        removeError(Constants.EMAIL_CONFIRM);
    }
}
