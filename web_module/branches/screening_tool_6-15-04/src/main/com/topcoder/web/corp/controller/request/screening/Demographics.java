/*
 * Demographics.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.controller.request.screening.BaseSessionProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.ScreeningException;
/**
 *
 * @author  rfairfax
 */
public class Demographics extends BaseScreeningProcessor {
    
    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {
        String campaignId = getRequest().getParameter(Constants.CAMPAIGN_ID);
        if (campaignId == null) {
            // notify the user about the error
            log.error("Campaign ID is not specified.");
            throw new ScreeningException("No campaign ID had been specified.");
        }
        
        setNextPage(Constants.DEMOGRAPHICS_PAGE);
        setIsNextPageInContext(true); 
    }
    
    
}
