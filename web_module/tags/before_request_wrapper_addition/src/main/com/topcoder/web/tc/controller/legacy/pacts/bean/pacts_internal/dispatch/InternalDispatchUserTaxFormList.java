/******************************************************************************\
 *
 * File:          InternalDispatchUserTaxFormList.java
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
import com.topcoder.web.tc.controller.legacy.pacts.common.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Hashtable;
import java.util.Map;

public class InternalDispatchUserTaxFormList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchUserTaxFormList(HttpServletRequest request,
                                           HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an array of TaxFormHeaders that match the search criteria.
     * The criteria are found in the cgi variables of request.
     * Method assumes at least one search parameter exists.
     *
     * @Args    - none
     * @Returns - TaxFormHeader[]
     *
     */
    public TaxFormHeader[] get() throws Exception {
        Map query = new Hashtable();
        String param;

/*
    public static final String EARLIEST_DATE_FILED = "earliest_date_filed";
    public static final String LATEST_DATE_FILED = "latest_date_filed";
    public static final String LOWEST_WITHHOLDING_AMOUNT = "lowest_withholding_amount";
    public static final String HIGHEST_WITHHOLDING_AMOUNT = "highest_withholding_amount";
    public static final String LOWEST_WITHHOLDING_PERCENTAGE = "lowest_withholding_percentage";
    public static final String HIGHEST_WITHHOLDING_PERCENTAGE = "highest_withholding_percentage";
*/

        param = request.getParameter(STATUS_CODE);
        if (param != null && !param.equals("")) query.put(STATUS_CODE, param);
        param = request.getParameter(EARLIEST_DATE_FILED);
        if (param != null && !param.equals("")) query.put(EARLIEST_DATE_FILED, TCData.dateForm(param));
        param = request.getParameter(LATEST_DATE_FILED);
        if (param != null && !param.equals("")) query.put(LATEST_DATE_FILED, TCData.dateForm(param));
        param = request.getParameter(LOWEST_WITHHOLDING_AMOUNT);
        if (param != null && !param.equals("")) query.put(LOWEST_WITHHOLDING_AMOUNT, param);
        param = request.getParameter(HIGHEST_WITHHOLDING_AMOUNT);
        if (param != null && !param.equals("")) query.put(HIGHEST_WITHHOLDING_AMOUNT, param);
        param = request.getParameter(LOWEST_WITHHOLDING_PERCENTAGE);
        if (param != null && !param.equals("")) query.put(LOWEST_WITHHOLDING_PERCENTAGE, param);
        param = request.getParameter(HIGHEST_WITHHOLDING_PERCENTAGE);
        if (param != null && !param.equals("")) query.put(HIGHEST_WITHHOLDING_PERCENTAGE, param);
        param = request.getParameter(USER_ID);
        if (param != null && !param.equals("")) query.put(USER_ID, param);
        param = request.getParameter(TAX_FORM_ID);
        if (param != null && !param.equals("")) query.put(TAX_FORM_ID, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) query.put(HANDLE, param);
        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.findUserTaxForms(query);

        if (results == null) return new TaxFormHeader[0];

        TaxFormHeaderList tfhl = new TaxFormHeaderList(results);

        return tfhl.headerList;
    }
}

;
