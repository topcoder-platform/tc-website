package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.List;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.algorithm.CodingConstants;
import com.topcoder.web.winformula.algorithm.services.SubmissionHistoryItem;
import com.topcoder.web.winformula.algorithm.services.WinFormulaServicesImpl;


public class ManageMyAlgorithms extends Base {
    protected static final Logger log = Logger.getLogger(ManageMyAlgorithms.class);
    private static final WinFormulaServicesImpl services = new WinFormulaServicesImpl();

    protected void longContestProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            TCRequest request = getRequest();
            if (isUserRegisteredInContest(getContestID(), getContestID())) {
                request.setAttribute("message", "You need to be registered in order to manage your algorithms");
                setNextPage(CodingConstants.PAGE_REG_NEEDED);
                setIsNextPageInContext(true);
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
