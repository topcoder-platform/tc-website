package com.topcoder.web.test;

import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;

/**
 * Helper class implementing HttpSession
 * @author Mishagam
 * @date 03-Jan-2003
 */

public class HttpSessionHelper implements HttpSession {
    private Map attributes = new HashMap();
    public String myId = null;
    
    public Object getAttribute(String name) { // Returns the object bound with the specified name in this session, or null if no object is bound under the name.
        return attributes.get(name);        
    }
    
    public Enumeration getAttributeNames() { // Returns an Enumeration of String objects containing the names of all the objects bound to this session.
        Vector v = new Vector(attributes.keySet());
        return v.elements();
    }
    public long getCreationTime() { // Returns the time when this session was created, measured in milliseconds since midnight January 1, 1970 GMT.
        return 0;
    }
    public String getId() { // Returns a string containing the unique identifier assigned to this session.
        return myId;
    }
    public long getLastAccessedTime() { // Returns the last time the client sent a request associated with this session, as the number of milliseconds since midnight January 1, 1970 GMT, and marked by the time the container recieved the request.
        return 0;
    }
    public int getMaxInactiveInterval() { // Returns the maximum time interval, in seconds, that the servlet container will keep this session open between client accesses.
        return 0;
    }
    public ServletContext getServletContext() { // Returns the ServletContext to which this session belongs.
        return null;
    }
    public HttpSessionContext getSessionContext() { // Deprecated. As of Version 2.1, this method is deprecated and has no replacement. It will be removed in a future version of the Java Servlet API.
        return null;
    }
    public Object getValue(String name) { // Deprecated. As of Version 2.2, this method is replaced by getAttribute(java.lang.String).
        return null;
    }
    public String[] getValueNames() { // Deprecated. As of Version 2.2, this method is replaced by getAttributeNames()
    	return null;
    }
    public void invalidate() { // Invalidates this session then unbinds any objects bound to it.        
    }
    public boolean isNew() { // Returns true if the client does not yet know about the session or if the client chooses not to join the session.
        return true;
    }
    public void logout() { // Logs the client out of the web server and invalidates all sessions associated with this client.        
    }
    public void putValue(String name, Object value) { // Deprecated. As of Version 2.2, this method is replaced by setAttribute(java.lang.String, java.lang.Object)
    }
    public void removeAttribute(String name) { // Removes the object bound with the specified name from this session.
        attributes.remove(name);
    }
    public void removeValue(String name) { // Deprecated. As of Version 2.2, this method is replaced by removeAttribute(java.lang.String)
    }
    public void setAttribute(String name, Object value) { // Binds an object to this session, using the name specified.
        attributes.put(name, value);
    }
    public void setMaxInactiveInterval(int interval) { // Specifies the time, in seconds, between client requests before the servlet container will invalidate this session.
    }
}
  