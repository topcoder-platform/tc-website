package com.topcoder.web.openaim.controller.request;

import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision: 68803 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewRegistrants extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        setNextPage("/registrants.jsp");
        setIsNextPageInContext(true);
    }
}
