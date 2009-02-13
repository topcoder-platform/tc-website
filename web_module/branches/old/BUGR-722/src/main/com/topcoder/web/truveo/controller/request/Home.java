package com.topcoder.web.truveo.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        Request r = new Request();
        r.setContentHandle("truveo_home_data");
        DataAccessInt dai = new CachedDataAccess(DBMS.TRUVEO_DATASOURCE_NAME);
        getRequest().setAttribute(r.getContentHandle(), dai.getData(r));


        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
}