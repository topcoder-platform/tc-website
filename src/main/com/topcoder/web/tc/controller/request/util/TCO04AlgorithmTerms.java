package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 2:10:57 PM
 */
public class TCO04AlgorithmTerms extends TermsBase {

    protected void TermsProcessing() throws TCWebException {
    }

    protected Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2004, Calendar.SEPTEMBER, 7, 9, 0);
        return end;
    }

    protected Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        beginning.set(2004, Calendar.AUGUST, 9, 9, 0);
        return beginning;
    }

    protected String getEventName() {
        return "TCO Alogrithm Competition";
    }

    protected int getTermsId() {
        return Constants.TCO04_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() {
        setNextPage(Constants.TCCC04_TERMS);
        setIsNextPageInContext(true);
    }

    protected boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tco04_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc = (ResultSetContainer)getDataAccess().getData(r).get("tco04_eligibility");
        log.debug("they " + (rsc.isEmpty()?"are not":"are") + " eligible");
        return !rsc.isEmpty();
    }


}

