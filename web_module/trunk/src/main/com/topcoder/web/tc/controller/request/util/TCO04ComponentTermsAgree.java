package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.TCWebException;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:36:38 PM
 */
public class TCO04ComponentTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCO04ComponentTerms helper = new TCO04ComponentTerms();

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
