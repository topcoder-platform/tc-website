package com.topcoder.shared.security;

/**
 * Resource which represents the containing directory for a path.
 *
 * @author Ambrose Feinstein
 */
public class PathResource implements Resource {

    private String name;

    public PathResource(String path) {
        int i = path.lastIndexOf('/');
        if(i>=0) path = path.substring(0,i);
        this.name = path;
    }

    public String getName() {
        return name;
    }
}
