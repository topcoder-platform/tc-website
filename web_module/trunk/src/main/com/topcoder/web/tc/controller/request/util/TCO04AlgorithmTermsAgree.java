package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.TCWebException;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:26:07 PM
 */
public class TCO04AlgorithmTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCO04AlgorithmTerms helper = new TCO04AlgorithmTerms();


    protected void TermsProcessing() throws TCWebException {

    }

    protected Calendar getEnd() {
        return helper.getEnd();
    }

    protected Calendar getBeginning() {
        return helper.getBeginning();
    }

    protected String getEventName() {
        return helper.getEventName();
    }

    protected int getTermsId() {
        return helper.getTermsId();
    }

    protected void setSuccessPage() {
        //just go to the default
        setIsNextPageInContext(false);
    }

    protected boolean isEligible() throws Exception {
        return helper.isEligible();
    }
}
