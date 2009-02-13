package com.topcoder.web.winformula.controller.request;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;


public class SummaryReport extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(SummaryReport.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            ResultSetContainer lastActiveRound = getService().getLastActiveRound(getContestID());
            ResultSetContainer report = getService().getSummaryReport(getContestID(), lastActiveRound.getIntItem(0, "round_id"));
            request.setAttribute("report", report); 
            request.setAttribute("lastActiveRound", lastActiveRound);
            setNextPage("/summaryReport.jsp");
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
