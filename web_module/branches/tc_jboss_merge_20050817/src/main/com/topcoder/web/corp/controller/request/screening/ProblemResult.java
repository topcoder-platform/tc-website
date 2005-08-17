package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.CandidateInfo;
import com.topcoder.web.corp.model.ProblemInfo;
import com.topcoder.web.corp.model.ProfileInfo;
import com.topcoder.web.corp.model.SubmissionInfo;

import java.util.Map;

/**
 * Processing for the Problem Result page.
 * @author Porgery
 */
public class ProblemResult extends BaseScreeningProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void screeningProcessing() throws TCWebException {
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

            DataAccessInt dAccess = Util.getDataAccess();
            Request dr = new Request();
            dr.setProperties(getRequest().getParameterMap());
            dr.setContentHandle("testResults");
            dr.setProperty("uid", String.valueOf(getUser().getId()));
            Map map = dAccess.getData(dr);
            if (map == null)
                throw new ScreeningException("getData failed!");

            ResultSetContainer result = (ResultSetContainer) map.get("sessionInfo");
            cinfo.setPreference(result.getIntItem(0, "preference_level"));

            getRequest().setAttribute("candidateInfo", cinfo);

            ProfileInfo pinfo = new ProfileInfo();
            pinfo.setProfileName(sinfo.getProfileName());
            pinfo.setTestSetAName(sinfo.getTestSetAName());
            getRequest().setAttribute("profileInfo", pinfo);

            getRequest().setAttribute("problemInfo",
                    ProblemInfo.createProblemInfo(getUser(),
                            Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                            Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID))));

            getRequest().setAttribute(Constants.USER_ID, String.valueOf(getUser().getId()));
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setIsNextPageInContext(true);
    }

}
