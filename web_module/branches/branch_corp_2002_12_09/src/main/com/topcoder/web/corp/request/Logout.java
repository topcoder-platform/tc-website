package com.topcoder.web.corp.request;

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
        authToken.logout(true);
//        BasicAuthentication authToken = getAuthenticityToken();
//        User currentUser = authToken.getLoggedInUser();
//        
//        authToken.logout(currentUser);
//        log.debug("user "+currentUser.getUserName()+" has logged out");
//
//        // done. do not forget reset cookies (set up 'cleared' ones)
//        setCookies(authToken.buildAutoLogonCookies(true));
        
        pageInContext = false;
        nextPage = null; // controller will fetch recently viewed page
        return;
    }
}
