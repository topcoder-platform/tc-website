package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.netCommon.screening.request.ScreeningGetProblemSetsRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningGetProblemSetsResponse;
import com.topcoder.shared.util.logging.Logger;

import java.util.Arrays;
import java.util.List;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Index extends Base {

    protected static Logger log = Logger.getLogger(Index.class);

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {

            ScreeningGetProblemSetsRequest request = new ScreeningGetProblemSetsRequest();
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage();

            ScreeningGetProblemSetsResponse response = (ScreeningGetProblemSetsResponse)receive(5000);

            List sets = Arrays.asList(response.getProblemSets());
            log.debug("there are " + sets.size() + " problem sets");

            setDefault(Constants.PROBLEM_SETS, sets);
            setLanguages(getLanguages(response.getAllowedLanguages()));

            closeProcessingPage(buildProcessorRequestString(Constants.RP_INDEX_RESPONSE,
                    new String[] {Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));

        }

    }


}
