package com.topcoder.web.screening.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.common.Util;
import com.topcoder.web.screening.model.ProblemInfo;
import com.topcoder.web.screening.model.SubmissionInfo;
import com.topcoder.web.common.TCWebException;

import javax.servlet.http.HttpUtils;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class PrinterTestResults extends TestResults {
    private static Logger log = Logger.getLogger(PrinterTestResults.class);

    protected void businessProcessing() throws TCWebException {
        //get the test results information
        super.businessProcessing();

        long sessionId = Long.parseLong(getRequest().getParameter(Constants.SESSION_ID));
        try {
            //get the problem solutions
            log.debug("set a: " + problemSetAList);
            getRequest().setAttribute("problemSolutionAList", getSubmissions(problemSetAList, sessionId,
                    Constants.PROBLEM_TYPE_TEST_SET_A_ID));
            getRequest().setAttribute("problemSolutionBList", getSubmissions(problemSetBList, sessionId,
                    Constants.PROBLEM_TYPE_TEST_SET_B_ID));

            //get notes
            Request dr = new Request();
            dr.setProperties(HttpUtils.parseQueryString(getRequest().getQueryString()));
            dr.setContentHandle("noteList");
            dr.setProperty("uid", String.valueOf(getUser().getId()));
            dr.setProperty("cid", String.valueOf(cinfo.getUserId()));


            Map map = Util.getDataAccess().getData(dr);

            if (map != null) {
                ResultSetContainer result = (ResultSetContainer) map.get("candidateInfo");
                if (result.getRowCount() == 0) {
                    throw new PermissionDeniedException(getUser(),
                            "User not authorized to view information about candidate: " +
                            dr.getProperty("cid") == null ? "?" : dr.getProperty("cid"));
                }
                result = (ResultSetContainer) map.get("noteList");
                getRequest().setAttribute("noteList", result);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }
        setNextPage(Constants.PRINTER_RESULTS_PAGE);
        setIsNextPageInContext(true);
    }


    private List getSubmissions(List problemList, long sessionId, int problemTypeId) throws Exception {
        List solutionList = new ArrayList(problemList.size());
        SubmissionInfo temp = null;
        ProblemInfo problem = null;
        for (int i = 0; i < problemList.size(); i++) {
            problem = (ProblemInfo) problemList.get(i);
            temp = new SubmissionInfo(getUser(),
                    sessionId,
                    problem.getRoundId().longValue(),
                    problem.getProblemId().longValue(),
                    problemTypeId);
            solutionList.add(temp);
        }
        return solutionList;
    }

}

