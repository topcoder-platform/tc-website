package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.CandidateInfo;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.screening.model.SubmissionInfo;
import com.topcoder.web.common.BaseProcessor;

/**
 * Processing for the Problem Result page.
 * @author Porgery
 */
public class ProblemResult extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    protected void businessProcessing() throws Exception {

        SubmissionInfo sinfo = new SubmissionInfo(getAuthentication().getActiveUser(),
                Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)),
                Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID)),
                Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_TYPE_ID)));

        getRequest().setAttribute("submissionInfo", sinfo);

        CandidateInfo cinfo = new CandidateInfo();
        cinfo.setUserName(sinfo.getHandle());
        cinfo.setUserId(new Long(sinfo.getUserId()));
        getRequest().setAttribute("candidateInfo",cinfo);

        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName(sinfo.getProfileName());
        pinfo.setTestSetAName(sinfo.getTestSetAName());
        getRequest().setAttribute("profileInfo",pinfo);

        getRequest().setAttribute("problemInfo",
            ProblemInfo.createProblemInfo(getAuthentication().getActiveUser(),
                Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID))));

        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setIsNextPageInContext(true);
    }
    
}
