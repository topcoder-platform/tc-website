package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.web.common.NavigationException;
import com.topcoder.shared.netCommon.screening.request.ScreeningSaveRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningSaveResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

/**
 * User: dok
 * Date: Jan 3, 2005
 * Time: 1:06:13 PM
 */
public class Save extends Base {

    protected void businessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[] {Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
            setIsNextPageInContext(false);
        } else {


            long componentId = 0;
            int problemTypeId = 0;
            int languageId = 0;
            String code = "";

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

            if (hasParameter(Constants.LANGUAGE_ID)) {
                languageId = Integer.parseInt(getRequest().getParameter(Constants.LANGUAGE_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            if (hasParameter(Constants.CODE))
                code = getRequest().getParameter(Constants.CODE);


            ScreeningSaveRequest request = new ScreeningSaveRequest(componentId, problemTypeId, languageId, code);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_RESPONSE,
                    new String[] {Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

            ScreeningSaveResponse response = (ScreeningSaveResponse)receive(5000);

            addError(Constants.CODE, response.getMessage());
            setDefault(Constants.PROBLEM, new ProblemInfo(code, componentId, languageId, getProblem(), problemTypeId));

            closeProcessingPage();

        }


    }

}
