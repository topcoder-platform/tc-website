/*
 * Copyright (C) 2002-2011 TopCoder Inc., All Rights Reserved.
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
import com.topcoder.web.ejb.pacts.DigitalRunV2TaxablePrizePayment;
import com.topcoder.web.ejb.pacts.DigitalRunV2TaxableTopPerformersPayment;
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
 * <p>Since version 2.1 the tax withholdings are applied to the DR winnings.
 * </p>
 *
 * @author cucu, isv, VolodymyrK
 * @version 2.1
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
                Double nonTaxableAmount = new Double(values[3]);
                Double taxableAmount = new Double(values[4]);

                // Create the non-taxable payment in PACTS.
                BasePayment nonTaxablePayment = null;
                if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_PRIZE)) {
                    nonTaxablePayment = new DigitalRunV2PrizePayment(coderId, nonTaxableAmount, trackId, place);
                } else if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_TOP_PERFORMERS)) {
                    nonTaxablePayment = new DigitalRunV2TopPerformersPayment(coderId, nonTaxableAmount, trackId, place);
                } else {
                    throw new Exception("Invalid contest type: " + contestTypeId);
                }
                nonTaxablePayment = bean.addPayment(nonTaxablePayment);
                ids.add(nonTaxablePayment.getId());

                // Create the taxable payment in PACTS.
                if (taxableAmount > 0) {
                    BasePayment taxablePayment = null;
                    if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_PRIZE)) {
                        taxablePayment = new DigitalRunV2TaxablePrizePayment(coderId, taxableAmount, trackId, place);
                    } else if (contestTypeId.equals(Constants.CONTEST_TYPE_DR_V2_TOP_PERFORMERS)) {
                        taxablePayment = new DigitalRunV2TaxableTopPerformersPayment(coderId, taxableAmount, trackId, place);
                    } else {
                        throw new Exception("Invalid contest type: " + contestTypeId);
                    }
                    double netAmount = bean.computePaymentNetAmount(taxablePayment.getPaymentType(), taxablePayment.getGrossAmount(), taxablePayment.getCoderId());
                    taxablePayment.setNetAmount(netAmount);
                    taxablePayment = bean.addPayment(taxablePayment);
                    ids.add(taxablePayment.getId());
                }
            }

            setNextPage(Links.viewPayments(ids));
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new TCWebException("Failed to generate Digital Run payments", e); 
        }
    }
}
