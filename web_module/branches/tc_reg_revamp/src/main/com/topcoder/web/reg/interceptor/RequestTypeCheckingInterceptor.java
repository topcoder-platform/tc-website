/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.topcoder.web.reg.action.BaseAction;
import com.topcoder.web.reg.action.GetAction;
import com.topcoder.web.reg.action.PostAction;

/**
 * This interceptor is used to check whether the request type is correct for corresponding action.
 *
 * @author live_world
 * @version 1.0
 */
public class RequestTypeCheckingInterceptor extends AbstractInterceptor {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 3238737055702828824L;

    /**
     * Default no-arg constructor.
     */
    public RequestTypeCheckingInterceptor() {
        // Does nothing.
    }

    /**
     * Intercept the request to check whether the request type is correct.
     *
     * @param actionInvocation the action invocation containing information about the current action
     * @return the execution result of the underlying action.
     * @throws Exception if any underlying error occurs
     */
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        if (actionInvocation.getAction() instanceof BaseAction) {
            BaseAction baseAction = (BaseAction) actionInvocation.getAction();
            if (actionInvocation.getAction() instanceof GetAction) {
                if (!"GET".equalsIgnoreCase(ServletActionContext.getRequest().getMethod())) {
                    baseAction.addActionError("Only 'GET' request is allowed.");
                    return "error";
                }
                return actionInvocation.invoke();
            }
            if (actionInvocation.getAction() instanceof PostAction) {
                if (!"POST".equalsIgnoreCase(ServletActionContext.getRequest().getMethod())) {
                    baseAction.addActionError("Only 'POST' request is allowed.");
                    return "error";
                }
            }
        }
        return actionInvocation.invoke();
    }

}
