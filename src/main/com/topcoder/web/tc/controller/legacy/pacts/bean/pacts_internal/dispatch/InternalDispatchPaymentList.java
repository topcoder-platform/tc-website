/******************************************************************************\
 *
 * File:          InternalDispatchPaymentList.java
 * Creation date: March 11, 2002 19:32
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

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.PaymentHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Hashtable;
import java.util.Map;

public class InternalDispatchPaymentList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchPaymentList(HttpServletRequest request,
                                       HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an array of PaymentHeaders that match the search criteria.
     * The criteria are found in the cgi variables of request.
     * Method assumes at least one search parameter exists.
     *
     * @return - PaymentHeader[]
     *
     */
    public PaymentHeader[] get() throws Exception {
        Map query = new Hashtable();
        String param;

/*
    public static final String EARLIEST_PRINT_DATE = "earliest_print_date";
    public static final String LATEST_PRINT_DATE = "latest_print_date";
    public static final String EARLIEST_PAY_DATE = "earliest_pay_date";
    public static final String LATEST_PAY_DATE = "latest_pay_date";
*/

        param = request.getParameter(STATUS_CODE);
        if (param != null && !param.equals("")) query.put(STATUS_CODE, param);
        param = request.getParameter(TYPE_CODE);
        if (param != null && !param.equals("")) query.put(TYPE_CODE, param);
        param = request.getParameter(EARLIEST_DUE_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_DUE_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_DUE_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_DUE_DATE, TCData.dateForm(param));
        param = request.getParameter(EARLIEST_PRINT_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_PRINT_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_PRINT_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_PRINT_DATE, TCData.dateForm(param));
        param = request.getParameter(EARLIEST_PAY_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_PAY_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_PAY_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_PAY_DATE, TCData.dateForm(param));
        param = request.getParameter(LOWEST_NET_AMOUNT);
        if (param != null && !param.equals("")) query.put(LOWEST_NET_AMOUNT, param);
        param = request.getParameter(HIGHEST_NET_AMOUNT);
        if (param != null && !param.equals("")) query.put(HIGHEST_NET_AMOUNT, param);
        param = request.getParameter(PAYMENT_ID);
        if (param != null && !param.equals("")) query.put(PAYMENT_ID, param);
        param = request.getParameter(AFFIDAVIT_ID);
        if (param != null && !param.equals("")) query.put(AFFIDAVIT_ID, param);
        param = request.getParameter(CONTRACT_ID);
        if (param != null && !param.equals("")) query.put(CONTRACT_ID, param);
        param = request.getParameter(USER_ID);
        if (param != null && !param.equals("")) query.put(USER_ID, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) query.put(HANDLE, param);
        param = request.getParameter(IS_REVIEWED);
        if (param != null && !param.equals("")) query.put(IS_REVIEWED, param);
        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.findPayments(query);

        if (results == null) return new PaymentHeader[0];

        PaymentHeaderList phl = new PaymentHeaderList(results);

        return phl.getHeaderList();
    }
}

;
