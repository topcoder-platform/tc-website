package com.topcoder.shared.security;

/**
 * interface for resources, they could be web pages, web applications
 * etc.  anything that one might require authentication for access to.
 *
 * @author Ambrose Feinstein
 */
public class SimpleResource implements Resource {

    private String name;

    public SimpleResource(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
