package com.topcoder.web.corp.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;

/**
 * @author dok
 * Date: Apr 29, 2004
 */
public class ViewCard extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {

        String coderId = StringUtils.checkNull(getRequest().getParameter("cr"));
        if (coderId.equals("")) {
            throw new TCWebException("Coder id parameter not included in request");
        } else {
            //pretty much just pass it along.  the data retriever will check
            //to be sure it should be serving up the data
            getRequest().setAttribute("cr", coderId);
            setNextPage("/corp/recruiting/card_lp.jsp");
            setIsNextPageInContext(true);
        }


    }

}
