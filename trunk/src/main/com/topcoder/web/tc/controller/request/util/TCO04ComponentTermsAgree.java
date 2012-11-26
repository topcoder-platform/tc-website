package com.topcoder.web.tc.controller.request.util;

import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.ejb.user.UserEvent;
import com.topcoder.web.tc.Constants;

import java.util.Calendar;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:36:38 PM
 */
public class TCO04ComponentTermsAgree extends TermsAgreeBase {
    //dammit, my kingdom for some multiple inheritance!!!
    private TCO04ComponentTerms helper = new TCO04ComponentTerms();

    //overload this event, will throw exception if unsuccessful
    protected void businessProcessing() throws Exception {
        super.businessProcessing();

        //if we're here, this is successful
        UserEvent userEvent = (UserEvent) createEJB(getInitialContext(), UserEvent.class);
        userEvent.createUserEvent(getUser().getId(), Constants.TCO04_EVENT_ID, DBMS.TCS_OLTP_DATASOURCE_NAME);
    }

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


    public Calendar getEnd() {
        return helper.getEnd();
    }

    public Calendar getBeginning() {
        return helper.getBeginning();
    }

    public String getEventName() {
        return helper.getEventName();
    }

    public int getTermsId() {
        return helper.getTermsId();
    }

    protected void setSuccessPage() {
        setIsNextPageInContext(false);
    }

    public boolean isEligible() throws Exception {
        return helper.isEligible();
    }
}
