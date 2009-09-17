package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import javax.transaction.Status;
import javax.transaction.TransactionManager;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Feb 1, 2005
 */
public abstract class BaseSubmitTravelInfo extends Base {
    private static Set travelAgentQuestions;

    static {
        travelAgentQuestions = new HashSet();
        travelAgentQuestions.add(String.valueOf(34));
        travelAgentQuestions.add(String.valueOf(42));
        travelAgentQuestions.add(String.valueOf(44));
        travelAgentQuestions.add(String.valueOf(45));
        travelAgentQuestions.add(String.valueOf(46));
        travelAgentQuestions.add(String.valueOf(49));
    }

    protected void businessProcessing() throws TCWebException {
        try {

            TreeMap questions = new TreeMap();
            TreeMap answers = new TreeMap();

            Enumeration parameterNames = getRequest().getParameterNames();
            while (parameterNames.hasMoreElements()) {
                String parameterName = parameterNames.nextElement().toString();
                if (log.isDebugEnabled()) {
                    log.debug("parameter: " + parameterName);
                }
                String parameterValue = getRequest().getParameter(parameterName);
                if (parameterName.startsWith(Constants.QUESTION_PREFIX)) {
                    int index = Integer.parseInt(parameterName.substring(Constants.QUESTION_PREFIX.length()));
                    questions.put(new Integer(index), parameterValue);
                } else if (parameterName.startsWith(Constants.ANSWER_PREFIX)) {
                    int index = Integer.parseInt(parameterName.substring(Constants.ANSWER_PREFIX.length()));
                    answers.put(new Integer(index), parameterValue);
                }
            }
            StringBuffer fullEmail = new StringBuffer(1000);
            fullEmail.append(getUser().getUserName());
            fullEmail.append(" has answered your questions thusly\n\n");

            User user = (User) createEJB(getInitialContext(), User.class);
            UserAddress userAddress = (UserAddress) createEJB(getInitialContext(), UserAddress.class);
            ResultSetContainer rsc = userAddress.getUserAddresses(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            if (rsc.size() > 1) {
                log.warn("hmmm " + getUser().getUserName() + " has " + rsc.size() + " addresses i'll use the first");
            }
            Address address = (Address) createEJB(getInitialContext(), Address.class);

            long addressId = rsc.getLongItem(0, "address_id");

            fullEmail.append(user.getFirstName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append(" ");
            fullEmail.append(user.getLastName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n");
            fullEmail.append(address.getAddress1(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n");
            fullEmail.append(address.getAddress2(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n");
            fullEmail.append(address.getCity(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append(", ");
            String countryCode = address.getCountryCode(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            if ("840".equals(countryCode)) {
                fullEmail.append(address.getStateCode(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            }
            fullEmail.append(" ");
            fullEmail.append(address.getZip(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append(" ");
            fullEmail.append(address.getCountryName(countryCode, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n");
            fullEmail.append("\n");
            Email email = (Email) createEJB(getInitialContext(), Email.class);
            String emailAddress = email.getAddress(email.getPrimaryEmailId(getUser().getId(),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            fullEmail.append("Email ").append(emailAddress);
            fullEmail.append("\n");
            Phone phone = (Phone) createEJB(getInitialContext(), Phone.class);
            fullEmail.append("Phone ").append(phone.getNumber(phone.getPrimaryPhoneId(getUser().getId(),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n");
            fullEmail.append("\n");

            StringBuffer travelAgentEmail = new StringBuffer(1000);
            travelAgentEmail.append("Name ");
            travelAgentEmail.append(user.getFirstName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            travelAgentEmail.append(" ");
            travelAgentEmail.append(user.getLastName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            fullEmail.append("\n\n");
            travelAgentEmail.append("Email ").append(emailAddress);
            fullEmail.append("\n\n");


            TransactionManager tm = (TransactionManager) getInitialContext().lookup(ApplicationServer.TRANS_MANAGER);
            try {
                tm.begin();
                Map.Entry me = null;
                Response response = (Response) createEJB(getInitialContext(), Response.class);
                for (Iterator it = questions.entrySet().iterator(); it.hasNext();) {
                    me = (Map.Entry) it.next();
                    fullEmail.append(me.getValue());
                    fullEmail.append(":\n");
                    fullEmail.append(answers.get(me.getKey()));
                    fullEmail.append("\n\n");
                    if (travelAgentQuestions.contains(me.getKey().toString())) {
                        travelAgentEmail.append(me.getValue());
                        travelAgentEmail.append(":\n");
                        travelAgentEmail.append(answers.get(me.getKey()));
                        travelAgentEmail.append("\n\n");
                    }

                    if (response.exists(getUser().getId(), Long.parseLong(me.getKey().toString()))) {
                        throw new NavigationException("You have already filled out this form.");
                    } else {
                        response.createResponse(getUser().getId(),
                                Long.parseLong(me.getKey().toString()), answers.get(me.getKey()).toString());
                    }
                }
                tm.commit();
            } catch (Exception e) {
                if (tm != null && (tm.getStatus() == Status.STATUS_ACTIVE || tm.getStatus() == Status.STATUS_MARKED_ROLLBACK)) {
                    tm.rollback();
                }
                throw e;
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("Travel Info Response - " + getUser().getUserName());

            mail.setBody(fullEmail.toString());
            String[] recipients = getRecipients();
            for (int i = 0; i < recipients.length; i++) {
                mail.addToAddress(recipients[i], TCSEmailMessage.TO);
            }

            mail.setFromAddress(emailAddress);
            EmailEngine.send(mail);

            TCSEmailMessage agentMail = new TCSEmailMessage();
            agentMail.setSubject("TopCoder Travel Info Response - " + getUser().getUserName());

            agentMail.setBody(travelAgentEmail.toString());
            String[] agentRecipients = getTravelAgentRecipients();

            if (agentRecipients.length>0) {
                for (int i = 0; i < agentRecipients.length; i++) {
                    agentMail.addToAddress(agentRecipients[i], TCSEmailMessage.TO);
                }
                agentMail.setFromAddress(emailAddress);
                EmailEngine.send(agentMail);
            }


            setNextPage(getSuccessPage());
            setIsNextPageInContext(false);

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw new TCWebException(e);
        }


    }

    abstract protected String getSuccessPage();

    //abstract protected String getTravelPage();

    abstract protected String[] getRecipients();

    protected String[] getTravelAgentRecipients() {
        return new String[0];
    }

}
