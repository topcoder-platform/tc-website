package com.topcoder.web.privatelabel.controller.request.dcreg;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
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
        if (((FullRegInfo)info).getCoderType()==Constants.STUDENT &&
                !(info.getEmail().toLowerCase().endsWith("columbia.edu") ||
                info.getEmail().toLowerCase().endsWith("nyu.edu") ||
                info.getEmail().equals("gpaul@topcoder.com") ||
                info.getEmail().equals("mluce@topcoder.com"))) {
            addError(Constants.EMAIL, "Please provide a valid email address ending in either columbia.edu or nyu.edu");
        }
        //we're not bothering with an email confirmation field, so don't require it
        removeError(Constants.EMAIL_CONFIRM);
    }
}
