/******************************************************************************\
 *
 * File:          InternalDispatchAffidavit.java
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

import com.topcoder.web.tc.controller.legacy.pacts.bean.DataInterfaceBean;
import com.topcoder.web.tc.controller.legacy.pacts.common.Affidavit;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchAffidavit implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchAffidavit(HttpServletRequest request,
                                     HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an Affidavit object matching the affidavit_id parameter
     *
     * @Args    - none
     * @Returns - Affidavit
     *
     */
    public Affidavit get() throws Exception {

        long affidavit_id = Long.parseLong(request.getParameter(AFFIDAVIT_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getAffidavit(affidavit_id);

        return new Affidavit(results);
    }

    /**
     *
     * This method returns an Affidavit object matching the affidavit_id parameter
     *
     * @Args    - affidavit_id
     * @Returns - Affidavit
     *
     */
    public Affidavit get(long affidavit_id) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getAffidavit(affidavit_id);

        return new Affidavit(results);
    }

}

;
