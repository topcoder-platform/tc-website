package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 * @author dok
 * Date: Jan 19, 2004
 */
public class Profile extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {
        setNextPage("/");
        setIsNextPageInContext(false);
    }

}
