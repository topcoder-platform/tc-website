package com.topcoder.web.screening.request;

import com.topcoder.web.screening.model.SubmissionInfo;
import com.topcoder.web.screening.common.Constants;

/**
 * Processing for the TopCoder Problem Result page.
 * @author Porgery
 */
public class TCProblemResult extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        SubmissionInfo info = new SubmissionInfo();
        info.setCode("Blah blah blah");
        getRequest().setAttribute("submissionInfo",info);
        setNextPage(Constants.TC_PROBLEM_RESULT_PAGE);
        setNextPageInContext(true);
    }
    
}
