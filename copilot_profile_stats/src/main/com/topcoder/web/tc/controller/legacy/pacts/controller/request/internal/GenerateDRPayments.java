/*
 * Copyright (C) 2002-2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.pacts.BasePayment;
import com.topcoder.web.ejb.pacts.DigitalRunV2PrizePayment;
import com.topcoder.web.ejb.pacts.DigitalRunV2TopPerformersPayment;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Links;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * <p>A controller for handling the requests for generating the payments for requested <code>Digital Run</code> track.
 * </p>
 *
 * <p>As of version 2.0 the controller has been totally re-written to switch to latest <code>Digital Run</code> schema.
 * </p>
 *
 * @author cucu, isv
 * @version 2.0
 */
public class GenerateDRPayments extends ShortHibernateProcessor implements PactsConstants {

    /**
     * <p>Constructs new <code>GenerateDRPayments</code> instance. This implementation does nothing.</p>
     *
     * @since 2.0
     */
    public GenerateDRPayments() {
    }

    /**
     * <p>Implements the business logic for processing the incoming request. Retrieves the list of <code>Digital Run
     * </code> payments to be generated and generates them.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        String[] pay = getRequest().getParameterValues("pay");
        
        if ((pay == null) || (pay.length == 0)) {
            throw new NavigationException("No payments selected");
        }

        try {
            long trackId = Long.parseLong(getRequest().getParameter(Constants.TRACK_ID));
            DataInterfaceBean bean = new DataInterfaceBean();
            List<Long> ids = new ArrayList<Long>();

            for (String s : pay) {
                String[] values = s.split(":");
                Integer contestTypeId = new Integer(values[0]);
                Integer place = new Integer(values[1]);
                Long coderId = new Long(values[2]);
                Double amount = new Double(values[3]);

                // Create the payment in PACTS
                BasePayment payment;
                if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_PRIZE)) {
                    payment = new DigitalRunV2PrizePayment(coderId, amount, trackId, place);
                } else if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_TOP_PERFORMERS)) {
                    payment = new DigitalRunV2TopPerformersPayment(coderId, amount, trackId, place);
                } else {
                    throw new Exception("Invalid contest type: " + contestTypeId);
                }
                payment = bean.addPayment(payment);
                ids.add(payment.getId());
            }
            setNextPage(Links.viewPayments(ids));
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new TCWebException("Failed to generate Digital Run payments", e); 
        }
    }
}
