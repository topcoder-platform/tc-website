package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

import java.util.Map;


public class ViewProblemSolution extends Base {
    protected static final Logger log = Logger.getLogger(ViewProblemSolution.class);

    protected void longContestProcessing() throws TCWebException {
        if (getUser().isAnonymous()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        try {
            TCRequest request = getRequest();
            Request r = new Request();
            r.setContentHandle("long_contest_submission");
            r.setProperty(Constants.CODER_ID, request.getParameter(Constants.CODER_ID));
            r.setProperty(Constants.PROBLEM_ID, request.getParameter(Constants.PROBLEM_ID));
            r.setProperty(Constants.ROUND_ID, request.getParameter(Constants.ROUND_ID));
            r.setProperty(Constants.SUBMISSION_NUMBER, request.getParameter(Constants.SUBMISSION_NUMBER));
            DataAccessInt dataAccess = getDataAccess(DBMS.DW_DATASOURCE_NAME, false);
            Map m = dataAccess.getData(r);
            request.setAttribute("resultMap", m);
            setNextPage(Constants.PAGE_PROBLEM_SOLUTION);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
