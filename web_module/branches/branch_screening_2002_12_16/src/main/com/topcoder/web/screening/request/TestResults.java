package com.topcoder.web.screening.request;

import com.topcoder.web.screening.model.*;

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
        pinfo.setTestSetAName("Sample Problem Set");
        getRequest().setAttribute("profileInfo",cinfo);
        
        setNextPage("/test_results.jsp");
        setNextPageInContext(true);
    }
    
}
