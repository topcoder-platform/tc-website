package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.Base;


public class PasswordEmail extends Base {

    protected void businessProcessing() throws TCWebException {
        String firstName = StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME));
        String lastName = StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        if (firstName.equals("") && lastName.equals("") && email.equals("")) {
            setNextPage(Constants.RECOVER_PASSWORD);
            setIsNextPageInContext(true);
        } else {
            if (firstName.equals("")) addError(Constants.FIRST_NAME, "Please enter your first name.");
            if (lastName.equals("")) addError(Constants.LAST_NAME, "Please enter your last name.");
            if (email.equals("")) addError(Constants.EMAIL, "Please enter your email address.");

            try {
                Request r = new Request();
                r.setContentHandle("password_email");
                r.setProperty(Constants.FIRST_NAME, firstName);
                r.setProperty(Constants.LAST_NAME, lastName);
                r.setProperty(Constants.EMAIL, email);
                ResultSetContainer rsc = (ResultSetContainer) getDataAccess().getData(r).get("password_email");
                if (rsc.isEmpty()) {
                    addError(Constants.FIRST_NAME, "Sorry, the information you supplied was not found.");
                } else if (rsc.size() > 1) {
                    throw new Exception(rsc.size() + " users found with first/last/email: " + firstName + "/" + lastName + "/" + email);
                }

                if (hasErrors()) {
                    setNextPage(Constants.RECOVER_PASSWORD);
                    setIsNextPageInContext(true);
                } else {
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject("TopCoder Password Information");
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append("Your TopCoder login credentials are:\n\n");
                    msgText.append("Handle:  ");
                    msgText.append(rsc.getStringItem(0, "handle"));
                    msgText.append("\nPassword:  ");
                    msgText.append(rsc.getStringItem(0, "password"));
                    msgText.append("\n\nThank You for registering with TopCoder!\n");
                    msgText.append("\n\nPlease do not reply to this e-mail.\n");
                    mail.setBody(msgText.toString());
                    mail.addToAddress(email, TCSEmailMessage.TO);
                    mail.setFromAddress("service@topcoder.com");
                    EmailEngine.send(mail);
                    setNextPage(Constants.EMAIL_SENT);
                    setIsNextPageInContext(true);
                }

            } catch (Exception e) {
                throw new TCWebException(e);
            }

        }
    }
}
