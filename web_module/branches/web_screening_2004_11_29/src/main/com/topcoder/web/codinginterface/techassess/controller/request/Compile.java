package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningCompileRequest;
import com.topcoder.shared.netCommon.messages.Message;

import javax.jms.ObjectMessage;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:34 AM
 */
public class Compile extends Base {

    protected void businessProcessing() throws Exception {

        long componentId = 0;
        int problemTypeId = 0;
        int languageId = 0;
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


        ScreeningCompileRequest request = new ScreeningCompileRequest(componentId, problemTypeId,
                languageId, code);
        request.setServerID(Constants.SERVER_ID);

        String messageId = send(request);

        Message response = receive(2000, messageId);





        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
