package com.topcoder.shared.security;

/**
 * Interface for classes that can persist objects, such as a cache, database, or
 * HttpSession. Since it is usually a shared resource, keys should be unique.
 * @author  George
 */
public interface Persistor {
    
    /**
     * Gets an object from the persistor.
     * @param key The key for the desired object.
     * @return The Object associated with the given key, or <code>null</code> if none was found. 
     */    
    public Object getObject(String key);
    
    /**
     * Stores an object within the persistor.
     * @param key The unique key to which the object should be assigned.
     * @param object The Object to be persisted. */    
    public void setObject(String key, Object object);
    
    /**
     * Removes an object from the persistor.
     * @param key The key for the object that should be removed.
     */    
    public void removeObject(String key);
    
}
