/******************************************************************************\
 *
 * File:          InternalDispatchPayment.java
 * Creation date: March 16, 2002 19:32
 * Author:        Matt Murphy
 *
 * Modifications: @INSERT_MODIFICATIONS(* )
 *
 * Copyright 2002, TopCoder, Inc
 * All rights are reserved. Reproduction in whole or part is prohibited
 * without the written consent of the copyright owner.
 *
 \******************************************************************************/

package com.topcoder.web.tc.controller.legacy.pacts.bean.pacts_internal.dispatch;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer.ResultSetRow;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.Payment;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchPayment implements PactsConstants {
	private static Logger log = Logger.getLogger(InternalDispatchPayment.class);
	
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchPayment(HttpServletRequest request,
                                   HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an Payment object matching the payment_id parameter
     *
     * @Args    - none
     * @Returns - Payment
     *
     */
    public Payment get() throws Exception {

        long payment_id = Long.parseLong(request.getParameter(PAYMENT_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getPayment(payment_id);

        return new Payment(results);
    }

    /**
     *
     * This method returns an Payment object matching the payment_id parameter
     *
     * @Args    - payment_id
     * @Returns - Payment
     *
     */
    public Payment get(long payment_id) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getPayment(payment_id);

        return new Payment(results);
    }
    
    /**
     * This method returns the date which the given payment was created on.
     *
     * @Args   - payment
     * @return - String
     */
     public String getCreationDate(PaymentHeader payment) throws Exception {
     	DataInterfaceBean bean = new DataInterfaceBean();	
     	long payments[] = new long[1];
     	payments[0] = payment.getId();
     	Map results = bean.getCreationDates(payments);
     	ResultSetContainer rsc = (ResultSetContainer)results.get(CREATION_DATE_LIST);
     	
     	if (rsc == null) {
             log.error("There were no " + CREATION_DATE_LIST + " entries in the" +
                     " result set map sent to InternalDispatchPaymentList.getCreatedDates()");
             return null;
         }

         // see if there are any rows of data
         int numRows = rsc.getRowCount();
         if (numRows <= 0) {
             log.debug("there were no rows of data in the result set sent\n" +
                     "to InternalDispatchPaymentList.getCreatedDates()");
             return null;
         }
         
         ResultSetRow rRow = rsc.getRow(0);
         String creationDate = TCData.getTCDate(rRow, "date_created");
         return creationDate;
     }
}
