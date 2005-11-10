package com.topcoder.web.privatelabel.controller.request.googlechina05;

import com.topcoder.web.privatelabel.controller.request.FullLogin;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.shared.util.TCResourceBundle;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Oct 31, 2005
 */
public class Login extends FullLogin {

    protected void setNextPage() {
        TCResourceBundle bundle = new TCResourceBundle("PrivateLabel", regInfo.getLocale());
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.DECEMBER, 5, 20, 0);
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2005, Calendar.JULY, 25, 9, 0);
        beginning.set(2005, Calendar.OCTOBER, 31, 9, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        if (now.before(beginning) || now.after(end)) {
            setNextPage(bundle.getProperty("google_china_05_reg_closed_page"));
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(bundle.getProperty("google_china_05_login_page"));
                setIsNextPageInContext(true);
            } else {
                setNextPage(bundle.getProperty("google_china_05_reg_page"));
                setIsNextPageInContext(true);
            }
        }
    }





}
