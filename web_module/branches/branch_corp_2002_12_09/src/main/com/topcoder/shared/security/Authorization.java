package com.topcoder.shared.security;

/**
 * classes that implement Authorization will determine if a particular user has
 * access to a particular resource this could range from simple if "logged in
 * then yes otherwise no" systems to full security systems with permissions,
 * roles groups etc.
 * 
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public interface Authorization {
    
    /**
     * 
     * @return boolean
     */
    boolean hasPermission(Resource r);
}
