package com.topcoder.web.common.security;

import javax.servlet.http.HttpSession;

import com.topcoder.shared.security.Persistor;

/**
 * implementation of Persitor that will use an HttpSession object for
 * persistance
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class SessionPersistor implements Persistor {
    /**
     * 
     * @param session
     */
    SessionPersistor(HttpSession session) {
    }
    
    /**
     * @see com.topcoder.shared.security.Persistor#getObject(java.lang.String)
     */
    public Object getObject(String key) {
        return null;
    }

    /**
     * @see com.topcoder.shared.security.Persistor#removeObject(java.lang.String)
     */
    public void removeObject(String key) {
    }

    /**
     * @see com.topcoder.shared.security.Persistor#setObject(java.lang.String, java.lang.Object)
     */
    public void setObject(String key, Object value) {
    }
}
