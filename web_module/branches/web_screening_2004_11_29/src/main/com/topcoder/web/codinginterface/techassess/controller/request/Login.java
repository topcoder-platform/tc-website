package com.topcoder.web.codinginterface.techassess.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.codinginterface.techassess.Constants;
import com.topcoder.shared.netCommon.screening.request.ScreeningLoginRequest;
import com.topcoder.shared.messaging.QueueMessageSender;
import com.topcoder.shared.messaging.QueueMessageReceiver;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.screening.common.ScreeningApplicationServer;
import com.topcoder.shared.screening.common.ScreeningContext;

import javax.naming.Context;
import javax.jms.ObjectMessage;
import java.util.HashMap;

/**
 * User: dok
 * Date: Dec 6, 2004
 */
public class Login extends BaseProcessor {


    protected void businessProcessing() throws Exception {

        String handle = null;
        if (hasParameter(Constants.HANDLE)) {
            handle = getRequest().getParameter(Constants.HANDLE).trim();
        } else {
            addError(Constants.HANDLE, "Please enter your user name");
        }
        String password = null;
        if (hasParameter(Constants.PASSWORD)) {
            password = getRequest().getParameter(Constants.PASSWORD);
        } else {
            addError(Constants.PASSWORD, "Please enter your password");
        }
        long companyId = 0;
        if (hasParameter(Constants.COMPANY_ID)) {
            companyId = Long.parseLong(getRequest().getParameter(Constants.COMPANY_ID));
        } else {
            throw new NavigationException("Invalid request, missing required parameter.");
        }

        ScreeningLoginRequest request = new ScreeningLoginRequest(handle, password, companyId);

        log.debug("instantiate queue message sender");
        String jmsFactory = ScreeningApplicationServer.JMS_FACTORY;
        String queueName = ScreeningApplicationServer.EVENT_QUEUE;
        Context context = ScreeningContext.getJMSContext();

        QueueMessageSender qms = new QueueMessageSender(jmsFactory, queueName, context);
        qms.setPersistent(false);
        qms.setDBPersistent(false);
        qms.setFaultTolerant(false);
        log.debug("send message");
        String messageId = qms.sendMessageGetID(new HashMap(), request);
        log.debug("sent message " + messageId);

        QueueMessageReceiver qmr = new QueueMessageReceiver(jmsFactory, queueName, context, messageId);
        ObjectMessage response = qmr.getMessage(2000);
        log.debug("response " + response);

        setNextPage(Constants.PAGE_INDEX);
        setIsNextPageInContext(true);
    }

}
