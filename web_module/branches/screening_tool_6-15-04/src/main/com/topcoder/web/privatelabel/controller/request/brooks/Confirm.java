package com.topcoder.web.privatelabel.controller.request.brooks;

import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.Constants;

/**
 * @author dok
 * Date: Jan 22, 2004
 */
public class Confirm extends FullRegConfirm {
    protected void setNextPage() {

        if (hasErrors()) {
            setNextPage(Constants.BROOKS_REG_DEMOG_PAGE);
        } else {
            setNextPage(Constants.BROOKS_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }



}
