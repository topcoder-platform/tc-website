package com.topcoder.web.screening.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.common.ScreeningException;
import com.topcoder.web.screening.model.CandidateInfo;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.ProfileInfo;
import com.topcoder.web.screening.model.SubmissionInfo;

import java.util.List;
import java.util.Map;

/**
 * Processing for the Problem Result page.
 * @author Porgery
 */
public class ProblemResult extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        DataAccessInt dAccess = getDataAccess();
        
        Request dr = new Request();
        dr.setProperties(getParameterMap());
        dr.setContentHandle("problemResults");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        
        Map map = dAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");
        
        ResultSetContainer result =
            (ResultSetContainer)map.get("submissionInfo");
        if(result.getRowCount() == 0){
            throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                "User not authorized to view information about problem: " +
                        dr.getProperty("pid")==null?"?":dr.getProperty("pid"));
        }
        String problemId = getRequest().getParameter(Constants.PROBLEM_ID);
        String divisionId = result.getItem(0,"contest_division_id").toString();
        
        dAccess = getDataAccess(Constants.DW_DATA_SOURCE, true);
        dr = new Request();
        dr.setContentHandle("topProblemSolutions");
        dr.setProperty("pm", problemId);
        dr.setProperty("dn", divisionId);
        Map dwMap = dAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");

        CandidateInfo cinfo = new CandidateInfo();
        cinfo.setUserName(result.getItem(0,"handle").toString());
        cinfo.setUserId(Long.valueOf(result.getItem(0,"user_id").toString()));
        getRequest().setAttribute("candidateInfo",cinfo);
            
        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName(result.getItem(0,"session_profile_desc").toString());
        pinfo.setTestSetAName(result.getItem(0,"round_name").toString());
        getRequest().setAttribute("profileInfo",pinfo);
        
        SubmissionInfo sinfo = new SubmissionInfo();
        sinfo.setCode(result.getItem(0,"submission_text").toString());
        sinfo.setTestResults((ResultSetContainer)map.get("systemTestResults"));
        sinfo.setTopTCSolutions(((List)dwMap.get("topProblemSolutions")).subList(0,3));
        getRequest().setAttribute("submissionInfo",sinfo);
        
        getRequest().setAttribute("problemInfo",
            ProblemInfo.createProblemInfo(getAuthentication().getActiveUser(),
                Long.parseLong(getRequest().getParameter(Constants.ROUND_ID)),
                Long.parseLong(getRequest().getParameter(Constants.PROBLEM_ID))));
        
        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setNextPageInContext(true);
    }
    
}
