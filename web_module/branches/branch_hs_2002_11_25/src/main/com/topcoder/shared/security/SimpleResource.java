package com.topcoder.shared.security;

/**
 * Minimal implementation of Resource.
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
