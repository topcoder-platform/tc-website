package com.topcoder.web.common.security;

import com.topcoder.shared.security.*;

/**
 * implementation of Persistor that will use an HttpSession object for persistence 
 * we'll be using this for authorization.
 */
public class SessionPersistor implements Persistor {

    HttpSession session;

    /** create a new instance bound to the given session */
    SessionPersistor(HttpSession session) {
        this.session = session;
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
