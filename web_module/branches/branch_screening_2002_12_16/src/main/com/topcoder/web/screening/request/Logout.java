package com.topcoder.web.screening.request;

/**
 * Processes a logout request.
 * @author  Porgery
 */
public class Logout extends BaseProcessor {
    
    /** Creates a new instance of Logout */
    public Logout() {
    }
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        getAuthentication().logout();
        
        setNextPage("/");
        setNextPageInContext(false);
    }
    
}
