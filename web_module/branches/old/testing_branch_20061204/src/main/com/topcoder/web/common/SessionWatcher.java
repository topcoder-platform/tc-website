package com.topcoder.web.common;

import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 16, 2006
 */
public class SessionWatcher implements HttpSessionListener {
    private static final Logger log = Logger.getLogger(SessionWatcher.class);

    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        if (log.isDebugEnabled()) {
            log.debug("created a session: " + httpSessionEvent.getSession().getId() + " " +
                    httpSessionEvent.getSession().getServletContext().getServletContextName());
        }
    }

    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        if (log.isDebugEnabled()) {
            log.debug("destroyed a session: " + httpSessionEvent.getSession().getId() + " " +
                    httpSessionEvent.getSession().getServletContext().getServletContextName());

        }
    }
}
