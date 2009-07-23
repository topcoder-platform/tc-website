/******************************************************************************\
 *
 * File:          InternalDispatchUserTaxForm.java
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
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;
import com.topcoder.web.tc.controller.legacy.pacts.common.TaxForm;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchUserTaxForm implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchUserTaxForm(HttpServletRequest request,
                                       HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an TaxForm object matching the tax_form_id parameter
     *
     * @Args    - none
     * @Returns - TaxForm
     *
     */
    public TaxForm get() throws Exception {

        long tax_form_id = Long.parseLong(request.getParameter(TAX_FORM_ID));
        long user_id = Long.parseLong(request.getParameter(USER_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserTaxForm(user_id, tax_form_id);

        return new TaxForm(results);
    }

    public TaxForm get(long tax_form_id, long user_id) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        //System.out.println("u=" + user_id + " t=" + tax_form_id);

        Map results = bean.getUserTaxForm(user_id, tax_form_id);

        return new TaxForm(results);
    }


}

;
