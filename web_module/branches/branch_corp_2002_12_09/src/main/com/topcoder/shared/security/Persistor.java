package com.topcoder.shared.security;

/**
 * inteface for classes that can persist objects.  implementing classes could
 * use a cache, an HttpSession, a database etc.   it should be assumed that it
 * is a shared resource, so keys should be unique.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface Persistor {
    
    /**
     * 
     * @param key
     * @return Object
     */
    Object getObject(String key);
    
    /**
     * 
     * @param key
     * @param value
     */
    void setObject(String key, Object value);
    
    /**
     * 
     * @param key
     */
    void removeObject(String key);
}
