package com.topcoder.web.common.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpSession;
import java.util.Stack;

/**
 * implementation of Persistor that will use an HttpSession object for persistence
 * we'll be using this for authorization.
 */
public class SessionPersistor implements Persistor {
    private final static Logger log = Logger.getLogger(SessionPersistor.class);
    private static final String KEY_PREVPAGE = "last-accessed-page";
    private HttpSession session;

    /** create a new instance bound to the given session */
    public SessionPersistor(HttpSession session) {
        this.session = session;
        Stack pages = (Stack) session.getAttribute(KEY_PREVPAGE);
        if (pages == null) {
            session.setAttribute(KEY_PREVPAGE, new Stack());
        }
    }

    public Object getObject(String key) {
        return session.getAttribute(key);
    }

    public void setObject(String key, Object value) {
        session.setAttribute(key, value);
    }

    public void removeObject(String key) {
        session.removeAttribute(key);
    }

}


