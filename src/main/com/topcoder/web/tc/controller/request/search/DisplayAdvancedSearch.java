package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;

public class DisplayAdvancedSearch extends Base {
    protected void businessProcessing() throws TCWebException {
        setNextPage(Constants.ADVANCED_SEARCH_RESULTS);
        setIsNextPageInContext(true);
    }
}
