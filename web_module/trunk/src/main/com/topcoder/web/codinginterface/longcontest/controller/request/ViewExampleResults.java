package com.topcoder.web.codinginterface.longcontest.controller.request;

import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.longcontest.Constants;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;

import java.util.Map;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 16, 2006
 */
public class ViewExampleResults extends Base {
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
            log.debug("coder: " + coder + " user " + getUser().getId());
            String dataSource = null;
            // they can also see any solution if it's a practice round
            int roundType = ((Integer)getRequest().getAttribute(Constants.ROUND_TYPE_ID)).intValue();
            if (getUser().getId()==Long.parseLong(coder) ||
                    isRoundOver(Long.parseLong(round)) ||
                    roundType==Constants.LONG_PRACTICE_ROUND_TYPE_ID) {

            } else {
                throw new PermissionException(getUser(), new ClassResource(this.getClass()),
                        new TCWebException("Can not view other's example data until the contest is over."));
            }
            Request r = new Request();
            r.setContentHandle("long_contest_example_results");
            r.setProperty(Constants.CODER_ID, coder);
            r.setProperty(Constants.ROUND_ID, round);
            r.setProperty(Constants.PROBLEM_ID, problem);

            DataAccessInt dataAccess = getDataAccess();
            Map m = dataAccess.getData(r);
            request.setAttribute("resultMap", m);
            request.setAttribute(Constants.CODER_ID, coder);
            setNextPage(Constants.PAGE_VIEW_EXAMPLE_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

