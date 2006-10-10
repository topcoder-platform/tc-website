package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.CharityPayment;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;

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

