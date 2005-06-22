/*
 * TCO05AlgorithmTerms.java
 *
 * Created on June 7, 2005, 10:24 AM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.Constants;
import java.util.Calendar;

/**
 *
 * @author rfairfax
 */
public class TCO05AlgorithmTerms extends TermsBase {

    public Calendar getEnd() {
        Calendar end = Calendar.getInstance();
        end.set(2005, Calendar.AUGUST, 16, 9, 0);
        return end;
    }

    public Calendar getBeginning() {
        Calendar beginning = Calendar.getInstance();
        beginning.set(2005, Calendar.AUGUST, 1, 9, 0);
        //beginning.set(2004, Calendar.JULY, 9, 9, 0);
        return beginning;
    }

    public String getEventName() {
        return "TCO Alogrithm Competition";
    }

    public int getTermsId() {
        return Constants.TCO05_ALGORITHM_TERMS_OF_USE_ID;
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

    public boolean isEligible() throws Exception {
        Request r = new Request();
        r.setContentHandle("tco05_eligibility");
        r.setProperty("cr", String.valueOf(getUser().getId()));
        ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("tco05_eligibility");
        log.debug("they " + (rsc.isEmpty() ? "are not" : "are") + " eligible");
        return !rsc.isEmpty();
    }

}