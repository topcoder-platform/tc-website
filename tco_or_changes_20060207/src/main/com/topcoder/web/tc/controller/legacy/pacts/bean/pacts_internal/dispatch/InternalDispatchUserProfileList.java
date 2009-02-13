/******************************************************************************\
 *
 * File:          InternalDispatchUserProfileList.java
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

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader;
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeaderList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class InternalDispatchUserProfileList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    private static Logger log = Logger.getLogger(InternalDispatchUserProfileList.class);

    public InternalDispatchUserProfileList(HttpServletRequest request,
                                           HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns a UserProfileHeader[] object matching the affidavit_id parameter
     *
     * @return - UserProfileHeader[]
     *
     */
    public UserProfileHeader[] get() throws Exception {

        Map search = new HashMap();

/*
    public static final String FIRST_NAME = "first_name";
    public static final String MIDDLE_NAME = "middle_name";
    public static final String LAST_NAME = "last_name";
    public static final String HAS_ACTIVE_CONTRACTS = "has_active_contracts";
    public static final String HAS_PENDING_AFFIDAVITS = "has_pending_affidavits";
    public static final String HAS_TAX_FORMS_ON_FILE = "has_tax_forms_on_file";
    public static final String IS_OWED_MONEY = "is_owed_money";
*/

        String param = request.getParameter(FIRST_NAME);
        if (param != null && !param.equals("")) search.put(FIRST_NAME, param);
        param = request.getParameter(MIDDLE_NAME);
        if (param != null && !param.equals("")) search.put(MIDDLE_NAME, param);
        param = request.getParameter(HANDLE);
        if (param != null && !param.equals("")) search.put(HANDLE, param);
        param = request.getParameter(LAST_NAME);
        if (param != null && !param.equals("")) search.put(LAST_NAME, param);
        param = request.getParameter(HAS_ACTIVE_CONTRACTS);
        if (param != null && !param.equals("")) search.put(HAS_ACTIVE_CONTRACTS, param);
        param = request.getParameter(HAS_PENDING_AFFIDAVITS);
        if (param != null && !param.equals("")) search.put(HAS_PENDING_AFFIDAVITS, param);
        param = request.getParameter(HAS_TAX_FORMS_ON_FILE);
        if (param != null && !param.equals("")) search.put(HAS_TAX_FORMS_ON_FILE, param);
        param = request.getParameter(IS_OWED_MONEY);
        if (param != null && !param.equals("")) search.put(IS_OWED_MONEY, param);

        DataInterfaceBean dib = new DataInterfaceBean();

        Map results = dib.findUsers(search);
        if (results == null) return new UserProfileHeader[0];
        return (new UserProfileHeaderList(results)).getHeaderList();

    }
}

;
