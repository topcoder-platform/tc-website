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
     * Returns object matching the key given.
     *  
     * @param key for requested object
     * @return Object matching given key or null if there are not any matches.
     */
    Object getObject(String key);
    
    /**
     * Stores object to be accessed later via key specified.
     * 
     * @param value to be stored
     * @param key associated with value
     */
    void setObject(String key, Object value);
    
    /**
     * Removes value associated with given key from persistor permanently.
     * 
     * @param key of stored value to be removed 
     */
    void removeObject(String key);
}
