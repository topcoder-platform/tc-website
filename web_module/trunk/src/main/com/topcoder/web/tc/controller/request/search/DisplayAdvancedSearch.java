package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.MemberSearch;
import com.topcoder.web.common.TCWebException;

public class DisplayAdvancedSearch extends SimpleSearch {
    protected void businessProcessing() throws TCWebException {
        MemberSearch m = new MemberSearch();
        m.setStateList(getStateList());
        m.setCountryList(getCountryList());
        getRequest().setAttribute("memberSearch", m);
        setNextPage(Constants.ADVANCED_SEARCH);
        setIsNextPageInContext(true);
    }
}
