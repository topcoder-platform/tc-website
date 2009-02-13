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
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsEntry;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsEntryList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchPactsEntryList implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchPactsEntryList(HttpServletRequest request,
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
    public PactsEntry[] get() throws Exception {

/*
    public static final String IS_AFFIRMED = "is_affirmed";
    public static final String ROUND_ID = "round_id";
*/

        String param = request.getParameter(NOTE_ID);
        if (param == null) return new PactsEntry[0];

        DataInterfaceBean dib = new DataInterfaceBean();
        Map results = dib.findNoteObjects(Long.parseLong(param));

        return new PactsEntryList(results).headerList;
    }
}

;
