package com.topcoder.web.test;

import com.topcoder.shared.security.Persistor;
import java.util.*;

/**
 * @author Misha
 *
 * implements Persistor interface for testing 
 * basicAuthentication and so on
 * Created - 01/04/2003
 */
public class PersistorHelper implements Persistor{
	
	private Map objects = new HashMap();
    
    /**
     * Gets an object from the persistor.
     * @param key The key for the desired object.
     * @return The Object associated with the given key, or <code>null</code> if none was found. 
     */    
    public Object getObject(String key) {
    	return objects.get(key);
    }
    
    /**
     * Stores an object within the persistor.
     * @param key The unique key to which the object should be assigned.
     * @param object The Object to be persisted. */    
    public void setObject(String key, Object object) {
    	objects.put(key, object);
    }
    
    /**
     * Removes an object from the persistor.
     * @param key The key for the object that should be removed.
     */    
    public void removeObject(String key) {
    	objects.remove(key);
    }
}
