package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningSubmitRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningSubmitResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:58 AM
 */
public class Submit extends Base {

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
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

            ScreeningSubmitRequest request = new ScreeningSubmitRequest(componentId, problemTypeId);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage();

            ScreeningSubmitResponse response = (ScreeningSubmitResponse)receive(5000);

            if (response.getStatus()==ScreeningSubmitResponse.SUCCESS) {
                //go to the problem set
                closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET,
                        new String[] {Constants.PROBLEM_TYPE_ID},
                        new String[] {String.valueOf(problemTypeId)}));
                setIsNextPageInContext(false);
            } else if (response.getStatus()==ScreeningSubmitResponse.ERROR) {
                throw new NavigationException(response.getMessage(),
                        buildProcessorRequestString(Constants.RP_VIEW_PROBLEM,
                        new String[] {Constants.PROBLEM_TYPE_ID, Constants.COMPONENT_ID},
                        new String[] {String.valueOf(problemTypeId),
                                      String.valueOf(componentId)}));
            } else if (response.getStatus()==ScreeningSubmitResponse.RESUBMIT) {
                //ask them if they really want to resubmit
                //todo

            }
        }
    }
}
