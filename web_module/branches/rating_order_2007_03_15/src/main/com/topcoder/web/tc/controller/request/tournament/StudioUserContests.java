package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Static;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 15, 2007
 */
public class StudioUserContests extends Static {
    protected void businessProcessing() throws Exception {
        Request r = new Request();
        r.setContentHandle("user_event_contests");
        r.setProperty(Constants.EVENT_ID, getRequest().getParameter(Constants.EVENT_ID));
        r.setProperty(Constants.USER_ID, getRequest().getParameter(Constants.USER_ID));
        getRequest().setAttribute("results",
                new DataAccess(DBMS.STUDIO_DATASOURCE_NAME).getData(r).get("user_event_contests"));

        super.businessProcessing();
    }
}
