package com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 7, 2005
 */
public class ViewPaymentGeneration extends BaseProcessor implements PactsConstants {

    protected void businessProcessing() throws TCWebException {
        setNextPage(INTERNAL_GENERATE_PAYMENTS);
        setIsNextPageInContext(true);
    }

}
