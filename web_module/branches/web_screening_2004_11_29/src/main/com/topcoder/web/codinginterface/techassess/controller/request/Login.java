package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;

import javax.jms.ObjectMessage;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends Base {


    protected void businessProcessing() throws Exception {

        String handle = null;
        String password = null;
        long companyId = 0;

        if (hasParameter(Constants.HANDLE)) {
            handle = getRequest().getParameter(Constants.HANDLE).trim();
        } else {
            addError(Constants.HANDLE, "Please enter your user name");
        }

        if (hasParameter(Constants.PASSWORD)) {
            password = getRequest().getParameter(Constants.PASSWORD);
        } else {
            addError(Constants.PASSWORD, "Please enter your password");
        }

        if (hasParameter(Constants.COMPANY_ID)) {
            companyId = Long.parseLong(getRequest().getParameter(Constants.COMPANY_ID));
        } else {
            throw new NavigationException("Invalid request, missing required parameter.");
        }

        ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, companyId);
        request.setServerID(Constants.SERVER_ID);

        log.debug("send message");
        String messageId = send(request);
        log.debug("sent message " + messageId);

        log.debug(Thread.currentThread().toString());
        ObjectMessage response = receive(2000, messageId);
        log.debug("response " + response);

        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
