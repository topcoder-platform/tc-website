package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.netCommon.screening.request.ScreeningGetProblemSetsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningGetProblemSetsResponse;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemLabel;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import java.util.Arrays;
import java.util.List;

/**
 * User: dok
 * Date: Dec 22, 2004
 * Time: 3:13:10 PM
 */
public class ViewProblemSet extends Base {

    /* we really just need to load up the problem sets for this request
     * if it's too slow making them distinct requests, we can starting throwing
     * the problem sets in the session so we don't have to retrieve them.
     */
    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            int problemType = 0;
            if (hasParameter(Constants.PROBLEM_TYPE_ID)) {
                problemType = Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_TYPE_ID));
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            ScreeningGetProblemSetsRequest request = new ScreeningGetProblemSetsRequest();
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET_RESPONSE,
                    new String[] {Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));

            ScreeningGetProblemSetsResponse response = (ScreeningGetProblemSetsResponse)receive(5000);

            ScreeningProblemSet[] problemSets= response.getProblemSets();
            List problems = null;
            for (int i=0; i<problemSets.length; i++) {
                if (problemSets[i].getType().intValue()==problemType) {
                    //ok, we found the set, now we need to get the actual problems
                    problems = Arrays.asList(problemSets[i].getProblemLabels());
                }
            }
            log.debug("there are " + problems.size() + " problems");

            setDefault(Constants.PROBLEMS, problems);
            setDefault(Constants.PROBLEM_TYPE_ID, new Integer(problemType));

            closeProcessingPage();

        }
    }

}
