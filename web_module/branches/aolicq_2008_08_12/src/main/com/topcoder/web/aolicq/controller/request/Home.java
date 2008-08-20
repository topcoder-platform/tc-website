package com.topcoder.web.aolicq.controller.request;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.cache.MaxAge;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jun 22, 2006
 */
public class Home extends BaseProcessor {

    protected void businessProcessing() throws Exception {

        Request r = new Request();
        r.setContentHandle("aolicq_home_data");
        DataAccessInt dai = new CachedDataAccess(MaxAge.QUARTER_HOUR.age(), DBMS.AOLICQ_DATASOURCE_NAME);
        
        ResultSetContainer homeData = dai.getData(r).get("aolicq_home_data");

        if (homeData.size() > 0) {
            getRequest().setAttribute("homeData", homeData.get(0));
        } else {
            getRequest().setAttribute("homeData", null);
        }

        setNextPage("/home.jsp");
        setIsNextPageInContext(true);
    }
}