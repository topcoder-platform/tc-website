package com.topcoder.web.common.security;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
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
    private static final String KEY_PERSISTOR    = "persistor-object";
    private static final String KEY_PREVPAGE     = "last-accessed-page";
    private static final String KEY_AUTH_TOKEN   = "auth-token";
    
	private Hashtable items = null;

    private SessionPersistor() {
        items = new Hashtable();
    }	
    /**
     * Creates new persistor and stores it in given session.
     * 
     * @param session parent session to hold this persistor.
     */
    public static SessionPersistor getInstance(HttpServletRequest request) {
        HttpSession session = request.getSession(true); // create if absent
        SessionPersistor store = (SessionPersistor)session.getAttribute(KEY_PERSISTOR);
        if( store == null ) {
            synchronized(session) {
                store = (SessionPersistor)session.getAttribute(KEY_PERSISTOR);
                if( store == null ) {
                    store = new SessionPersistor();
                }
            }
        }
        return store;
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
    
    /**
     * 
     * @param page
     */
    public void setLastPage(String page) {
        items.put(KEY_PREVPAGE, page);
    }
    
    /**
     * 
     * @return String
     */
    public String getLastPage() {
        return (String)items.get(KEY_PREVPAGE);
    }
    
//    /**
//     * 
//     * @param authToken
//     */
//    public void setAuthToken(BasicAuthentication authToken) {
//        items.put(KEY_AUTH_TOKEN, authToken);
//    }
//    
//    /**
//     * 
//     * @return BasicAuthentication
//     */
//    public BasicAuthentication getAuthToken() {
//        return (BasicAuthentication)items.get(KEY_AUTH_TOKEN);
//    }
}
