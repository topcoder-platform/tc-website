package com.topcoder.web.corp.request;

import com.topcoder.shared.security.User;
import com.topcoder.web.common.security.BasicAuthentication;
import com.topcoder.web.common.security.SessionPersistor;

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
        BasicAuthentication authToken = getAuthenticityToken();
        User currentUser = authToken.getLoggedInUser();
        
        authToken.logout(currentUser);
        // done. do not forget reset cookies
        pageInContext = true;
        nextPage = SessionPersistor.getInstance(request).getLastPage();
        return;
    }
}
