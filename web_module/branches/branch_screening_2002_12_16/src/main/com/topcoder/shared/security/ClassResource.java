package com.topcoder.shared.security;

/**
 *
 * @author Fred Wang (silentmobius)
 * @version $Revision$
 * Jan 15, 2003 4:37:27 PM
 */

public class ClassResource extends SimpleResource {

    private Class resource;

    /**
     * constructor of ClassResource. Pass in a Class object
     * (e.g. String.class)
     * @param resource
     */
    public ClassResource (Class resource) {
        this.resource = resource;
    }

    /**
     * @return package + className String
     */
    public String getName() {
        return resource.getName();
    }

    /**
     *
     * @return the Role of this Permission (static, processor, processor_group)
     */
    public String getRole() {
        return SimpleResource.PROCESSOR_ROLE;
    }

    public static void main(String[] args) {
        ClassResource r = new ClassResource(String.class);
        String name = r.getName();
        System.out.println("name = " + name);
    }
}