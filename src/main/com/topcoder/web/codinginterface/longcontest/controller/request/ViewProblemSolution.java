package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
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
            String round = request.getParameter(Constants.ROUND_ID);
            String coder = request.getParameter(Constants.CODER_ID);
            String problem = request.getParameter(Constants.PROBLEM_ID);
            String submissionNumber = request.getParameter(Constants.SUBMISSION_NUMBER);
            String example = "0";
            if (request.getParameter(Constants.EXAMPLE_FLAG)!=null) {
                example = request.getParameter(Constants.EXAMPLE_FLAG);
            }
            getRequest().setAttribute(Constants.EXAMPLE_FLAG, String.valueOf("1".equals(example)));
            log.debug("coder: " + coder + " user " + getUser().getId());
            String dataSource = null;
            // they can also see any solution if it's a practice round
            int roundType = ((Integer)getRequest().getAttribute(Constants.ROUND_TYPE_ID)).intValue();
            if (roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID||roundType==Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
                dataSource = DBMS.OLTP_DATASOURCE_NAME;
            } else {
                //if the results aren't final, they can see their own code, but not anyone else's.
                if (!areResultsAvailable(Long.parseLong(round))) {
                    if (getUser().getId()==Long.parseLong(coder) || getSessionInfo().isAdmin()) {
                        dataSource = DBMS.OLTP_DATASOURCE_NAME;
                    } else {
                        throw new PermissionException(getUser(), new ClassResource(this.getClass()));
                    }
                } else {
                    dataSource = DBMS.DW_DATASOURCE_NAME;
                }
            }
            Request r = new Request();
            r.setContentHandle("long_contest_submission");
            r.setProperty(Constants.CODER_ID, coder);
            r.setProperty(Constants.PROBLEM_ID, problem);
            r.setProperty(Constants.ROUND_ID, round);
            r.setProperty(Constants.SUBMISSION_NUMBER, submissionNumber);
            r.setProperty(Constants.EXAMPLE_FLAG, example);
            //caching this is a little sketchy cuz we could end up caching the transactional version.
            //but they shouldn't be different, so we'll roll the dice
            DataAccessInt dataAccess = getDataAccess(dataSource, true);
            Map m = dataAccess.getData(r);
            request.setAttribute("resultMap", m);
            request.setAttribute("mostRecent",
                    String.valueOf(isMostRecentSubmission(round, coder, problem, submissionNumber)));
            setNextPage(Constants.PAGE_PROBLEM_SOLUTION);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private boolean isMostRecentSubmission(String round, String coder, String problem, String submissionNumber) throws Exception {
        Request r = new Request();
        r.setContentHandle("long_contest_last_submission");
        r.setProperty(Constants.CODER_ID, coder);
        r.setProperty(Constants.PROBLEM_ID, problem);
        r.setProperty(Constants.ROUND_ID, round);
        r.setProperty(Constants.SUBMISSION_NUMBER, submissionNumber);
        return !((ResultSetContainer)getDataAccess().getData(r).get("long_contest_last_submission")).isEmpty();
    }
}
