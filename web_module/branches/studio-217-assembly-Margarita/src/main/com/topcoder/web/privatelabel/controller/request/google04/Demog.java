package com.topcoder.web.privatelabel.controller.request.google04;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

public class Demog extends FullRegDemog {
    protected void setNextPage() {
        //reg closed
        setNextPage(Constants.GOOGLE04_REG_CLOSED_PAGE);
        setIsNextPageInContext(true);

/*
        if (hasErrors()) {
            setNextPage(Constants.GOOGLE04_REG_PAGE);
        } else {
            setNextPage(Constants.GOOGLE04_REG_DEMOG_PAGE);
        }
        setIsNextPageInContext(true);
*/
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        if (((FullRegInfo) info).getCoderType() == 0) {
            addError(Constants.CODER_TYPE, "Please select your Student/Professional status.");
        }
    }
}
