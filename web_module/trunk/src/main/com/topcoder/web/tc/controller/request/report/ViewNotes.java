package com.topcoder.web.tc.controller.request.report;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessInt;

/**
 * User: dok
 * Date: Nov 18, 2004
 * Time: 8:25:57 AM
 */
public class ViewNotes extends Base {

    protected void businessProcessing() throws TCWebException {
        String userId = getRequest().getParameter(Constants.USER_ID);

        try {
            if (StringUtils.checkNull(userId).equals("")) {
                throw new NavigationException("Request missing user id");
            } else {
                Request r = new Request();
                r.setContentHandle("note_list");
                r.setProperty(String.valueOf(Constants.USER_ID), userId);

                DataAccessInt dai = getDataAccess();
                getRequest().setAttribute("note_list", dai.getData(r).get("note_list"));

                setNextPage(Constants.NOTE_LIST);
                setIsNextPageInContext(true);
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
