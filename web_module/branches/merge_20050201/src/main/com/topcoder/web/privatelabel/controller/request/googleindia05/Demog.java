package com.topcoder.web.privatelabel.controller.request.googleindia05;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 26, 2005
 */
public class Demog extends FullRegDemog {
    protected void setNextPage() {
        //reg closed
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE_INDIA_05_REG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE_INDIA_05_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        if (((FullRegInfo) info).getCoderType() == 0) {
            addError(Constants.CODER_TYPE, "Please select your Student/Professional status.");
        }

        //make a bunch of fields not required
        removeError(Constants.STATE_CODE);

    }
}
