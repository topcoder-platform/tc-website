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
     * Checks if there is permissionn for given resource.
     * @param rc resource to be checked
     * 
     * @return boolean true there is permission for this resource, false
     * otherwise
     * @throws Exception when some tech problems have occured (i.e. security
     * server is not answering, network error etc), this means that there are
     * some tech problems and required information cant be retrieved at the
     * moment.
     * 
     */
    boolean hasPermission(Resource rc) throws Exception;
}
