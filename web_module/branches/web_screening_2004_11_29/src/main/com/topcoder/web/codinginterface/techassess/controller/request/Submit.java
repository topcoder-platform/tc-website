package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.util.TCException;
import com.topcoder.shared.netCommon.screening.request.ScreeningSubmitRequest;
import com.topcoder.shared.netCommon.messages.Message;

import javax.jms.ObjectMessage;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:58 AM
 */
public class Submit extends Base {


    protected void businessProcessing() throws TCException {

        //todo figure out resubmits and build appropriate request
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
        request.setServerID(Constants.SERVER_ID);

        String messageId = send(request);

        Message response = receive(2000, messageId);




        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
