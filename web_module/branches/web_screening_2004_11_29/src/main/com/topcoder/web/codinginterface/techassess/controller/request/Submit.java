package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.shared.netCommon.screening.request.ScreeningSubmitRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningSubmitResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;

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
            int languageId = 0;
            boolean resubmit = false;
            String code = null;

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

            resubmit = (String.valueOf(true).equalsIgnoreCase(getRequest().getParameter(Constants.SUBMIT_FLAG)));

            ScreeningSubmitRequest request = new ScreeningSubmitRequest(componentId, problemTypeId, resubmit);
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
            } else if (response.getStatus()==ScreeningSubmitResponse.ERROR) {
                addError(Constants.CODE, response.getMessage());
                Problem p = new Problem();
//todo                p.setProblemComponents(new ProblemComponent[] {response.getProblemComponent()});
                setDefault(Constants.PROBLEM, new ProblemInfo(code, componentId, languageId, p, problemTypeId));
                closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_RESPONSE,
                        new String[] {Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                        new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));
            } else if (response.getStatus()==ScreeningSubmitResponse.RESUBMIT) {
                addError(Constants.CODE, response.getMessage());
                closeProcessingPage(buildProcessorRequestString(Constants.RP_SUBMIT_RESPONSE,
                        new String[] {Constants.PROBLEM_TYPE_ID, Constants.COMPONENT_ID, Constants.MESSAGE_ID,
                                      Constants.SUBMIT_FLAG},
                        new String[] {String.valueOf(problemTypeId), String.valueOf(componentId),
                                      String.valueOf(getMessageId()), String.valueOf(true)}));
            }
        }
    }
}
