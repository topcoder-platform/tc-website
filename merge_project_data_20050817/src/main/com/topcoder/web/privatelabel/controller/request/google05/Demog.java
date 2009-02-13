package com.topcoder.web.privatelabel.controller.request.google05;

import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.common.TCWebException;

import java.util.Calendar;
import java.util.Date;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 7, 2005
 */
public class Demog extends FullRegDemog {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.AUGUST, 19, 14, 0);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        beginning.set(2004, Calendar.JULY, 9, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(Constants.GOOGLE05_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE05_REG_PAGE);
            } else {
                setNextPage(Constants.GOOGLE05_REG_DEMOG_PAGE);
            }
            setIsNextPageInContext(true);
        }
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        if (((FullRegInfo) info).getCoderType() == 0) {
            addError(Constants.CODER_TYPE, "Please select your Student/Professional status.");
        }
    }
}
