package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.model.ProblemInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

public class PopulateProblemDetail extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {
        String roundProblemId =
                getRequest().getParameter(Constants.ROUND_PROBLEM_ID);

        if (roundProblemId == null) {
            throw new ScreeningException("Round ID/Problem ID not set");
        }

        int index = roundProblemId.indexOf(',');
        if (index == -1) {
            throw new ScreeningException("Invalid format for parameter");
        }

        long roundId = Long.parseLong(roundProblemId.substring(0, index));
        long problemId = Long.parseLong(roundProblemId.substring(index + 1));
        ProblemInfo info = null;
        try {
            info =
                    ProblemInfo.createProblemInfo(getUser(), roundId, problemId);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        getRequest().setAttribute(Constants.PROBLEM_INFO, info);
        setNextPage(Constants.PROBLEM_DETAIL_PAGE);
        setIsNextPageInContext(true);
    }
}
