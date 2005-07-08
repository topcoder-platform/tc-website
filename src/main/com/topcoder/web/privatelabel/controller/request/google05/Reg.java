package com.topcoder.web.privatelabel.controller.request.google05;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullReg;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.Request;

import java.util.Map;
import java.util.Calendar;
import java.util.Date;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 7, 2005
 */
public class Reg extends FullReg {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.AUGUST, 19, 14, 0);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 7, 0);
        beginning.set(2004, Calendar.JULY, 9, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(Constants.GOOGLE05_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.GOOGLE05_REG_PAGE);
            setIsNextPageInContext(true);
        }
    }

}
