package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.SubmissionInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * Processing for the TopCoder Problem Result page.
 * @author Porgery
 */
public class TCProblemResult extends BaseProcessor {

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void businessProcessing() throws TCWebException {
        try {
            DataAccessInt dAccess = Util.getDataAccess(Constants.DW_DATA_SOURCE, true);

            Request dr = new Request();
            dr.setContentHandle("coderProblemInfo");
            dr.setProperty("cr", getRequest().getParameter(Constants.USER_ID));
            dr.setProperty("rd", getRequest().getParameter(Constants.ROUND_ID));
            dr.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));

            Map map = dAccess.getData(dr);
            if (map == null)
                throw new ScreeningException("getData failed!");

            ResultSetContainer result =
                    (ResultSetContainer) map.get("coderProblemSolution");
            if (result.getRowCount() == 0) {
                throw new ScreeningException("Error retrieving code submission.");
            }

            SubmissionInfo sinfo = new SubmissionInfo();
            sinfo.setCode(result.getItem(0, "submission_text").toString());
            sinfo.setTestResults((ResultSetContainer) map.get("coderProblemTestResults"));
            getRequest().setAttribute("submissionInfo", sinfo);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.TC_PROBLEM_RESULT_PAGE);
        setIsNextPageInContext(true);
    }

}
