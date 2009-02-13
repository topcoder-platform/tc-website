package com.topcoder.web.tc.controller.request.problemRating;

import com.topcoder.web.tc.controller.request.Base;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.shared.dataAccess.Request;

public class Info extends Base {
    protected void businessProcessing() throws TCWebException {

        String questionId = StringUtils.checkNull(getRequest().getParameter("qid"));

        try {
            if (!questionId.equals("")) {
                Request r = new Request();
                r.setContentHandle("problem_rating_question_info");
                r.setProperty("qid", questionId);
                getRequest().setAttribute("info", getDataAccess(true).getData(r).get("problem_rating_question_info"));
            }
            setNextPage(Constants.PROBLEM_RATING_QUESTION_INFO);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
