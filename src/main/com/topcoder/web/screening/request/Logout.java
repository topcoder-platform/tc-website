package com.topcoder.web.screening.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.screening.common.Constants;

/**
 * Processes a logout request.
 * @author  Porgery
 */
public class Logout extends BaseProcessor {
    
    private static Logger log = Logger.getLogger(Logout.class);

    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        log.debug("Logging out user " + getAuthentication().getActiveUser().getId());
        getAuthentication().logout();
        
        setNextPage(Constants.CONTROLLER_URL);
        setNextPageInContext(false);
    }
    
}
