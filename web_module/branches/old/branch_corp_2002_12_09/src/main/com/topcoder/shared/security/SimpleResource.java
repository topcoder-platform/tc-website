package com.topcoder.shared.security;

/**
 * interface for resources, they could be web pages, web applications etc.
 * anything that one might require authentication for access to.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class SimpleResource implements Resource {
    private String rcName;
    
    /**
     * 
     * @param name name of resource
     */
    public SimpleResource(String name) {
        rcName = name;
    }
    
    /**
     * Return name of the restricted rights resource 
     * @return String
     */
    public String getName() {
        return rcName;
    }
    
    /**
     * 
     * @see java.lang.Object#toString()
     */
    public String toString() {
        return "resource *** " + rcName + "***";
    }
}
