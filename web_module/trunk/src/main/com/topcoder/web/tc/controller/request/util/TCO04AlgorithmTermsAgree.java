package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.TCRequest;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:26:07 PM
 */
public class TCO04AlgorithmTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCO04AlgorithmTerms helper = new TCO04AlgorithmTerms();

    /**
     * We need this method so that we can set the request on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param request
     */
    public void setRequest(TCRequest request) {
        super.setRequest(request);
        helper.setRequest(request);
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
