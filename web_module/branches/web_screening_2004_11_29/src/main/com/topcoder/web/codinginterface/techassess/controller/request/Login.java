package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.QueueMessageReceiver;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.screening.common.ScreeningContext;
import com.topcoder.shared.util.DBMS;

import javax.jms.ObjectMessage;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.ServletException;

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


        Context context = null;
        try {
            context = ScreeningContext.getJMSContext();
        } catch (NamingException e) {
            throw new ServletException(e);
        }


        QueueMessageSender sender = new QueueMessageSender(ScreeningApplicationServer.JMS_FACTORY,
                DBMS.REQUEST_QUEUE, context);
        sender.setPersistent(true);
        sender.setDBPersistent(false);
        sender.setFaultTolerant(false);

        QueueMessageReceiver receiver = new QueueMessageReceiver(ScreeningApplicationServer.JMS_FACTORY,
                DBMS.RESPONSE_QUEUE, context, "server="+Constants.SERVER_ID);
        ObjectMessage resp = receiver.getMessage(100);
        log.debug("got " + resp);




        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
