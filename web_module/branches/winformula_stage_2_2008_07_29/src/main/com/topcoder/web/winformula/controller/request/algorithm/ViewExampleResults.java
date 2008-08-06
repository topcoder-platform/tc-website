/*
 * ViewExampleResults
 * 
 * Created Aug 6, 2008
 */
package com.topcoder.web.winformula.controller.request.algorithm;

import java.util.Arrays;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.server.ejb.TestServices.LongContestServicesLocator;
import com.topcoder.server.ejb.TestServices.LongTestResult;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCRequest;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.winformula.Constants;
import com.topcoder.web.winformula.algorithm.CodingConstants;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
public class ViewExampleResults extends Base {
    protected static final Logger log = Logger.getLogger(ViewExampleResults.class);

    protected void longContestProcessing() throws TCWebException {
        try {
            TCRequest request = getRequest();
            int coderId = getUserID();
            int roundId = Integer.parseInt(request.getParameter(CodingConstants.ROUND_ID));
            log.debug("coder: " + coderId + " user " + getUser().getId());
            LongTestResult[] results = LongContestServicesLocator.getService().getLongTestResults(roundId, coderId, Constants.COMPONENT_ID_DEFAULT, LongContestServices.LONG_TEST_RESULT_TYPE_NON_SYSTEM);
            request.setAttribute(CodingConstants.CODER_ID, new Integer(coderId));
            request.setAttribute("results", Arrays.asList(results));
            setNextPage(Constants.PAGE_VIEW_EXAMPLE_RESULTS);
            setIsNextPageInContext(true);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}

