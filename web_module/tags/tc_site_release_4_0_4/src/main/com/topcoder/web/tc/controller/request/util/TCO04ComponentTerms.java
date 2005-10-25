package com.topcoder.web.tc.controller.request.util;

import com.topcoder.web.tc.Constants;

/**
 * User: dok
 * Date: Jul 30, 2004
 * Time: 3:34:18 PM
 */
public class TCO04ComponentTerms extends TCO04AlgorithmTerms {
    public String getEventName() {
        return "TCO Component Competition";
    }

    public int getTermsId() {
        return Constants.TCO04_COMPONENT_TERMS_OF_USE_ID;
    }

    protected void setSuccessPage() throws Exception {
        if (isRegistered()) {
            setIsNextPageInContext(false);
        } else {
            setNextPage(Constants.TCO04_TERMS);
            setIsNextPageInContext(true);
        }
    }
}
