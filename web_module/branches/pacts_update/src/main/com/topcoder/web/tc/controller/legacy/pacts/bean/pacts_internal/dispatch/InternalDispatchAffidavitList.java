/******************************************************************************\
 *
 * File:          InternalDispatchAffidavitList.java
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
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.AffidavitHeaderList;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Hashtable;
import java.util.Map;

public class InternalDispatchAffidavitList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchAffidavitList(HttpServletRequest request,
                                         HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an array of AffidavitHeaders that match the search criteria.
     * The criteria are found in the cgi variables of request.
     * Method assumes at least one search parameter exists.
     *
     * @Args    - none
     * @Returns - AffidavitHeader[]
     *
     */
    public AffidavitHeader[] get() throws Exception {
        Map query = new Hashtable();
        String param;

/*
    public static final String IS_AFFIRMED = "is_affirmed";
    public static final String ROUND_ID = "round_id";
*/

        param = request.getParameter(STATUS_CODE);
        if (param != null && !param.equals("")) query.put(STATUS_CODE, param);
        param = request.getParameter(TYPE_CODE);
        if (param != null && !param.equals("")) query.put(TYPE_CODE, param);
        param = request.getParameter(EARLIEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(EARLIEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(LATEST_CREATION_DATE);
        if (param != null && !param.equals("")) query.put(LATEST_CREATION_DATE, TCData.dateForm(param));
        param = request.getParameter(PAYMENT_ID);
        if (param != null && !param.equals("")) query.put(PAYMENT_ID, param);
        param = request.getParameter(AFFIDAVIT_ID);
        if (param != null && !param.equals("")) query.put(AFFIDAVIT_ID, param);
        param = request.getParameter(IS_AFFIRMED);
        if (param != null && !param.equals("")) query.put(IS_AFFIRMED, param);
        param = request.getParameter(IS_NOTARIZED);
        if (param != null && !param.equals("")) query.put(IS_NOTARIZED, param);
        param = request.getParameter(ROUND_ID);
        if (param != null && !param.equals("")) query.put(ROUND_ID, param);
        param = request.getParameter(USER_ID);
        if (param != null && !param.equals("")) query.put(USER_ID, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) query.put(HANDLE, param);
        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.findAffidavits(query);

        if (results == null) return new AffidavitHeader[0];

        AffidavitHeaderList ahl = new AffidavitHeaderList(results);

        return ahl.headerList;
    }
}

;
