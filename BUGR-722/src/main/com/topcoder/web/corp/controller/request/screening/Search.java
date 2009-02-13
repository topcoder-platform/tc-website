/*
 * Search.java
 *
 * Created on July 13, 2004, 10:54 AM
 */

package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.SearchModel;

/**
 * @author rfairfax
 */
public class Search extends BaseScreeningProcessor {

    protected void screeningProcessing() throws com.topcoder.web.common.TCWebException {

        try {

            SearchModel sm = getSearchModel();

            setDefault(Constants.FIRST_NAME, sm.getFirstName());
            setDefault(Constants.LAST_NAME, sm.getLastName());
            setDefault(Constants.EMAIL_ADDRESS, sm.getEmailAddress());

            getRequest().setAttribute("searchResults", sm);

            setNextPage(Constants.SEARCH_PAGE);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new com.topcoder.web.common.TCWebException(e);
        }
    }

    private SearchModel getSearchModel() throws Exception {
        try {

            SearchModel ret = new SearchModel();

            ret.setFirstName(StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME)));
            ret.setLastName(StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME)));
            ret.setEmailAddress(StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL_ADDRESS)));

            return ret;
        } catch (Exception e) {
            throw e;
        }
    }

}
