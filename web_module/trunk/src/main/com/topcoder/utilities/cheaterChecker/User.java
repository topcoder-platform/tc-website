package com.topcoder.utilities.cheaterChecker;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 24, 2005
 */
public class User {
    private long userId = 0;
    private String handle = null;
    private static Logger log = Logger.getLogger(User.class);

    public User() {

    }
    public User(long userId, String handle) {
        this.userId = userId;
        this.handle = handle;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getHandle() {
        return handle;
    }

    public void setHandle(String handle) {
        this.handle = handle;
    }

    public boolean equals(Object o) {
        log.debug("equals " + o);
        return ((User)o).getUserId()==userId;
    }

    public String toString() {
        return handle+"("+userId+")";
    }
}
