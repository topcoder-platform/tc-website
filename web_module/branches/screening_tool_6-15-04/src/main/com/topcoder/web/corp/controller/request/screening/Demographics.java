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
/**
 *
 * @author  rfairfax
 */
public class Demographics extends BaseScreeningProcessor {
    
    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {
        
        setNextPage(Constants.DEMOGRAPHICS_PAGE);
        setIsNextPageInContext(true); 
    }
    
    
}
