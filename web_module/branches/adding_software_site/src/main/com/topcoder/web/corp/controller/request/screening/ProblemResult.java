package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.web.corp.model.ProblemInfo;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.corp.model.SubmissionInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

/**
 * Processing for the Problem Result page.
 * @author Porgery
 */
public class ProblemResult extends BaseProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void businessProcessing() throws TCWebException {
        try {
            SubmissionInfo sinfo = new SubmissionInfo(getUser(),
                    Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)),
                    Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                    Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID)),
                    Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_TYPE_ID)));

            getRequest().setAttribute("submissionInfo", sinfo);

            CandidateInfo cinfo = new CandidateInfo();
            cinfo.setUserName(sinfo.getHandle());
            cinfo.setUserId(new Long(sinfo.getUserId()));
            getRequest().setAttribute("candidateInfo", cinfo);

            ProfileInfo pinfo = new ProfileInfo();
            pinfo.setProfileName(sinfo.getProfileName());
            pinfo.setTestSetAName(sinfo.getTestSetAName());
            getRequest().setAttribute("profileInfo", pinfo);

            getRequest().setAttribute("problemInfo",
                    ProblemInfo.createProblemInfo(getUser(),
                            Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                            Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID))));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setIsNextPageInContext(true);
    }

}
