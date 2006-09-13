/******************************************************************************\
 *
 * File:          InternalDispatchContract.java
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
import com.topcoder.web.tc.controller.legacy.pacts.common.Contract;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchContract implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    public InternalDispatchContract(HttpServletRequest request,
                                    HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns an Affidavit object matching the contract_id parameter
     *
     * @Args    - none
     * @Returns - Contract
     *
     */
    public Contract get() throws Exception {

        long contract_id = Long.parseLong(request.getParameter(CONTRACT_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getContract(contract_id);

        return new Contract(results);
    }

    /**
     *
     * This method returns an Affidavit object matching the contract_id parameter
     *
     * @Args    - contract_id
     * @Returns - Contract
     *
     */
    public Contract get(long contract_id) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getContract(contract_id);

        return new Contract(results);
    }

}

;
