/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.topcoder.shared.security.User;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.reg.action.BaseAction;
import com.topcoder.web.reg.action.FirstStepAction;

/**
 * It is used to check whether the user is authenticated.It is also used to check whether the user should go to
 * first step page.
 * 
 * Change Log:
 * Version 1.1: Skip the first step page after login.
 * 
 * @author live_world, TCSASSEMBLIER
 * @version 1.1
 */
public class AuthenticationInterceptor extends AbstractInterceptor {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 6575893739577756331L;

    /**
     * Default no-arg constructor.
     */
    public AuthenticationInterceptor() {
        // Does nothing.
    }

    /**
     * Intercept the request to check whether the user is authenticated or user should go to first step page.
     * 
     * @param actionInvocation the action invocation containing information about the current action
     * @return the execution result of the underlying action.
     * @throws Exception if any underlying error occurs
     */
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        if (actionInvocation.getAction() instanceof BaseAction) {
            User user = ((BaseAction) actionInvocation.getAction()).getCurrentUser();
            if (user == null) {
                return "login";
            }
        }
        return actionInvocation.invoke();
    }

}
