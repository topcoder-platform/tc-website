/*
 * Copyright (c) 2001-2008 TopCoder Inc.  All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.dr;

import java.util.Map;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.CachedDataAccess;
import com.topcoder.web.common.cache.MaxAge;
import com.topcoder.web.tc.Constants;

/**
 * Copyright (c) 2001-2008 TopCoder, Inc. All rights reserved.
 * Only for use in connection with a TopCoder competition.
 *
 * @author pulky
 * @version $Id$
 * Create Date: Jul 4, 2008
 */
public class PointsDetail extends BaseProcessor {

    /* (non-Javadoc)
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    @Override
    protected void businessProcessing() throws Exception {

        int trackId = Integer.parseInt(getRequest().getParameter(Constants.TRACK_ID));
        setDefault(Constants.TRACK_ID, trackId);
        int userId = Integer.parseInt(getRequest().getParameter(Constants.USER_ID));
        setDefault(Constants.USER_ID, trackId);
        boolean potential = (Integer.parseInt(getRequest().getParameter(Constants.POTENTIAL_FLAG_ID)) == 1);
        setDefault(Constants.POTENTIAL_FLAG_ID, trackId);

        ResultSetContainer rsc = getPointsData(DBMS.TCS_OLTP_DATASOURCE_NAME, "dr_points_detail", trackId, userId, potential);


        getRequest().setAttribute("result", rsc);
        
        setNextPage("/digital_run/points_detail.jsp");
        setIsNextPageInContext(true);        
    }

    /**
     * @return
     * @throws Exception
     */
    private ResultSetContainer getPointsData(String datasource, String query, int trackId, int userId, boolean potential) throws Exception {
        CachedDataAccess cda = new CachedDataAccess(MaxAge.HALF_HOUR, datasource);
        Request dataRequest = new Request();
        dataRequest.setContentHandle(query);
        dataRequest.setProperty(Constants.TRACK_ID, String.valueOf(trackId));
        dataRequest.setProperty(Constants.CODER_ID, String.valueOf(userId));
        dataRequest.setProperty(Constants.POTENTIAL_FLAG_ID, potential ? "t" : "f");
        Map<String, ResultSetContainer> map = cda.getData(dataRequest);
        ResultSetContainer rsc = map.get(query);
        return rsc;
    }
}
