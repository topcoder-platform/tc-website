package com.topcoder.shared.security;

/**
 * interface for resources, they could be web pages, web applications
 * etc.  anything that one might require authentication for access to.
 *
 * @author Greg Paul
 */
public interface Resource {

    public String getName();
}
