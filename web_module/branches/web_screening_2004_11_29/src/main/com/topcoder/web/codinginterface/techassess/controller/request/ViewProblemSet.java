package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.netCommon.screening.request.ScreeningGetProblemSetsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningGetProblemSetsResponse;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet;
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
    protected void techAssessProcessing() throws Exception {

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

            //need the problem type id in there so that one can hit refresh and have it work on the response.
            showProcessingPage();

            ScreeningGetProblemSetsResponse response = (ScreeningGetProblemSetsResponse)receive(5000);

            ScreeningProblemSet[] problemSets= response.getProblemSets();
            ScreeningProblemSet problems = null;
            for (int i=0; i<problemSets.length; i++) {
                if (problemSets[i].getType().intValue()==problemType) {
                    //ok, we found the set, now we need to get the actual problems
                    problems = problemSets[i];

                    //figure out where to go next if they click continue
                    if (i<problemSets.length-1) {
                        //there's another set to do, so continue goes there
                        setDefault(Constants.CONTINUE_LINK,
                                buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET,
                                        new String[] {Constants.PROBLEM_TYPE_ID},
                                        new String[] {problemSets[i+1].getType().toString()}));
                        setDefault(Constants.CONTINUE_DESC, "start " + problemSets[i+1].getProblemSetName());
                    } else {
                        //there's nothing left to do, so go to the index
                        setDefault(Constants.CONTINUE_LINK, buildProcessorRequestString(Constants.RP_INDEX, null, null));
                        setDefault(Constants.CONTINUE_DESC, "go back to the main room");
                    }
                }
            }
            if (problems!=null)
                log.debug("there are " + problems.getProblemLabels().length + " problems");

            setDefault(Constants.PROBLEMS, Arrays.asList(problems.getProblemLabels()));
            setDefault(Constants.PROBLEM_TYPE_ID, new Integer(problemType));


            closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET_RESPONSE,
                    new String[] {Constants.MESSAGE_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(problemType)}));

        }
    }

}
