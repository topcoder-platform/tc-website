package com.topcoder.web.common.security;

import java.util.EmptyStackException;
import java.util.Hashtable;
import java.util.Stack;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.logging.Logger;

/**
 * implementation of Persitor that will use an HttpSession object for
 * persistance
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class SessionPersistor implements Persistor {
    private final static Logger log = Logger.getLogger(SessionPersistor.class);
    private static final String KEY_PERSISTOR    = "persistor-object";
    private static final String KEY_PREVPAGE     = "last-accessed-page";
//    private static final String KEY_AUTH_TOKEN   = "auth-token";
    
	private Hashtable items = null;
    private String appContextPath = null;

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
                    session.setAttribute(KEY_PERSISTOR, store);
                    store.appContextPath = request.getContextPath();
                    store.items.put(KEY_PREVPAGE, new Stack());
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
    public void pushLastPage(String page) {
        Stack pages = (Stack)items.get(KEY_PREVPAGE);
        String top = null;
        try {
            top = (String)pages.peek();
        }
        catch(EmptyStackException ee) {}
        if( !page.equals(top) ) {
            pages.push(page);
            log.debug("last page set as "+page);
        }
    }
    
    /**
     * 
     * @return String
     */
    public String popLastPage() {
        try {
            Stack pages = (Stack)items.get(KEY_PREVPAGE);
            return (String)pages.pop();
        }
        catch(EmptyStackException e) {
            return null;
        }
    }
}
