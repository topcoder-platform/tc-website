package com.topcoder.web.corp.controller.request.screening;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.corp.common.Constants;
import com.topcoder.web.corp.common.PermissionDeniedException;
import com.topcoder.web.corp.common.ScreeningException;
import com.topcoder.web.corp.common.Util;
import com.topcoder.web.corp.model.*;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;

import javax.servlet.http.HttpUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Date;

/**
 * Processing for the Test Results page.
 * @author Porgery
 */
public class TestResults extends BaseProcessor {
    private final static Logger log = Logger.getLogger(TestResults.class);

    protected CandidateInfo cinfo = new CandidateInfo();
    protected List problemSetAList = null;
    protected List problemSetBList = null;

    /** Implements the processing step.
     * @throws com.topcoder.web.common.TCWebException
     */
    protected void businessProcessing() throws TCWebException {
        try {
            DataAccessInt dAccess = Util.getDataAccess();
            Request dr = new Request();
            dr.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
            dr.setContentHandle("testResults");
            dr.setProperty("uid", String.valueOf(getUser().getId()));
            Map map = dAccess.getData(dr);
            if (map == null)
                throw new ScreeningException("getData failed!");

            ResultSetContainer access = (ResultSetContainer) map.get("checkSessionAccess");
            if (access.isEmpty()) {
                throw new PermissionDeniedException(
                        "You are not authorized to view information about this session.");
            }
            ResultSetContainer result = (ResultSetContainer) map.get("sessionInfo");
            TestResultsInfo tinfo = new TestResultsInfo();
            ProfileInfo pinfo = new ProfileInfo();
            pinfo.setHasTestSetA(result.getItem(0, "session_round_id").getResultData() != null);
            problemSetAList = new ArrayList();
            pinfo.setTestSetAList(problemSetAList);
            if (pinfo.hasTestSetA()) {
                String roundId = result.getItem(0, "contest_round_id").toString();
                String divisionId = result.getItem(0, "contest_division_id").toString();
                dAccess = Util.getDataAccess(Constants.DW_DATA_SOURCE, true);
                dr = new Request();
                dr.setContentHandle("roundProblemStats");
                dr.setProperty("rd", roundId);
                dr.setProperty("dn", divisionId);
                Map dwMap = dAccess.getData(dr);
                if (map == null)
                    throw new ScreeningException("getData failed!");
                tinfo.setProblemSetAResults((ResultSetContainer) map.get("testSetAResults"));
                tinfo.setProblemSetATCStats((ResultSetContainer) dwMap.get("roundProblemStats"));
                pinfo.setTestSetAName(result.getItem(0, "session_round_name").toString());

                ResultSetContainer dwResult = (ResultSetContainer) map.get("testSetAResults");
                for (int i = 0; i < dwResult.size(); i++) {
                    problemSetAList.add(
                            ProblemInfo.createProblemInfo(
                                    getUser(),
                                    Long.parseLong(dwResult.getItem(i, "session_round_id").toString()),
                                    Long.parseLong(dwResult.getItem(i, "problem_id").toString())));
                }
            }

            TestSessionInfo sessionInfo = new TestSessionInfo();
            sessionInfo.setBeginDate(((Date) result.getItem(0, "begin_time").getResultData()));
            sessionInfo.setEndDate(((Date) result.getItem(0, "end_time").getResultData()));
            getRequest().setAttribute("testSessionInfo", sessionInfo);

            cinfo = new CandidateInfo();
            cinfo.setUserName(result.getItem(0, "handle").toString());
            cinfo.setUserId(Long.valueOf(result.getItem(0, "user_id").toString()));
            getRequest().setAttribute("candidateInfo", cinfo);

            tinfo.setSessionId(Long.parseLong(getRequest().getParameter(Constants.SESSION_ID)));
            Date curr = (Date) result.getItem(0, "current_time").getResultData();
            Date maxEnd = (Date) result.getItem(0, "max_end_time").getResultData();
            Date end = (Date) result.getItem(0, "end_time").getResultData();
            tinfo.setSessionComplete(Math.min(maxEnd.getTime(), end.getTime()) < curr.getTime());
            tinfo.setProblemSetBCount(Integer.parseInt(result.getItem(0, "num_set_b").toString()));
            tinfo.setProblemSetBResults((ResultSetContainer) map.get("testSetBResults"));
            getRequest().setAttribute("testResultsInfo", tinfo);

            pinfo.setProfileName(result.getItem(0, "session_profile_desc").toString());

            problemSetBList = new ArrayList();
            ResultSetContainer resultB = (ResultSetContainer) map.get("testSetBResults");
            for (int i = 0; i < resultB.size(); i++) {
                problemSetBList.add(
                        ProblemInfo.createProblemInfo(
                                getUser(),
                                Long.parseLong(resultB.getItem(i, "session_round_id").toString()),
                                Long.parseLong(resultB.getItem(i, "problem_id").toString())));
            }
            pinfo.setTestSetBList(problemSetBList);
            getRequest().setAttribute("profileInfo", pinfo);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage(Constants.TEST_RESULTS_PAGE);
        setIsNextPageInContext(true);
    }

}
