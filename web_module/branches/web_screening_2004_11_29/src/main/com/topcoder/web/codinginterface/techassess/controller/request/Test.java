package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.web.codinginterface.CodingInterfaceConstants;
import com.topcoder.shared.netCommon.screening.request.ScreeningOpenComponentForCodingRequest;
import com.topcoder.shared.netCommon.screening.request.ScreeningTestRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningOpenComponentResponse;
import com.topcoder.shared.netCommon.screening.response.ScreeningTestResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import java.util.ArrayList;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:41 AM
 */
public class Test extends Base {

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {


            long componentId = 0;
            int problemTypeId = 0;

            if (hasParameter(Constants.COMPONENT_ID)) {
                componentId = Long.parseLong(getRequest().getParameter(Constants.COMPONENT_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            if (hasParameter(Constants.PROBLEM_TYPE_ID)) {
                problemTypeId = Integer.parseInt(getRequest().getParameter(Constants.PROBLEM_TYPE_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            ArrayList arguments = new ArrayList();
            String arg = null;
            int i=0;
            do {
                arg = getRequest().getParameter(CodingInterfaceConstants.TEST_ARGUMENT_PREFIX+i);
                arguments.add(arg);
                i++;
            } while (arg!=null);

            ScreeningTestRequest request = new ScreeningTestRequest(arguments, componentId, problemTypeId);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage(Constants.SHORT_CONTENT);

            ScreeningTestResponse response = (ScreeningTestResponse) receive(5000);

            setDefault(CodingInterfaceConstants.MESSAGE, response.getMessage());

            closeProcessingPage(buildProcessorRequestString(Constants.RP_TEST_RESPONSE,
                    new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

        }


    }


}


