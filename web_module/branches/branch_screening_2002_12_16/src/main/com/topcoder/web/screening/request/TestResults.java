package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.*;
import com.topcoder.web.screening.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Map;

/**
 * Processing for the Test Results page.
 * @author Porgery
 */
public class TestResults extends BaseProcessor {
    
    /** Implements the processing step.
     * @throws Exception
     */
    public void process() throws Exception {
        InitialContext context = new InitialContext();

        DataAccessInt dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DATA_SOURCE));
        Request dr = new Request();
        dr.setProperties(getParameterMap());
        dr.setContentHandle("testResults");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        Map map = dAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");
        
        ResultSetContainer result =
            (ResultSetContainer)map.get("sessionInfo");
        if(result.getRowCount() == 0){
            throw new PermissionDeniedException(
                "You are not authorized to view information about this session.");
        }
        String roundId = result.getItem(0,"contest_round_id").toString();
        String divisionId = result.getItem(0,"contest_division_id").toString();
        
        dAccess = new DataAccess(
            (DataSource)context.lookup(Constants.DW_DATA_SOURCE));
        dr = new Request();
        dr.setContentHandle("roundProblemStats");
        dr.setProperty("rd", roundId);
        dr.setProperty("dn", divisionId);
        Map dwMap = dAccess.getData(dr);
        if(map == null)
            throw new ScreeningException("getData failed!");
        
        CandidateInfo cinfo = new CandidateInfo();
        cinfo.setEmailAddress(result.getItem(0,"handle").toString());
        cinfo.setUserId(Long.valueOf(result.getItem(0,"user_id").toString()));
        getRequest().setAttribute("candidateInfo",cinfo);
            
        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName(result.getItem(0,"session_profile_desc").toString());
        pinfo.setTestSetAName(result.getItem(0,"session_round_name").toString());
        pinfo.setTestSetAList((ResultSetContainer)map.get("sessionTestSetA"));
        pinfo.setTestSetBList((ResultSetContainer)map.get("sessionTestSetB"));
        getRequest().setAttribute("profileInfo",pinfo);
        
        TestResultsInfo tinfo = new TestResultsInfo();
        tinfo.setSessionId(Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)));
        tinfo.setProblemSetAResults((ResultSetContainer)map.get("testSetAResults"));        
        tinfo.setProblemSetBResults((ResultSetContainer)map.get("testSetBResults"));
        tinfo.setProblemSetATCStats((ResultSetContainer)dwMap.get("roundProblemStats"));
        getRequest().setAttribute("testResultsInfo",tinfo);

        setNextPage(Constants.TEST_RESULTS_PAGE);
        setNextPageInContext(true);
    }
    
}
