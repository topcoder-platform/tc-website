package com.topcoder.web.common.security;

import java.util.Hashtable;
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
	private HttpSession parent = null;
	private Hashtable items = null;
	
    /**
     * Creates new persistor and stores it in given session.
     * 
     * @param session parent session to hold this persistor.
     */
    SessionPersistor(HttpSession session) {
    	parent = session;
    	items = new Hashtable();
    }
    
    /**
     * 
     * @see com.topcoder.shared.security.Persistor#getObject(java.lang.String)
     */
    public Object getObject(String key) {
        return items.get(key);
    }

    /**
     * @see com.topcoder.shared.security.Persistor#removeObject(java.lang.String)
     */
    public void removeObject(String key) {
    	items.remove(key);
    }

    /**
     * @see com.topcoder.shared.security.Persistor#setObject(java.lang.String, java.lang.Object)
     */
    public void setObject(String key, Object value) {
    	items.put(key, value);
    }
}
