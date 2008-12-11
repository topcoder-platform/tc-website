package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.List;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.SubmissionHistoryItem;
import com.topcoder.web.winformula.algorithm.services.WinFormulaServicesImpl;
import com.topcoder.web.winformula.controller.request.AlgorithmBase;


public class ManageMyAlgorithms extends AlgorithmBase {
    protected static final Logger log = Logger.getLogger(ManageMyAlgorithms.class);
    private static final WinFormulaServicesImpl services = new WinFormulaServicesImpl();

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            if (!isUserRegisteredInContest(getContestID(), getUserID())) {
                registrationNeeded("You need to be registered in order to manage your algorithms");
                return;
            }
            generateRounds();
            //Get user submissions
            List<SubmissionHistoryItem> rsc = services.getSubmissionHistory(getContestID(), getUserID());
            request.setAttribute("submissions", rsc);
            setNextPage(CodingConstants.PAGE_MY_ALGOS);
            setIsNextPageInContext(true);
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
