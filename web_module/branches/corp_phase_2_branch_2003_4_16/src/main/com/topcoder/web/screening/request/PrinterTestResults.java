package com.topcoder.web.screening.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.screening.common.PermissionDeniedException;
import com.topcoder.web.screening.common.Constants;
import com.topcoder.web.screening.model.ProblemInfo;

import java.util.Map;
import java.util.Iterator;
import java.util.ArrayList;
import java.util.List;

public class PrinterTestResults extends TestResults {
    private static Logger log = Logger.getLogger(PrinterTestResults.class);

    public void process() throws Exception {
        //get the test results information
        super.process();

        long sessionId = Long.parseLong(getRequest().getParameter(Constants.SESSION_ID));

        //get the problem solution
        Request dataRequest = new Request();
        dataRequest.setContentHandle("sessionProblems");
        dataRequest.setProperty("sid", String.valueOf(sessionId));
        dataRequest.setProperty("uid", String.valueOf(getAuthentication().getActiveUser().getId()));
        Map resultMap = getDataAccess().getData(dataRequest);

        //get the problem statements
        if (resultMap!=null) {
            ResultSetContainer problems = (ResultSetContainer)resultMap.get("sessionProblems");
            getRequest().setAttribute("problemSolutionList", problems);
            ResultSetContainer.ResultSetRow row = null;
            List problemList = new ArrayList(problems.size());
            for (Iterator it = problems.iterator(); it.hasNext();) {
                row = (ResultSetContainer.ResultSetRow)it.next();
                long problemId = ((Long)row.getItem("problem_id").getResultData()).longValue();
                long roundId = ((Long)row.getItem("session_round_id").getResultData()).longValue();
                problemList.add(ProblemInfo.createProblemInfo(
                        getAuthentication().getActiveUser(),roundId,problemId));
            }
            getRequest().setAttribute("problemStatementList", problemList);
        }


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
}

