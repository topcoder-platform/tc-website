/******************************************************************************\
 *
 * File:          InternalDispatchUserProfile.java
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
import com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class InternalDispatchUserProfile implements PactsConstants {
    HttpServletRequest request;
    HttpServletResponse response;

    private static Logger log = Logger.getLogger(InternalDispatchUserProfile.class);

    public InternalDispatchUserProfile(HttpServletRequest request,
                                       HttpServletResponse response) {

        this.request = request;
        this.response = response;
    }

    /**
     *
     * This method returns a UserProfile object matching the user_id parameter
     *
     * @Args    - none
     * @Returns - UserProfile
     *
     */
    public UserProfile get() throws Exception {

        long user_id = Long.parseLong(request.getParameter(USER_ID));

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserProfile(user_id);

        if (results != null)
            return new UserProfile(results);
        else
            return new UserProfile();
    }

    public UserProfile get(long user_id) throws Exception {

        DataInterfaceBean bean = new DataInterfaceBean();

        Map results = bean.getUserProfile(user_id);

        if (results != null)
            return new UserProfile(results);
        else
            return new UserProfile();
    }

}

;
