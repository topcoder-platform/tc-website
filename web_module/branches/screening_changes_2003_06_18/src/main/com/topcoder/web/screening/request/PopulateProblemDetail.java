package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.common.BaseProcessor;

import javax.servlet.ServletRequest;

public class PopulateProblemDetail extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        ServletRequest request = getRequest();
        String roundProblemId = 
            request.getParameter(Constants.ROUND_PROBLEM_ID);

        if(roundProblemId == null) {
            throw new ScreeningException("Round ID/Problem ID not set");
        }

        int index = roundProblemId.indexOf(',');
        if(index == -1) {
            throw new ScreeningException("Invalid format for parameter");
        }

        long roundId = Long.parseLong(roundProblemId.substring(0, index));
        long problemId = Long.parseLong(roundProblemId.substring(index+1));

        ProblemInfo info = 
            ProblemInfo.createProblemInfo(getAuthentication().getActiveUser(), 
                                          roundId, 
                                          problemId);

        request.setAttribute(Constants.PROBLEM_INFO, info);
        setNextPage(Constants.PROBLEM_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
