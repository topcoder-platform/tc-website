package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:36:38 PM
 */
public class TCO04ComponentTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCO04ComponentTerms helper = new TCO04ComponentTerms();

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

    /**
     * We need this method so that we can set the response on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param response
     */
    public void setResponse(TCResponse response) {
        super.setResponse(response);
        helper.setResponse(response);
    }

    /**
     * We need this method so that we can set the authentication on our
     * little helper processor.  We can't have multiple inheritance
     * so we need this processor so that we can access some
     * of the convenience methods in <cdoe>TermsBase</code>
     * but we want to use the business logic
     * contained in <code>TermsAgreeBase</code>
     * @param auth
     */
    public void setAuthentication(WebAuthentication auth) {
        super.setAuthentication(auth);
        helper.setAuthentication(auth);
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
