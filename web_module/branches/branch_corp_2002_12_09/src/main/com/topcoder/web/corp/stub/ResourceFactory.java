package com.topcoder.web.corp.stub;

import com.topcoder.shared.security.Resource;

/**
 * My comments/description/notes go here
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class ResourceFactory {
    /**
     * 
     */
    public static final Resource RC_CREATE_NEW_USER_IN_GROUP = 
            new rc_impl("create new user");

    /**
     * 
     */
    public static final Resource RC_MODIFY_USER_IN_GROUP =
            new rc_impl("modify user");
    
    
    static class rc_impl implements Resource {
        String n;
        
        /**
         * 
         * @param name
         */
        private rc_impl(String name) {
            n = name;
        }
        
        /**
         * @see com.topcoder.shared.security.Resource#getName()
         */
        public String getName() {
            return n;
        }

    } 
}
