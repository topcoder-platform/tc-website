package com.topcoder.web.corp.request;

import java.util.Iterator;

import com.topcoder.security.TCSubject;
import com.topcoder.web.common.security.TCESAuthorization;

/**
 *  Just tries instantiate Authorization token for connected user
 *  
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class TryAuthorization extends BaseProcessor {

    /**
     * Just logs all permissions for given user
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        TCSubject user = new TCSubject(authToken.getActiveUser().getId());
        TCESAuthorization perm = new TCESAuthorization(user);
        Iterator i = perm.allPermissions();
        while( i.hasNext() ) {
            log.debug(i.next().toString());
        }
        pageInContext = false;
        nextPage = null; // controller will fetch recently viewed page
        return;
    }
}
