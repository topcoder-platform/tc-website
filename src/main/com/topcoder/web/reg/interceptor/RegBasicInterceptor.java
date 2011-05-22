/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.topcoder.security.TCSubject;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HttpObjectFactory;
import com.topcoder.web.common.RequestTracker;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.error.RequestRateExceededException;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;
import com.topcoder.web.common.security.WebAuthentication;
import com.topcoder.web.common.throttle.Throttle;
import com.topcoder.web.reg.RegHelper;
import com.topcoder.web.reg.SessionData;
import com.topcoder.web.reg.action.BaseAction;

/**
 * <p>
 * This is a basic interceptor for registration module. It will log request dispatches, request results and errors
 * occur in action invocation. Also some debug information is also logged if logger is enabled on debug mode.It
 * also does throttle checking is this feature is enabled.
 * </p>
 * 
 * @author live_world
 * @version 1.0
 */
public class RegBasicInterceptor extends AbstractInterceptor {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = 6782935167956498214L;

    /**
     * Logger instance.
     */
    private static final Logger LOGGER = Logger.getLogger(RegBasicInterceptor.class);

    /**
     * Throttle instance for checking request throttle.
     */
    private Throttle throttle;

    /**
     * Indicates whether throttle is enabled or not.
     */
    private boolean throttleEnabled;

    /**
     * Default no-arg constructor.
     */
    public RegBasicInterceptor() {
        // Does nothing.
    }

    /**
     * Intercepts the request.
     * 
     * @param actionInvocation the action invocation containing information about the current action
     * @return the execution result of the underlying action.
     * @throws Exception if any underlying error occurs
     */
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        TCRequest tcRequest = HttpObjectFactory.createRequest(request);
        TCResponse tcResponse = HttpObjectFactory.createResponse(ServletActionContext.getResponse());
        request.setCharacterEncoding("utf-8");

        // create WebAuthentication
        WebAuthentication authentication =
            new BasicAuthentication(new SessionPersistor(tcRequest.getSession()), tcRequest, tcResponse,
                DBMS.JTS_OLTP_DATASOURCE_NAME);

        // check throttle
        if (throttleEnabled) {
            if (throttle.throttle(tcRequest.getSession().getId())) {
                throw new RequestRateExceededException(tcRequest.getSession().getId(), authentication.getActiveUser()
                    .getUserName());
            }
        }

        if (!authentication.getActiveUser().isAnonymous()
            && !tcRequest.getRequestURL().toString().toLowerCase().startsWith("https")) {
            RegHelper.logDebug(LOGGER, "using an uncached response");
            tcResponse = HttpObjectFactory.createUnCachedResponse(tcResponse);
        }
        // track the request
        RequestTracker.trackRequest(authentication.getActiveUser(), tcRequest);

        RegHelper.logDebug(LOGGER, "content type: " + request.getContentType());
        RegHelper.logDebug(LOGGER, "uri: " + request.getRequestURL().toString());

        TCSubject user = SecurityHelper.getUserSubject(authentication.getActiveUser().getId());
        SessionInfo sessionInfo = new SessionInfo(tcRequest, authentication, user.getPrincipals());
        // logging request info
        StringBuilder loginInfo = new StringBuilder();
        loginInfo.append("[* ");
        loginInfo.append(sessionInfo.getHandle());
        loginInfo.append(" * ");
        loginInfo.append(request.getRemoteAddr());
        loginInfo.append(" * ");
        loginInfo.append(request.getMethod());
        loginInfo.append(" ");
        loginInfo.append(sessionInfo.getRequestString());
        loginInfo.append(" *]");
        RegHelper.logInfo(LOGGER, loginInfo.toString());

        // setup session data
        SessionData sessionData = new SessionData(request.getSession());
        if (actionInvocation.getAction() instanceof BaseAction) {
            // Must be a subclass of BaseAction
            BaseAction action = (BaseAction) actionInvocation.getAction();
            action.setAuthentication(authentication);
            action.setSessionData(sessionData);
        }

        String actionName = actionInvocation.getAction().getClass().getName();
        try {
            // log entrance
            RegHelper.logDebug(LOGGER, "Action entrance: " + actionName);
            String result = actionInvocation.invoke();
            // log exit
            RegHelper.logDebug(LOGGER, "Action exit: " + actionName + ", result: " + result);
            return result;
        } catch (Throwable e) {
            LOGGER.error("[Error in action {" + actionName + "}: Details {" + e.getMessage() + "}]", e);
            throw new Exception("Error in action " + actionName, e);
        }
    }

    /**
     * The setter for the throttle instance variable.
     * 
     * @param throttle the throttle to set
     */
    public void setThrottle(Throttle throttle) {
        this.throttle = throttle;
    }

    /**
     * The setter for the throttleEnabled instance variable.
     * 
     * @param throttleEnabled the throttleEnabled to set
     */
    public void setThrottleEnabled(boolean throttleEnabled) {
        this.throttleEnabled = throttleEnabled;
    }

}
