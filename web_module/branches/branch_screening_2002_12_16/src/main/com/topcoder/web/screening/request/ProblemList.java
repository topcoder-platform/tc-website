package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;

/**
 * Processor for Problem List page.
 * @author Porgery
 */
public class ProblemList extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        setNextPage(Constants.PROBLEM_LIST_PAGE);
        setNextPageInContext(true);
    }
    
}
