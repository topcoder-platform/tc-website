package com.topcoder.web.common.security;

import javax.servlet.http.HttpSession;
import com.topcoder.shared.security.Persistor;

/**
 * Implements a persistor using an HttpSession object.
 * @author  George
 */
public class SessionPersistor implements Persistor {
    
    HttpSession session;
    
    private SessionPersistor() {}
    
    /** Creates a new instance of SessionPersistor */
    public SessionPersistor(HttpSession session) {
        this.session = session;
    }
    
    /** Gets an object from the persistor.
     * @param key The key for the desired object.
     * @return The Object associated with the given key, or <code>null</code> if none was found.
     */
    public Object getObject(String key) {
        return session.getAttribute(key);
    }
    
    /** Removes an object from the persistor.
     * @param key The key for the object that should be removed.
     */
    public void removeObject(String key) {
        session.removeAttribute(key);
    }
    
    /** Stores an object within the persistor.
     * @param key The unique key to which the object should be assigned.
     * @param object The Object to be persisted.  */
    public void setObject(String key, Object object) {
        session.setAttribute(key,object);
    }
    
}
