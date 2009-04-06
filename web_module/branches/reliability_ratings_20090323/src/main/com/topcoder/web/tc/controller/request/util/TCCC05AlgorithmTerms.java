package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * User: dok
 * Date: Dec 15, 2004
 * Time: 10:39:42 AM
 */
public class TCCC05AlgorithmTerms extends TermsBase {

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.JANUARY, 11, 9, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        beginning.set(2004, Calendar.DECEMBER, 20, 9, 0);
        //beginning.set(2004, Calendar.JULY, 9, 9, 0);
        return beginning;
    }

    public String getEventName() {
        return "TCCC Algorithm Competition";
    }

    public int getTermsId() {
        return Constants.TCCC05_ALGORITHM_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tc");
            setIsNextPageInContext(false);
        } else {
            setNextPage(Constants.TCCC05_TERMS);
            setIsNextPageInContext(true);
        }
    }

    public boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tccc05_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("tccc05_eligibility");
        log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        return !rsc.isEmpty();
    }

}
