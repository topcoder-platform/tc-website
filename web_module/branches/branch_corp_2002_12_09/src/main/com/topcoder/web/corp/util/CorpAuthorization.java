package com.topcoder.web.corp.util;

import com.topcoder.shared.security.Authorization;
import com.topcoder.shared.security.Resource;
import com.topcoder.shared.security.User;

/**
 * This will be using the TopCoder Software security component to determine if a
 * particular user has access to a particular resource.
 * 
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class CorpAuthorization implements Authorization {

    /**
     * @see com.topcoder.shared.security.Authorization#hasPermission()
     */
    public boolean hasPermission() {
        return false;
    }

    /**
     * @see com.topcoder.shared.security.Authorization#setResource(com.topcoder.shared.security.Resource)
     */
    public void setResource(Resource r) {
    }

    /**
     * @see com.topcoder.shared.security.Authorization#setUser(com.topcoder.shared.security.User)
     */
    public void setUser(User u) {
    }
}
