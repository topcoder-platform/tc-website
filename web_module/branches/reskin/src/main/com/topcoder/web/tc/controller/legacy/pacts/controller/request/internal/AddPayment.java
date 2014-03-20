package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.TCWebException;

/**
 * Add a payment.
 * This class is just a "hook" for the role-based permissions.
 * All requests are redirected to the parent class.
 *
 * @author VolodymyrK
 */
public class AddPayment extends EditPayment {

    protected void businessProcessing() throws TCWebException {
        super.businessProcessing();
    }

}

