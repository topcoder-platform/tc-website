package com.topcoder.web.common.security;

import com.sun.java.util.collections.Hashtable;
import com.topcoder.shared.security.Resource;

/**
 * Returns permissions set assoshiated with given authorization token 
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class PermissionsSet {
     Hashtable set = null;

    public PermissionsSet() {
        set = new Hashtable();
    }
     
    /**
     * 
     * @param rc
     * @return boolean
     */
    public boolean hasPermission(Resource rc) {
        return null != set.get(rc.getName());
    }
    
    /**
     * 
     * @param rc
     */   
    public void addPermission(Resource rc) {
         set.put(rc.getName(), rc);
    }

    /**
     * 
     * @param rc
     */
    public void dropPermission(Resource rc) {
         set.remove(rc.getName());
    }
    
    /**
     * implemented as stub for now
     * 
     * @param userID
     */
    void populateFromDB(long userID) {
        
    }
}
