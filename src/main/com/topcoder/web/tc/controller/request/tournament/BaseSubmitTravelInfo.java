package com.topcoder.web.tc.controller.request.tournament;

import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;

import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Feb 1, 2005
 */
public abstract class BaseSubmitTravelInfo extends Base {

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

            User user = (User)createEJB(getInitialContext(), User.class);
            UserAddress userAddress = (UserAddress)createEJB(getInitialContext(), UserAddress.class);
            ResultSetContainer rsc = userAddress.getUserAddresses(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            if (rsc.size()>1) {
                log.warn("hmmm " + getUser().getUserName() + " has " + rsc.size() + " addresses i'll use the first");
            }
            Address address = (Address)createEJB(getInitialContext(), Address.class);

            long addressId = rsc.getLongItem(0, "address_id");

            buf.append(user.getFirstName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append(" ");
            buf.append(user.getLastName(getUser().getId(), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append("\n");
            buf.append(address.getAddress1(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append("\n");
            buf.append(address.getAddress2(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append("\n");
            buf.append(address.getCity(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append(", ");
            String countryCode = address.getCountryCode(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME);
            if ("840".equals(countryCode)) {
                buf.append(address.getStateCode(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            }
            buf.append(" ");
            buf.append(address.getZip(addressId, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append(" ");
            buf.append(address.getCountryName(countryCode, DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append("\n");
            buf.append("\n");
            Email email = (Email)createEJB(getInitialContext(), Email.class);
            String emailAddress =email.getAddress(email.getPrimaryEmailId(getUser().getId(),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME), DBMS.COMMON_OLTP_DATASOURCE_NAME);
            buf.append("Email ").append(emailAddress);
            buf.append("\n");
            Phone phone = (Phone)createEJB(getInitialContext(), Phone.class);
            buf.append("Phone ").append(phone.getNumber(phone.getPrimaryPhoneId(getUser().getId(),
                    DBMS.COMMON_OLTP_DATASOURCE_NAME), DBMS.COMMON_OLTP_DATASOURCE_NAME));
            buf.append("\n");
            buf.append("\n");

            Map.Entry me = null;
            Response response = (Response)createEJB(getInitialContext(), Response.class);
            for (Iterator it = questions.entrySet().iterator(); it.hasNext();) {
                me = (Map.Entry) it.next();
                buf.append(me.getValue());
                buf.append(":\n");
                buf.append(answers.get(me.getKey()));
                buf.append("\n\n");

                if (response.exists(getUser().getId(), Long.parseLong(me.getKey().toString()))) {
                    throw new NavigationException("You have already filled out this form.");
                } else {
                    response.createResponse(getUser().getId(),
                            Long.parseLong(me.getKey().toString()), answers.get(me.getKey()).toString());
                }
            }

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("Travel Info Response - " + getUser().getUserName());

            mail.setBody(buf.toString());
            String[] recipients = getRecipients();
            for (int i = 0; i < recipients.length; i++) {
                mail.addToAddress(recipients[i], TCSEmailMessage.TO);
            }

            mail.setFromAddress(emailAddress);
            EmailEngine.send(mail);
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

}
