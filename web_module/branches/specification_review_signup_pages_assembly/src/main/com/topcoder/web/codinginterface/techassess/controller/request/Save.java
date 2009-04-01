package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningSaveRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningSaveResponse;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.web.common.NavigationException;

/**
 * User: dok
 * Date: Jan 3, 2005
 * Time: 1:06:13 PM
 */
public class Save extends Base {

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
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
                //log.debug("language: " + getRequest().getParameter(Constants.LANGUAGE_ID));
                languageId = Integer.parseInt(getRequest().getParameter(Constants.LANGUAGE_ID).trim());
            } else {
                throw new NavigationException("Invalid Request, missing parameter");
            }

            if (hasParameter(Constants.CODE))
                code = getRequest().getParameter(Constants.CODE);

            //log.debug("language: " + languageId);

            ScreeningSaveRequest request = new ScreeningSaveRequest(componentId, problemTypeId, languageId, code);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            try {
                send(request);
            } catch (ServerBusyException e) {
                throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                        "When using this tool, please wait for a response before you attempt to proceed.");
            }

            //log.debug("problemtype : " + problemTypeId);

            showProcessingPage();

            ScreeningSaveResponse response = (ScreeningSaveResponse) receive(10000);

            setUserMessage(response.getMessage());

            Problem p = new Problem();
            p.setProblemComponents(new ProblemComponent[]{response.getProblemComponent()});


            ProblemInfo problem = new ProblemInfo(code, componentId, languageId, p, problemTypeId);
            problem.setStartTime(response.getOpenTime());
            problem.setTime(response.getLength());

            setDefault(Constants.PROBLEM, problem);

            closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_RESPONSE,
                    new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

        }


    }

}
