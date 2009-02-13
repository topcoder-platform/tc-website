package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * Add or update a payment.
 *
 * @author  cucu
 */
public class Login extends PactsBaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        setNextPage("/tc?module=Login");
        setIsNextPageInContext(true);
    }
}

