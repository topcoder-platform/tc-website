package com.topcoder.web.tc.controller.request.statistics;

import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;

import java.util.Map;

public class HighestRating extends Base {
    public void businessProcessing() throws TCWebException {

        Request r = new Request();
        r.setContentHandle("highest_rating");

        String startRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.START_RANK));
        String endRank = StringUtils.checkNull(getRequest().getParameter(DataAccessConstants.END_RANK));

        if (!startRank.equals("")) {
            r.setProperty(DataAccessConstants.START_RANK, startRank);
        }
        if (!endRank.equals("")) {
            r.setProperty(DataAccessConstants.END_RANK, endRank);
        }

        try {
            CachedDataAccess da = (CachedDataAccess) getDataAccess(true);
            Map m = da.getData(r);
            ResultSetContainer rsc = (ResultSetContainer) m.get("highest_rating");
            getRequest().setAttribute("ratingInfo", rsc);
        } catch (Exception e) {
            throw new TCWebException(e);
        }


        setNextPage(Constants.HIGHEST_RATING);
        setIsNextPageInContext(true);
    }
}
