package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.Map;

public class HighestRating extends Base {
    public void businessProcessing() throws TCWebException {

        Request r = new Request();
        r.setContentHandle("highest_rating");

        try {
            CachedDataAccess da = (CachedDataAccess)getDataAccess(true);
            Map m = da.getData(r);
            ResultSetContainer rsc = (ResultSetContainer)m.get("highest_rating");
            getRequest().setAttribute("ratingInfo", rsc);
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        setNextPage(Constants.HIGHEST_RATING);
        setIsNextPageInContext(true);
    }
}
