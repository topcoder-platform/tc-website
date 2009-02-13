package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.netCommon.screening.response.ScreeningLoginResponse;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.security.SimpleUser;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.web.codinginterface.ServerBusyException;
import com.topcoder.web.common.NavigationException;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends Base {

    protected static Logger log = Logger.getLogger(Login.class);

    protected void techAssessProcessing() throws Exception {

        String handle = null;
        String password = null;
        long companyId = 0;

        if (hasParameter(Constants.COMPANY_ID)) {
            companyId = Long.parseLong(getRequest().getParameter(Constants.COMPANY_ID));
            setDefault(Constants.COMPANY_ID, new Long(companyId));
            setCompanyId(companyId);
            loadSponsorImage();
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

            if (hasErrors()) {
                setNextPage(Constants.PAGE_LOGIN);
                setIsNextPageInContext(true);
            } else {
                ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, companyId);
                request.setServerID(ScreeningApplicationServer.WEB_SERVER_ID);

                try {
                    send(request);
                } catch (ServerBusyException e) {
                    throw new NavigationException("Sorry, the server is busy with a previous request.  " +
                            "When using this tool, please wait for a response before you attempt to proceed.");
                }

                showProcessingPage();

                ScreeningLoginResponse response = (ScreeningLoginResponse) receive(5000);


                if (response.isSuccess()) {
                    getAuthentication().login(new SimpleUser(response.getUserID(), "", ""));
                    setSessionId(response.getSessionID());
                } else {
                    addError(Constants.HANDLE, response.getMessage());
                }

                /* send them over to the login response page.  we're including the message
                 * id parameter so that we can be sure that we can accurately link the response
                 * and the response together.  we're going over the top for this because it's
                 * possible that they have two browsers logged in in the same session.  if they
                 * submitted two of these requests at the same time, we wouldn't know which response
                 * should go to which browser without the message id.
                 */
                closeProcessingPage(buildProcessorRequestString(Constants.RP_LOGIN_RESPONSE,
                        new String[]{Constants.MESSAGE_ID}, new String[]{String.valueOf(getMessageId())}));

            }
        } else {
            setNextPage(Constants.PAGE_LOGIN);
            setIsNextPageInContext(true);
        }

    }


}
