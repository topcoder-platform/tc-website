package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

/**
 * Processing for the Profile List page.
 * @author Porgery
 */
public class ProfileList extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        authorize(getSelfRedirect());
        
        setNextPage(Constants.PROFILE_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}
