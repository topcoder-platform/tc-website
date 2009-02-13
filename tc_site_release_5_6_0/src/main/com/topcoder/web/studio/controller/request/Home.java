package com.topcoder.web.studio.controller.request;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        Request r = new Request();
        r.setContentHandle("studio_home_data");
        DataAccessInt dai = new CachedDataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        getRequest().setAttribute(r.getContentHandle(), dai.getData(r));

        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
}
