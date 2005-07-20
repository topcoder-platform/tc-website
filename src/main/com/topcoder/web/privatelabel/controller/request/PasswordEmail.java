package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jul 20, 2005
 */
public class PasswordEmail extends RegistrationBase {

    protected SimpleRegInfo makeRegInfo() throws Exception {
        return new SimpleRegInfo();
    }


    protected void registrationProcessing() throws TCWebException {
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        if (email.equals("")) {
            setDefault(Constants.COMPANY_ID, getRequest().getParameter(Constants.COMPANY_ID));
            setNextPage("/recoverPassword.jsp");
            setIsNextPageInContext(true);
        } else {

            try {
                Request r = new Request();
                r.setContentHandle("password_email");
                r.setProperty(Constants.EMAIL, clean(email));
                ResultSetContainer rsc = (ResultSetContainer) getDataAccess(db).getData(r).get("password_email");
                if (rsc.isEmpty()) {
                    addError(Constants.FIRST_NAME, "Sorry, the information you supplied was not found.");
                } else if (rsc.size() > 1) {
                    log.warn(rsc.size() + " users found with email: " + email);
                }

                if (hasErrors()) {
                    setNextPage("/recoverPassword.jsp");
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
                    setNextPage("/emailSent.jsp");
                    setIsNextPageInContext(true);
                }

            } catch (Exception e) {
                throw new TCWebException(e);
            }

        }
    }

    private static String clean(String string) {
        log.debug("in " + string);
        StringBuffer ret = new StringBuffer(string.length()+10);
        for (int i=0; i<string.length(); i++) {
            if (string.charAt(i)=='\'') {
                ret.append("''");
            } else ret.append(string.charAt(i));
        }
        log.debug("out " + ret.toString());
        return ret.toString();
    }



}
