package com.topcoder.web.screening.request;

import com.topcoder.web.screening.common.*;
import com.topcoder.web.screening.model.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

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
        cinfo.setUserName(result.getItem(0,"handle").toString());
        cinfo.setUserId(Long.valueOf(result.getItem(0,"user_id").toString()));
        getRequest().setAttribute("candidateInfo",cinfo);
            
        TestResultsInfo tinfo = new TestResultsInfo();
        tinfo.setSessionId(Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)));
        tinfo.setSessionComplete(!result.getItem(0,"has_ended").toString().equals("0"));
        tinfo.setProblemSetBCount(Integer.parseInt(result.getItem(0,"num_set_b").toString()));
        tinfo.setProblemSetAResults((ResultSetContainer)map.get("testSetAResults"));        
        tinfo.setProblemSetBResults((ResultSetContainer)map.get("testSetBResults"));
        tinfo.setProblemSetATCStats((ResultSetContainer)dwMap.get("roundProblemStats"));
        getRequest().setAttribute("testResultsInfo",tinfo);

        ProfileInfo pinfo = new ProfileInfo();
        pinfo.setProfileName(result.getItem(0,"session_profile_desc").toString());
        pinfo.setTestSetAName(result.getItem(0,"session_round_name").toString());

        List plist = new ArrayList();
        result = (ResultSetContainer)map.get("testSetAResults");
        for(int i=0; i < result.size(); i++){
            plist.add(
                ProblemInfo.createProblemInfo(
                    getAuthentication().getActiveUser(),
                    Long.parseLong(result.getItem(i,"session_round_id").toString()),
                    Long.parseLong(result.getItem(i,"problem_id").toString())));
        }
        pinfo.setTestSetAList(plist);
        
        plist = new ArrayList();
        result = (ResultSetContainer)map.get("testSetBResults");
        for(int i=0; i < result.size(); i++){
            plist.add(
                ProblemInfo.createProblemInfo(
                    getAuthentication().getActiveUser(),
                    Long.parseLong(result.getItem(i,"session_round_id").toString()),
                    Long.parseLong(result.getItem(i,"problem_id").toString())));
        }
        pinfo.setTestSetBList(plist);
        getRequest().setAttribute("profileInfo",pinfo);
        
        setNextPage(Constants.TEST_RESULTS_PAGE);
        setNextPageInContext(true);
    }
    
}
