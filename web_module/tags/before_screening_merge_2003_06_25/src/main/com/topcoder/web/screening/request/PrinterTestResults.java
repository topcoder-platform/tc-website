package com.topcoder.web.screening.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.SubmissionInfo;

import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class PrinterTestResults extends TestResults {
    private static Logger log = Logger.getLogger(PrinterTestResults.class);

    public void process() throws Exception {
        //get the test results information
        super.process();

        long sessionId = Long.parseLong(getRequest().getParameter(Constants.SESSION_ID));

        //get the problem solutions
        getRequest().setAttribute("problemSolutionAList", getSubmissions(problemSetAList, sessionId,
                Constants.PROBLEM_TYPE_TEST_SET_A_ID));
        getRequest().setAttribute("problemSolutionBList", getSubmissions(problemSetBList, sessionId,
                Constants.PROBLEM_TYPE_TEST_SET_B_ID));

        //get notes
        Request dr = new Request();
        dr.setProperties(getParameterMap());
        dr.setContentHandle("noteList");
        dr.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        dr.setProperty("cid", String.valueOf(cinfo.getUserId()));


        Map map = getDataAccess().getData(dr);

        if (map != null) {
            ResultSetContainer result = (ResultSetContainer) map.get("candidateInfo");
            if (result.getRowCount() == 0) {
                throw new PermissionDeniedException(getAuthentication().getActiveUser(),
                        "User not authorized to view information about candidate: " +
                        dr.getProperty("cid") == null ? "?" : dr.getProperty("cid"));
            }
            result = (ResultSetContainer) map.get("noteList");
            getRequest().setAttribute("noteList", result);
        }
        setNextPage(Constants.PRINTER_RESULTS_PAGE);
        setNextPageInContext(true);
    }


    private List getSubmissions(List problemList, long sessionId, int problemTypeId) throws Exception {
        List solutionList = new ArrayList(problemList.size());
        SubmissionInfo temp = null;
        ProblemInfo problem = null;
        for (int i=0; i<problemList.size(); i++) {
            problem = (ProblemInfo)problemList.get(i);
            temp = new SubmissionInfo(getAuthentication().getActiveUser(),
                    sessionId,
                    problem.getRoundId().longValue(),
                    problem.getProblemId().longValue(),
                    problemTypeId);
            solutionList.add(temp);
        }
        return solutionList;
    }

}

