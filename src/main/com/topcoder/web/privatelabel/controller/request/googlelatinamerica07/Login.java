package com.topcoder.web.privatelabel.controller.request.googlelatinamerica07;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullLogin;

import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 13, 2006
 */
public class Login extends FullLogin {
    

    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        Calendar beginning = Calendar.getInstance();
        beginning.set(2006, Calendar.DECEMBER, 10, 22, 30);
        end.set(2007, Calendar.JANUARY, 23, 7, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        //log.debug("new: " + regInfo.isNew() + " now " + now + " beginning " + beginning + " end " + end);
        if (regInfo != null && regInfo.isNew() && (now.before(beginning) || now.after(end))) {
            setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_LOGIN_PAGE);
                setIsNextPageInContext(true);
            } else {
                setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_REG_PAGE);
                setIsNextPageInContext(true);
            }
        }
    }


}
