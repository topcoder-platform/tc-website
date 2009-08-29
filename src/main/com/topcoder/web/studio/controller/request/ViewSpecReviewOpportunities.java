/*
 * Copyright (C) 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.model.SortInfo;
import com.topcoder.web.studio.Constants;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccessConstants;
import com.topcoder.shared.util.DBMS;

/**
 * <p>A controller for handling the requests for viewing specification review opportunities for <code>Studio</code>
 * contests.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0
 * @since Studio Release Assembly - Spec Review Signup Page
 */
public class ViewSpecReviewOpportunities extends BaseProcessor {

    /**
     * <p>Constructs new <code>ViewSpecReviewOpportunities</code> instance. This implementation does nothing.</p>
     */
    public ViewSpecReviewOpportunities() {
    }

    /**
     * <p>Implements the business logic for processing the requests for viewing the specification review opportunities
     * for <code>Studio</code> contests.</p>
     *
     * @throws Exception if an unexpected error occurs.
     */
    protected void businessProcessing() throws Exception {
        DataAccess da = new DataAccess(DBMS.STUDIO_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("review_opportunities");
        getRequest().setAttribute("reviewOpportunities", da.getData(r).get("review_opportunities"));
        setNextPage("/reviewOpportunities.jsp");
        setIsNextPageInContext(true);
    }

}
