package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.*;
import com.topcoder.web.screening.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
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
//        authorize(getSelfRedirect());
        
        InitialContext context = new InitialContext();
        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        
        Request dr = new Request();
        dr.setProperties(getParameterMap());
        dr.setContentHandle("problemResults");
        dr.setProperty("uid", String.valueOf(getAuthentication().getUser().getId()));
        
        Map map = dAccess.getData(dr);

        if(map != null)
        {
            CandidateInfo cinfo = new CandidateInfo();
            ResultSetContainer result =
                (ResultSetContainer)map.get("submissionInfo");
            if(result.getRowCount() == 0){
                throw new PermissionDeniedException(
                    "You are not authorized to view information about that problem result.");
            }
            cinfo.setEmailAddress(result.getItem(0,"handle").toString());
            cinfo.setUserId(Long.valueOf(result.getItem(0,"user_id").toString()));
            getRequest().setAttribute("candidateInfo",cinfo);
            
            ProfileInfo pinfo = new ProfileInfo();
            pinfo.setProfileName(result.getItem(0,"session_profile_desc").toString());
            pinfo.setTestSetAName(result.getItem(0,"round_name").toString());
            getRequest().setAttribute("profileInfo",pinfo);
            
            SubmissionInfo sinfo = new SubmissionInfo();
            sinfo.setCode(result.getItem(0,"submission_text").toString());
            sinfo.setTestResults((ResultSetContainer)map.get("systemTestResults"));
            getRequest().setAttribute("submissionInfo",sinfo);
        }
        
        setNextPage(Constants.PROBLEM_RESULT_PAGE);
        setNextPageInContext(true);
    }
    
}
