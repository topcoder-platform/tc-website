/*
 * TCO05ComponentTerms.java
 *
 * Created on June 7, 2005, 11:08 AM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;
import java.util.Calendar;

/**
 *
 * @author rfairfax
 */
public class TCO05ComponentTerms extends TCO05AlgorithmTerms {

    public Calendar getStart() {
        Calendar start = Calendar.getInstance();
        start.set(2005, Calendar.JUNE, 13,9,0);
        return start;
    }
    
    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.MAY, 29, 9, 0);
        return end;
    }

    public String getEventName() {
        return "TCO Component Competition";
    }

    public int getTermsId() {
        return Constants.TCO05_COMPONENT_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tc");
            setIsNextPageInContext(false);
        } else {
            setNextPage(Constants.TCO05_TERMS);
            setIsNextPageInContext(true);
        }
    }

}
