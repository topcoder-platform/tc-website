/*
 * DOCConversion.java
 *
 * Created on December 6, 2004, 2:07 PM
 */

package com.topcoder.web.tc.controller.request.profile;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import com.topcoder.web.tc.Constants;
/**
 *
 * @author rfairfax
 */
public class DOCConversion extends BaseProcessor {
    

    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.PROFILE_DOC_CONVERTOR_PAGE); 
        setIsNextPageInContext(true);
    }
}
