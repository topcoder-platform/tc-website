package com.topcoder.web.tc.controller.request;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.onsite.Constants;

public class Home extends Base {

    protected void businessProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            setNextPage(Constants.LOGIN);
        } else {
            setNextPage(Constants.WAGER_PAGE);
        }
        setIsNextPageInContext(true);
    }

}
