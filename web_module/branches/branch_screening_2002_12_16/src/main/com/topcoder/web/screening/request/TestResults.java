package com.topcoder.web.screening.request;

import com.topcoder.web.screening.model.*;
import com.topcoder.web.screening.common.Constants;

/**
 * Processing for the Test Results page.
 * @author Porgery
 */
public class TestResults extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        CandidateInfo cinfo = new CandidateInfo();
        cinfo.setEmailAddress("sample@somewhere.com");
        getRequest().setAttribute("candidateInfo",cinfo);
        
        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName("Sample Test Profile");
        getRequest().setAttribute("profileInfo",pinfo);
        
        TestResultsInfo tinfo = new TestResultsInfo();
        getRequest().setAttribute("testResultsInfo",tinfo);
        
        setNextPage(Constants.TEST_RESULTS_PAGE);
        setNextPageInContext(true);
    }
    
}
