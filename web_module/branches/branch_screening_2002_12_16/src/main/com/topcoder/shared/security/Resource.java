package com.topcoder.shared.security;

/**
 * Interface for resources, they could be web pages, web applications
 * etc.  anything that one might require authentication for access to.
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Jan 7, 2003 11:51:28 PM
 */

public interface Resource {
    public String getName();
}
