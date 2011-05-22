/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.reg.RegHelper;

/**
 * <p>
 * Provides hibernate transaction for one time request conversation.
 * </p>
 * <p>
 * Notes:for now,no multi-request conversion should be used.so no long hibernate interceptor is provided.But it is
 * not hard to add in the feature.
 * </p>
 *
 * @author live_world
 * @version 1.0
 */
public class ShortHibernateInterceptor extends AbstractInterceptor {
    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -1593058439709644117L;
    /**
     * Logger instance.
     */
    private static final Logger LOGGER = Logger.getLogger(ShortHibernateInterceptor.class);

    /**
     * Default no-arg constructor.
     */
    public ShortHibernateInterceptor() {
        // Does nothing.
    }

    /**
     * Intercepts the action which needs a short hibernate transaction.
     *
     * @param actionInvocation the action invocation containing information about the current action
     * @return the execution result of the underlying action.
     * @throws Exception if any underlying error occurs
     */
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        startHibernateSession(LOGGER);
        try {
            try {
                return actionInvocation.invoke();
            } catch (Exception e) {
                HibernateUtils.rollback();
                throw e;
            }
        } finally {
            endCurrentHibernateSession(LOGGER);
        }
    }

    /**
     * Ends current hibernate session.
     *
     * @param logger the Logger instance
     */
    private static void endCurrentHibernateSession(Logger logger) {
        RegHelper.logDebug(logger, "hibernate session end");
        HibernateUtils.getSession().flush();
        HibernateUtils.commit();
        HibernateUtils.closeSession();
    }

    /**
     * Starts hibernate session.
     *
     * @param logger the Logger instance
     */
    private static void startHibernateSession(Logger logger) {
        RegHelper.logDebug(logger, "hibernate session start");
        HibernateUtils.begin();
    }
}
