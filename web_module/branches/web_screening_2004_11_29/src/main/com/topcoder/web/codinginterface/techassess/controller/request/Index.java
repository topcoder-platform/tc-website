package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.netCommon.screening.request.ScreeningGetProblemSetsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningGetProblemSetsResponse;
import com.topcoder.shared.netCommon.screening.response.data.ScreeningProblemSet;
import com.topcoder.shared.util.logging.Logger;

import java.util.ArrayList;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Index extends Base {

    protected static Logger log = Logger.getLogger(Index.class);

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            ScreeningGetProblemSetsRequest request = new ScreeningGetProblemSetsRequest();
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage(buildProcessorRequestString(Constants.RP_INDEX_RESPONSE,
                    new String[] {Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));

            ScreeningGetProblemSetsResponse response = (ScreeningGetProblemSetsResponse)receive(5000);

            ScreeningProblemSet[] problemSets = response.getProblemSets();
            ArrayList sets = new ArrayList();
            for (int i=0; i<problemSets.length; i++) {
                sets.add(problemSets[i]);
            }
            log.debug("there are " + sets.size() + " problem sets");

            setDefault(Constants.PROBLEM_SETS, sets);
            setDefault(Constants.LANGUAGES, getLanguages(response.getAllowedLanguages()));

            closeProcessingPage();

        }

    }


}
