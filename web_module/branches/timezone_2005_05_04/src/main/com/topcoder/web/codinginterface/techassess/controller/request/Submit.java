package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningSubmitRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningSubmitResponse;
import com.topcoder.shared.problem.Problem;
import com.topcoder.shared.problem.ProblemComponent;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.NavigationException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:58 AM
 */
public class Submit extends Base {
    protected static final Logger log = Logger.getLogger(Submit.class);

    protected void techAssessProcessing() throws Exception {

        if (getUser().isAnonymous()) {
            setNextPage(buildProcessorRequestString(Constants.RP_LOGIN,
                    new String[]{Constants.COMPANY_ID}, new String[]{String.valueOf(getCompanyId())}));
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

            if (hasParameter(Constants.ENCODED)) {
                code = URLDecoder.decode(code, "UTF-8");
            }

            resubmit = (String.valueOf(true).equalsIgnoreCase(getRequest().getParameter(Constants.SUBMIT_FLAG)));
            //log.debug("resubmit is " + resubmit);

            ScreeningSubmitRequest request = new ScreeningSubmitRequest(componentId, problemTypeId, resubmit);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            try {
                send(request);
            } catch (ServerBusyException e) {
                throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                        "When using this tool, please wait for a response before you attempt to proceed.");
            }

            showProcessingPage();

            ScreeningSubmitResponse response = (ScreeningSubmitResponse) receive(10000);

            if (response.getStatus() == ScreeningSubmitResponse.SUCCESS) {
                //go to the problem set
                closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_SET,
                        new String[]{Constants.PROBLEM_TYPE_ID},
                        new String[]{String.valueOf(problemTypeId)}));
            } else if (response.getStatus() == ScreeningSubmitResponse.ERROR) {
                setUserMessage(response.getMessage());
                Problem p = new Problem();
                p.setProblemComponents(new ProblemComponent[]{response.getProblemComponent()});
                setDefault(Constants.PROBLEM, new ProblemInfo(code, componentId, languageId, p, problemTypeId));
                closeProcessingPage(buildProcessorRequestString(Constants.RP_VIEW_PROBLEM_RESPONSE,
                        new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                        new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));
            } else if (response.getStatus() == ScreeningSubmitResponse.RESUBMIT) {
                //encode code string so that it fits in a hidden field
                code = URLEncoder.encode(code,"UTF-8");

                setUserMessage(response.getMessage());
                setDefault(Constants.CODE, code);
                setDefault(Constants.LANGUAGE_ID, String.valueOf(languageId));
                setDefault(Constants.PROBLEM_TYPE_ID, String.valueOf(problemTypeId));
                setDefault(Constants.COMPONENT_ID, String.valueOf(componentId));
                setDefault(Constants.SUBMIT_FLAG, String.valueOf(true));
                //log.debug("defaults: " + defaults);
                closeProcessingPage(buildProcessorRequestString(Constants.RP_SUBMIT_RESPONSE,
                        new String[]{Constants.MESSAGE_ID},
                        new String[]{String.valueOf(getMessageId())}));
            }
        }
    }
}
