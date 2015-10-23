/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.compstats;

import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;

import java.util.Map;

/**
 * <strong>Purpose</strong>:
 * A processor to retrieve review feedback details for a particular project.
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class ReviewFeedbackDetails extends Base {
    /**
     * Process the review feedback details request.
     * Retrieves the review feedback details for a particular project.
     */
    protected void businessProcessing() throws Exception {
        // user should be authenticated.
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        if (!hasParameter(Constants.PROJECT_ID)) {
            throw new TCWebException("Missing " + Constants.PROJECT_ID + " parameter.");
        }

        // Prepare request for data retrieval
        Request r = new Request();
        r.setProperty(Constants.PROJECT_ID, getRequest().getParameter(Constants.PROJECT_ID));
        r.setContentHandle(Constants.REVIEW_FEEDBACK_DETAILS_COMMAND);

        // retrieves data from DB
        DataAccessInt dai = new CachedDataAccess(DBMS.TCS_OLTP_DATASOURCE_NAME);
        Map m = dai.getData(r);
        ResultSetContainer reviewFeedback = (ResultSetContainer) m.get(Constants.REVIEW_FEEDBACK_DETAILS_QUERY);

        // sets attributes for the jsp
        getRequest().setAttribute(Constants.REVIEW_FEEDBACK_KEY, reviewFeedback);

        setNextPage(Constants.VIEW_REVIEW_FEEDBACK_DETAILS_PAGE);
        setIsNextPageInContext(true);
    }
}
