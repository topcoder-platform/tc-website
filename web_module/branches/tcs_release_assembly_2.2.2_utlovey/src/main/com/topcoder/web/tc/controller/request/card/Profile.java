package com.topcoder.web.tc.controller.request.card;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

/**
 * @author dok
 * Date: Jan 19, 2004
 */
public class Profile extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {

        String coderId = StringUtils.checkNull(getRequest().getParameter("cr"));
        if (coderId.equals("")) {
            throw new TCWebException("Coder id parameter not included in request");
        }

        //pretty much just pass it along.  the data retriever will check
        //to be sure it should be serving up the data
        getRequest().setAttribute("cr", coderId);
        setNextPage(Constants.LANDING_PAGE);
        setIsNextPageInContext(true);

    }

}
