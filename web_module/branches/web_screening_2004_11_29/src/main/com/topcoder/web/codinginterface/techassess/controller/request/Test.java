package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningSubmitRequest;
import com.topcoder.shared.netCommon.screening.request.ScreeningTestRequest;
import com.topcoder.shared.netCommon.messages.Message;
import com.topcoder.shared.util.TCException;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;

import javax.jms.ObjectMessage;
import java.util.ArrayList;

/**
 * User: dok
 * Date: Dec 6, 2004
 * Time: 11:17:41 AM
 */
public class Test extends Base {


    protected void techAssessProcessing() throws TCException {


        long componentId = 0;
        int problemTypeId = 0;
        ArrayList args = null;

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

        //todo get the args



        ScreeningTestRequest request = new ScreeningTestRequest(args, componentId, problemTypeId);
        request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);

        send(request);

        Message response = receive(2000);


        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
