package com.topcoder.web.screening.request;

import com.topcoder.web.screening.model.*;
import com.topcoder.web.screening.common.Constants;

/**
 * Processing for the Problem Result page.
 * @author Porgery
 */
public class ProblemResult extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        SubmissionInfo sinfo = new SubmissionInfo();
        sinfo.setCode("Blah blah blah");
        getRequest().setAttribute("submissionInfo",sinfo);
        
        CandidateInfo cinfo = new CandidateInfo();
        cinfo.setEmailAddress("sample@somewhere.com");
        getRequest().setAttribute("candidateInfo",cinfo);
        
        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName("Sample Test Profile");
        pinfo.setTestSetAName("Sample Problem Set");
        getRequest().setAttribute("profileInfo",pinfo);
        
        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setNextPageInContext(true);
    }
    
}
