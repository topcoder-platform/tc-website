package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.tc.Constants;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.DBMS;

import java.util.TreeMap;
import java.util.Enumeration;
import java.util.Map;
import java.util.Iterator;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 1, 2005
 */
public abstract class BaseSubmitTravelInfo extends BaseProcessor {

    protected void businessProcessing() throws TCWebException {
        try {

            TreeMap questions = new TreeMap();
            TreeMap answers = new TreeMap();

            Enumeration parameterNames = getRequest().getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String parameterName = parameterNames.nextElement().toString();
                log.debug("parameter: " + parameterName);
                String parameterValue = getRequest().getParameter(parameterName);
                if (parameterName.startsWith(Constants.QUESTION_PREFIX)) {
                    int index = Integer.parseInt(parameterName.substring(Constants.QUESTION_PREFIX.length()));
                    questions.put(new Integer(index), parameterValue);
                } else if (parameterName.startsWith(Constants.ANSWER_PREFIX)) {
                    int index = Integer.parseInt(parameterName.substring(Constants.ANSWER_PREFIX.length()));
                    answers.put(new Integer(index), parameterValue);
                }
            }
            StringBuffer buf = new StringBuffer(1000);
            buf.append(getUser().getUserName());
            buf.append(" has answered your questions thusly\n\n");
            Map.Entry me = null;
            for (Iterator it = questions.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                buf.append(me.getKey());
                buf.append(". ");
                buf.append(me.getValue());
                buf.append("\n");
                buf.append(answers.get(me.getKey()));
                buf.append("\n\n");
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("Travel Info Response - " + getUser().getUserName());

            mail.setBody(buf.toString());
            String[] recipients = getRecipients();
            for (int i = 0; i < recipients.length; i++) {
                mail.addToAddress(recipients[i], TCSEmailMessage.TO);
            }

            Email email = (Email) createEJB(getInitialContext(), Email.class);
            mail.setFromAddress(email.getAddress(email.getPrimaryEmailId(getUser().getId(),
                    DBMS.OLTP_DATASOURCE_NAME), DBMS.OLTP_DATASOURCE_NAME));
            EmailEngine.send(mail);
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }

    abstract protected String getSuccessPage();

    //abstract protected String getTravelPage();

    abstract protected String[] getRecipients();

}
