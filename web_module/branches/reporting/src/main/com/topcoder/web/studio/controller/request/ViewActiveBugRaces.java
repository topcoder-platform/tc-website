package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.BaseProcessor;

/**
 * BUGR-1211
 * 
 * February 18, 2009
 * 
 * @author ShindouHikaru
 * 
 */
public class ViewActiveBugRaces extends BaseProcessor {        

    protected void businessProcessing() throws Exception {        

        // everything is done in ajax, so there's no need for business processing        
        setNextPage("/activeBugRaces.jsp");
        setIsNextPageInContext(true);
    }
}
