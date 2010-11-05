/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.studio.model.Contest;

/**
 * <p>This class will process a request to view milestone feedback texts for requested contest.</p>
 *
 * @author TCSDEVELOPER
 * @version 1.0 (Studio Contest Detail Pages assembly)
 */
public class ViewMilestoneFeedback extends ViewContestDetails {

    /**
     * <p>Constructs new <code>ViewMilestoneFeedback</code> instance. This implementation does nothing.</p>
     */
    public ViewMilestoneFeedback() {
    }

    /**
     * <p>Implements the business logic for processing the request.</p>
     *
     * @throws Exception if any error occurs.
     */
    @Override
    protected void dbProcessing() throws Exception {
        super.dbProcessing();
        Contest contest = (Contest) getRequest().getAttribute("contest");
        if (contest != null) {
            if (!contest.isMilestoneFeedbackAvailable()) {
                throw new NavigationException("Contest with no milestone round or available feedback is requested");
            }
        }
        setNextPage("/milestoneFeedback.jsp");
        setIsNextPageInContext(true);
    }
}
