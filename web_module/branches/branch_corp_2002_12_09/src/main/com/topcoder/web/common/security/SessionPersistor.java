package com.topcoder.web.common.security;

import java.util.EmptyStackException;
import java.util.Stack;

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
    private static final String KEY_PREVPAGE     = "last-accessed-page";
    
    private HttpSession store = null;
    
    public SessionPersistor(HttpSession session) {
        store = session;
        Stack pages = (Stack)store.getAttribute(KEY_PREVPAGE);
        if( pages == null ) {
            store.setAttribute(KEY_PREVPAGE, new Stack());
        }
    }   
    
    /**
     * 
     * @see com.topcoder.shared.security.Persistor#getObject(java.lang.String)
     */
    public Object getObject(String key) {
        return store.getAttribute(key);
    }

    /**
     * @see com.topcoder.shared.security.Persistor#removeObject(java.lang.String)
     */
    public void removeObject(String key) {
        store.removeAttribute(key);
    }

    /**
     * @see com.topcoder.shared.security.Persistor#setObject(java.lang.String, java.lang.Object)
     */
    public void setObject(String key, Object value) {
        store.setAttribute(key, value);
    }
    
    /**
     * 
     * @param page
     */
    public void pushLastPage(String page) {
        Stack pages = (Stack)store.getAttribute(KEY_PREVPAGE);
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
            Stack pages = (Stack)store.getAttribute(KEY_PREVPAGE);
            return (String)pages.pop();
        }
        catch(EmptyStackException e) {
            return null;
        }
    }
}
