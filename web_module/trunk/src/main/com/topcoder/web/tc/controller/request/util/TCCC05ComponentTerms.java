package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * User: dok
 * Date: Dec 15, 2004
 * Time: 10:40:08 AM
 */
public class TCCC05ComponentTerms extends TCCC05AlgorithmTerms {

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.JANUARY, 3, 9, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2004, Calendar.DECEMBER, 20, 9, 0);
        beginning.set(2004, Calendar.JULY, 9, 9, 0);
        return beginning;
    }


    public String getEventName() {
        return "TCCC Component Competition";
    }

    public int getTermsId() {
        return Constants.TCCC05_COMPONENT_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setIsNextPageInContext(false);
        } else {
            setNextPage(Constants.TCCC05_TERMS);
            setIsNextPageInContext(true);
        }
    }

}
