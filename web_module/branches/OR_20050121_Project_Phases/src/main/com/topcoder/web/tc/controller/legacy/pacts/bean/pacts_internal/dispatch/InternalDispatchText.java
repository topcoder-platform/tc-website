/******************************************************************************\
 *
 * File:          InternalDispatchText.java
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
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TCData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchText implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    private static Logger log = Logger.getLogger(InternalDispatchText.class);

    public InternalDispatchText(HttpServletRequest request,
                                HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns a String matching the object_id and object_type parameter
     *
     * @Args    - none
     * @Returns - String
     *
     */
    public String get() throws Exception {
        long object_id = Long.parseLong(request.getParameter("object_id"));
        int object_type = Integer.parseInt(request.getParameter("object_type"));

        return get(object_id, object_type);
    }

    public String get(long object_id, int object_type) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getText(object_id, object_type);

        if (results == null) return "no results";
        ResultSetContainer rsc = (ResultSetContainer) results.get(TEXT);
        if (rsc == null) return "no text";
        if (rsc.getRowCount() < 1) return "rsc empty";
        return TCData.getTCString(rsc.getRow(0), "text", "default text", true);
    }
}

;
