package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningLoginResponse;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.security.SimpleUser;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends Base {

    protected static Logger log = Logger.getLogger(Login.class);

    protected void businessProcessing() throws Exception {

        String handle = null;
        String password = null;
        long companyId = 0;

        if (hasParameter(Constants.COMPANY_ID)) {
            companyId = Long.parseLong(getRequest().getParameter(Constants.COMPANY_ID));
            setDefault(Constants.COMPANY_ID, new Long(companyId));
        } else {
            throw new NavigationException("Invalid request, missing required parameter.");
        }

        if (hasParameter(Constants.HANDLE)) {
            handle = getRequest().getParameter(Constants.HANDLE);
            setDefault(Constants.HANDLE, handle);

            if (hasParameter(Constants.PASSWORD)) {
                password = getRequest().getParameter(Constants.PASSWORD);
            } else {
                addError(Constants.PASSWORD, "Please enter your password");
            }

            ScreeningLoginResponse response = null;
            if (hasErrors()) {
                setNextPage(Constants.PAGE_LOGIN);
                setIsNextPageInContext(true);
            } else {

                ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, companyId);
                request.setServerID(Constants.SERVER_ID);

                log.debug("send message");
                String messageId = send(request);
                log.debug("sent message " + messageId);

                log.debug(Thread.currentThread().toString());
                response = (ScreeningLoginResponse)receive(5000, messageId);
                log.debug("response " + response);

                if (response.isSuccess()) {
                    log.debug("logged in " + response.getUserID() + " successfully");
                    getAuthentication().login(new SimpleUser(response.getUserID(), "", ""));
                    setNextPage(Constants.PAGE_INDEX);
                    setIsNextPageInContext(true);

                } else {
                    addError(Constants.HANDLE, response.getMessage());
                    setNextPage(Constants.PAGE_LOGIN);
                    setIsNextPageInContext(true);
                }
            }
        } else {
            setNextPage(Constants.PAGE_LOGIN);
            setIsNextPageInContext(true);
        }

    }

}
