package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.SessionInfo;
import com.topcoder.web.common.BaseServlet;
import com.topcoder.web.codinginterface.techassess.Constants;

/**
 * User: dok
 * Date: Dec 21, 2004
 * Time: 3:19:32 PM
 */
public class IndexInner extends Base {


    protected void businessProcessing() throws TCWebException {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(true);
        } else {
            setNextPage(Constants.PAGE_INDEX_INNER);
            setIsNextPageInContext(true);
        }
    }
}
