package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.SubmissionInfo;

import java.util.Map;

/**
 * Processing for the TopCoder Problem Result page.
 * @author Porgery
 */
public class TCProblemResult extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        DataAccessInt dAccess = getDataAccess(Constants.DW_DATA_SOURCE, true);
        
        Request dr = new Request();
        dr.setContentHandle("coderProblemInfo");
        dr.setProperty("cr", getRequest().getParameter(Constants.USER_ID));
        dr.setProperty("rd", getRequest().getParameter(Constants.ROUND_ID));
        dr.setProperty("pm", getRequest().getParameter(Constants.PROBLEM_ID));
        
        Map map = dAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");
        
        ResultSetContainer result =
            (ResultSetContainer)map.get("coderProblemSolution");
        if(result.getRowCount() == 0){
            throw new ScreeningException("Error retrieving code submission.");
        }

        SubmissionInfo sinfo = new SubmissionInfo();
        sinfo.setCode(result.getItem(0,"submission_text").toString());
        sinfo.setTestResults((ResultSetContainer)map.get("coderProblemTestResults"));
        getRequest().setAttribute("submissionInfo",sinfo);
        
        setNextPage(Constants.TC_PROBLEM_RESULT_PAGE);
        setNextPageInContext(true);
    }
    
}
