package com.topcoder.web.corp.request;

import com.topcoder.web.corp.Util;

/**
 * class to process a log out request.  should simply be a call to an
 * authentication object logout().
 *
 * @author Greg Paul
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Logout extends BaseProcessor {

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        authToken.logout();
        pageInContext = false;
        nextPage = Util.appRootPage(request);
        return;
    }
}
