package com.topcoder.web.common.security;

import com.topcoder.shared.security.Persistor;
import com.topcoder.shared.util.logging.Logger;

import javax.servlet.http.HttpSession;
import java.util.EmptyStackException;
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
        Stack pages = (Stack)session.getAttribute(KEY_PREVPAGE);
        if( pages == null ) {
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

    /**
     * @deprecated
     * @param page
     */
    public void pushLastPage(String page) {
        Stack pages = (Stack) session.getAttribute(KEY_PREVPAGE);
        String top = null;
        try {
            top = (String) pages.peek();
        } catch (EmptyStackException ee) {
        }
        if (!page.equals(top)) {
            pages.push(page);
            log.debug("last page set as " + page);
        }
    }

    /**
     *
     * @deprecated
     * @return String
     */
    public String popLastPage() {
        try {
            Stack pages = (Stack) session.getAttribute(KEY_PREVPAGE);
            return (String) pages.pop();
        } catch (EmptyStackException e) {
            return null;
        }
    }


}


