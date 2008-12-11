package com.topcoder.web.privatelabel.controller.request.google06;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullReg;

import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 4, 2006
 */
public class Reg extends FullReg {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        Calendar beginning = Calendar.getInstance();
        beginning.set(2006, Calendar.FEBRUARY, 14, 22, 30);
        end.set(2006, Calendar.SEPTEMBER, 5, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (regInfo.isNew() && (now.before(beginning) || now.after(end))) {
            setNextPage(Constants.GOOGLE_06_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.GOOGLE_06_REG_PAGE);
            setIsNextPageInContext(true);
        }
    }


}
