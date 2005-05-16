package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningOpenComponentForCodingRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningOpenComponentResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class ViewProblem extends Base {


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

            ScreeningOpenComponentForCodingRequest request = new ScreeningOpenComponentForCodingRequest(componentId, problemTypeId);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            try {
                send(request);
            } catch (ServerBusyException e) {
                throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                        "When using this tool, please wait for a response before you attempt to proceed.");
            }

            showProcessingPage();

            ScreeningOpenComponentResponse response = (ScreeningOpenComponentResponse) receive(10000);

            ProblemInfo problem = new ProblemInfo(StringUtils.checkNull(response.getCode()), componentId,
                    response.getLanguageID().intValue(), response.getProblem(), problemTypeId);
            problem.setStartTime(response.getOpenTime());
            problem.setTime(response.getLength());

            setDefault(Constants.PROBLEM, problem);

            closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_RESPONSE,
                    new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

        }


    }

}
