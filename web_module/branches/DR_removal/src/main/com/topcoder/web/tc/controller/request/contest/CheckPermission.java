/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.contest;

import com.topcoder.web.tc.controller.request.development.Base;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.contest.ViewRegistration;

import java.io.PrintWriter;

/**
 * <p><strong>Purpose</strong>: This processor handle ajax requests to check if the current user has the permission
 * to access the ViewRegistration class</p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) Change notes:
 *   <ol>
 *     <li>Add the class CheckPermission to fix the bug: https://apps.topcoder.com/bugs/browse/BUGR-8819</li>
 *   </ol>
 * </p>
 * @author TCSASSEMBLER
 * @version 1.0
 *
 */
public class CheckPermission extends Base {
    /**
     * This method is the final processor for the request
     *
     * @throws TCWebException if any error occurs
     * @see com.topcoder.web.tc.controller.request.development.Base#developmentProcessing()
     */
    protected void developmentProcessing() throws TCWebException {
        try {
            TCResponse response = getResponse();
            PrintWriter responseWriter = response.getWriter();

            boolean isAnonymous = getSessionInfo().isAnonymous();
            if (!SecurityHelper.hasPermission(getUser(), new ClassResource(ViewRegistration.class))) {
                responseWriter.write("{\"msg\":\"ERROR\",\"isAnonymous\":" + isAnonymous + "}");
            } else {
                //Set the PERMISSION session so that the ViewRegistration can be used.
                getRequest().getSession().setAttribute(Constants.PERMISSION, "OK");
                responseWriter.write("{\"msg\":\"OK\",\"isAnonymous\":" + isAnonymous + "}");
            }
            response.flushBuffer();
            setIsNextPageInContext(false);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
