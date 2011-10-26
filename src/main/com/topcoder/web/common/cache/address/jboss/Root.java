package com.topcoder.web.common.cache.address.jboss;

/**
 * @author dok
 * @version $Revision: 60677 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 7, 2007
 */
public enum Root {
    //not using Fqn.SEPERATOR for now
    GENERAL_DATA("/generalData"), TCSUBJECT("/subject");

    final String path;

    Root(String path) {
        this.path = path;
    }

    public String path() {
        return path;
    }
}

