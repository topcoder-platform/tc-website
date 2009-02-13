package com.topcoder.shared.security;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$ 
 * Jan 14, 2003 9:09:57 PM
 */

public class SimpleResource implements Resource {

    // the enumeration of all roles for SimpleResources
    protected final static String STATIC_ROLE = "static";
    protected final static String PROCESSOR_ROLE = "processor_role";
    protected final static String PROCESSOR_GROUP_ROLE
            = "processor_group_role";

    /**
     *
     * @return Resource name
     */
    public String getName() {
        return null;
    }
}