package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.techassess.model.ProblemInfo;
import com.topcoder.shared.netCommon.screening.request.ScreeningOpenComponentForCodingRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningOpenComponentResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

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

            ScreeningOpenComponentForCodingRequest request = new ScreeningOpenComponentForCodingRequest(componentId, problemTypeId);
            request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);
            request.setSessionID(getSessionId());

            send(request);

            showProcessingPage();

            ScreeningOpenComponentResponse response = (ScreeningOpenComponentResponse) receive(5000);

            ProblemInfo problem = new ProblemInfo(StringUtils.checkNull(response.getCode()), componentId,
                    response.getLanguageID().intValue(), response.getProblem(), problemTypeId);
            problem.setStartTime(response.getOpenTime());
            problem.setTime(response.getLength());

            setDefault(Constants.PROBLEM, problem);

            closeProcessingPage(buildProcessorRequestString(Constants.RP_TEST_RESPONSE,
                    new String[]{Constants.MESSAGE_ID, Constants.COMPONENT_ID, Constants.PROBLEM_TYPE_ID},
                    new String[]{String.valueOf(getMessageId()), String.valueOf(componentId), String.valueOf(problemTypeId)}));

        }


    }

    private static final String SHORT_CONTENT =
        "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">" +
        "<html>" +
        "<head>" +
        "<title>Technical Assessment</title>" +
        "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" >" +
        "<link type=\"text/css\" rel=\"stylesheet\" href=\"/css/screening.css\" >" +
        "</head>" +
        "<body>" +
        "<table class=bodyCenter cellspacing=0 cellpadding=0>" +
        "<tr>" +
          " <td align=center>" +
            " <table cellspacing=0 cellpadding=0 class=bodyTable>" +
              " <tr>" +
                " <td><img src=\"/i/corp/screening/bodyTL.gif\" alt=\"\"/></td>" +
                " <td class=bodyT>&#160;</td>" +
                " <td><img src=\"/i/corp/screening/bodyTR.gif\" alt=\"\"/></td>" +
              " </tr>" +
              " <tr>" +
                " <td class=bodyL>&#160;</td>" +
                " <td class=bodyContent>" +
                " <br /><br />" +
                  " <table cellspacing=0 cellpadding=5 border=0 class=processingTable>" +
                    " <tr>" +
                      " <td><p class=pC><span class=bodySmallTitle>Processing...</span></p></td>" +
                      " <td><img src=\"/i/corp/screening/processing.gif\" alt=\"\"/></td>" +
                    " </tr>" +
                  " </table>" +
                  " <br /><br />" +
                " </td>" +
                " <td class=bodyR>&#160;</td>" +
              " </tr>" +
              " <tr>" +
                " <td><img src=\"/i/corp/screening/bodyBL.gif\" alt=\"\"/></td>" +
                " <td class=bodyB>&#160;</td>" +
                " <td><img src=\"/i/corp/screening/bodyBR.gif\" alt=\"\"/></td>" +
              " </tr>" +
            " </table>" +
          " </td>" +
        " </tr>" +
        "</table>" +
        "</body>" +
        "</html>";


    protected String getProcessingPageContent() {
        return SHORT_CONTENT;
    }


}


