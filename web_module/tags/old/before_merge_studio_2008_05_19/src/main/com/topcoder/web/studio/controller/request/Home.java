package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.studio.Constants;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        Request r = new Request();
        r.setContentHandle("studio_home_data");
        r.setProperty(Constants.USER_ID, String.valueOf(getUser().getId()));
        DataAccessInt dai = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        getRequest().setAttribute(r.getContentHandle(), dai.getData(r));

        if (userIdentified()) {
            DataAccess tco08Dai = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
            Request tco08Request = new Request();
            tco08Request.setProperty("cr", String.valueOf(getUser().getId()));

            tco08Request.setContentHandle("tco08studio_info");
            getRequest().setAttribute("tco08studio_info",
                    tco08Dai.getData(tco08Request).get("tco08studio_info"));
        }

        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
}