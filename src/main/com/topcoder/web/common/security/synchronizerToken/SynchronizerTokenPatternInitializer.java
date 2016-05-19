/*
 * Copyright (C) 2016 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.security.synchronizerToken;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig.SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES;
import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig.SESSION_ATTR_OPERATION_TYPE_TOKENS;
import static com.topcoder.web.common.security.synchronizerToken.SynchronizerTokenPatternConfig.CONTEXT_ATTR_PATTERN_IMPL;

/**
 * <p>An HTTP session and servlet context listener which is responsible to setup several artifacts </p>
 *
 * @author isv
 */
public class SynchronizerTokenPatternInitializer implements HttpSessionListener, ServletContextListener {

    /**
     * <p>Constructs new <code>SynchronizerTokenPatternInitializer</code> instance. This implementation does
     * nothing.</p>
     */
    public SynchronizerTokenPatternInitializer() {
    }

    /**
     * <p>Handles the event of servlet context creation. Binds the default implementation of <code>Synchronizer Token
     * Pattern</code> to specified servlet context for further use by all involved parties.</p>
     *  
     * @param servletContextEvent a <code>ServletContextEvent</code> specifying the servlet context. 
     */
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        servletContext.setAttribute(CONTEXT_ATTR_PATTERN_IMPL, new SynchronizerTokenPatternImplementation());
    }

    /**
     * <p>Handles the event of servlet context destroying. This implementation removes the servlet context attributes
     * set by this listener when servlet context was created.</p>
     *
     * @param servletContextEvent a <code>ServletContextEvent</code> specifying the servlet context.
     */
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ServletContext servletContext = servletContextEvent.getServletContext();
        servletContext.removeAttribute(CONTEXT_ATTR_PATTERN_IMPL);
    }

    /**
     * <p>Handles the event of session creation. This implementation generates the synchronizer tokens and names of
     * respective request parameters to carry those tokens for each of the "protected" operation types and binds them to
     * specified session for further use in context of specified session.</p>
     *
     * @param httpSessionEvent an <code>HttpSessionEvent</code> specifying the session context.
     */
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    }

    /**
     * <p>Handles the event of session destroying. This implementation removes the session attributes set by this
     * listener when session was created.</p>
     * 
     * @param httpSessionEvent an <code>HttpSessionEvent</code> specifying the session context. 
     */
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        HttpSession session = httpSessionEvent.getSession();
        session.removeAttribute(SESSION_ATTR_OPERATION_TYPE_PARAM_NAMES);
        session.removeAttribute(SESSION_ATTR_OPERATION_TYPE_TOKENS);
    }
}
