package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 25, 2006
 */
public class TCCC06AlgorithmTerms extends TermsBase {

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2006, Calendar.SEPTEMBER, 12, 18, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        //beginning.set(2006, Calendar.FEBRUARY, 13, 9, 0);
        beginning.set(2006, Calendar.AUGUST, 28, 9, 0);
        return beginning;
    }

    public String getEventName() {
        return "TCCC Alogrithm Competition";
    }

    public int getTermsId() {
        return Constants.TCCC06_ALGORITHM_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setNextPage("/tc");
            setIsNextPageInContext(false);
        } else {
            setNextPage("/tournaments/tccc06/terms.jsp");
            setIsNextPageInContext(true);
        }
    }

    public boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tccc06_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("tccc06_eligibility");
        if (log.isDebugEnabled()) {
            log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        }
        return !rsc.isEmpty();
    }

}
