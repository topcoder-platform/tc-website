/******************************************************************************\
 *
 * File:          InternalDispatchUserProfileHeader.java
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchUserProfileHeader implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    private static Logger log = Logger.getLogger(InternalDispatchUserProfileHeader.class);

    public InternalDispatchUserProfileHeader(HttpServletRequest request,
                                             HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns a UserProfileHeader object matching the affidavit_id parameter
     *
     * @Args    - none
     * @Returns - UserProfileHeader
     *
     */
    public UserProfileHeader get() throws Exception {

        long user_id = Long.parseLong(request.getParameter(USER_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserProfileHeader(user_id);

        if (results != null)
            return new UserProfileHeader(results);
        else
            return new UserProfileHeader();
    }
}

;
