package com.topcoder.shared.security;

import com.topcoder.shared.util.logging.Logger;

/**
 * Resource which represents the containing directory for a path.
 *
 * @author Ambrose Feinstein
 */
public class PathResource implements Resource {

    private static Logger log = Logger.getLogger(PathResource.class);

    private String name;

    public PathResource(String path) {
        int i = path.lastIndexOf('/');
        if (i >= 0)
            this.name = path.substring(0, i);
        else this.name = path;
        log.debug("path was: " + path + " set name to : " + name);
    }

    public String getName() {
        return name;
    }
}
