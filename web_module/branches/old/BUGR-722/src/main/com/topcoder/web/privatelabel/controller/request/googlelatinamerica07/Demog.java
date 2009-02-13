package com.topcoder.web.privatelabel.controller.request.googlelatinamerica07;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegDemog;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Calendar;
import java.util.Date;

/**
 * @author dok
 * @version $Revision: 55553 $ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 13, 2006
 */
public class Demog extends FullRegDemog {
    protected void setNextPage() {
        Calendar end = Calendar.getInstance();
        Calendar beginning = Calendar.getInstance();
        beginning.set(2006, Calendar.DECEMBER, 10, 22, 30);
        end.set(2007, Calendar.JANUARY, 23, 7, 0);

        Calendar now = Calendar.getInstance();
        now.setTime(new Date());

        
        if (regInfo.isNew() && (now.before(beginning) || now.after(end))) {
            setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_REG_CLOSED_PAGE);
            setIsNextPageInContext(true);
        } else {
            if (hasErrors()) {
                setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_REG_PAGE);
            } else {
                setNextPage(Constants.GOOGLE_LATIN_AMERICA_07_REG_DEMOG_PAGE);
            }
            setIsNextPageInContext(true);
        }
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        if (((FullRegInfo) info).getCoderType() == 0) {
            addError(Constants.CODER_TYPE, getBundle().getProperty("error_enter_stud_pro"));
        }

        //check comp country code
        if (info.getCompCountryCode().trim().length() == 0 || findFullCountry(info.getCompCountryCode()) == null) {
            addError(Constants.COMP_COUNTRY_CODE, getBundle().getProperty("error_enter_comp_country"));
        }

        //make a bunch of fields not required
        removeError(Constants.STATE_CODE);

    }


}
