package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 21, 2005
 */
public class TCO06ComponentTerms extends TCO06AlgorithmTerms {

    public Calendar getBeginning() {
        Calendar start = Calendar.getInstance();
        start.set(2005, Calendar.JANUARY, 2,9,0);
        return start;
    }

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.FEBRUARY, 15, 9, 0);
        return end;
    }

    public String getEventName() {
        return "TCO Component Competition";
    }

    public int getTermsId() {
        return Constants.TCO06_COMPONENT_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tc");
            setIsNextPageInContext(false);
        } else {
            setNextPage("/tournaments/tco06/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

}
