package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 18, 2006
 */
public class ViewRegistration extends BaseProcessor {
    protected void businessProcessing() throws Exception {
        Long contestId;
        try {
            contestId = new Long(getRequest().getParameter(Constants.CONTEST_ID));
        } catch (NumberFormatException e) {
            throw new NavigationException("Invalid Contest Specified");
        }
        setDefault(Constants.CONTEST_ID, contestId.toString());
        setNextPage("/contestReg.jsp");
        setIsNextPageInContext(true);
    }
}
