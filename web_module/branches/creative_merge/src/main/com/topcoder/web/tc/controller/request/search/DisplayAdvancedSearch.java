package com.topcoder.web.tc.controller.request.search;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.model.MemberSearch;

public class DisplayAdvancedSearch extends AdvancedSearch {
    protected void businessProcessing() throws TCWebException {
        MemberSearch m = new MemberSearch();
        m.setStateList(getStateList());
        m.setCountryList(getCountryList());
        super.setDefaults(m);
        getRequest().setAttribute("memberSearch", m);
        setNextPage(Constants.ADVANCED_SEARCH);
        setIsNextPageInContext(true);
    }
}
