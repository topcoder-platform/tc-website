package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Map;
import java.util.StringTokenizer;

/**
 * @author  dok
 * @version  $Revision$ $Date$
 * Create Date: Jan 31, 2005
 */
public abstract class BaseCredentialReminder extends RegistrationBase {

    protected void registrationProcessing() throws TCWebException {
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        setDefault(Constants.COMPANY_ID, StringUtils.checkNull(getRequest().getParameter(Constants.COMPANY_ID)));

        StringTokenizer st = new StringTokenizer(email, "@.");
        setIsNextPageInContext(true);
        if (email.equals("")) {
            setNextPage(getStartPage());
        } else if (st.countTokens() < 3
                || !StringUtils.contains(email, '@')
                || !StringUtils.contains(email, '.')) {
            addError(Constants.EMAIL, "Please enter a valid email address.");
            setDefault(Constants.EMAIL, email);
            setNextPage(getStartPage());
        } else {
            try {
                Request r = new Request();
                r.setContentHandle("user_info_using_email");
                r.setProperty("email", email);
                Map m = getDataAccess(db).getData(r);
                ResultSetContainer rsc = (ResultSetContainer) m.get("user_info_using_email");
                if (rsc.isEmpty()) {
                    throw new NavigationException("Sorry, this email address does not exist " + email);
                } else {
                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject(getEmailSubject());
                    mail.setBody(getEmailContent(rsc.getStringItem(0, "handle"), rsc.getStringItem(0, "password")));
                    mail.addToAddress(email, TCSEmailMessage.TO);
                    mail.setFromAddress(getEmailFromAddress(), getEmailFromAddressName());
                    log.info("sent reminder email to " + email);
                    EmailEngine.send(mail);
                    setNextPage(getSuccessPage());
                }
            } catch (TCWebException e) {
                throw e;
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        }

    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        return null;
    }

    protected String getEmailContent(String handle, String password) {
        StringBuffer buf = new StringBuffer(1000);
        buf.append("Hello, \n\n");
        buf.append("Your login is ").append(handle);
        buf.append("\n");
        buf.append("Your password is ").append(password);
        buf.append("\n\nPlease keep this email for your records.\n\n");
        buf.append("Good Luck,\n");
        buf.append("TopCoder");
        return buf.toString();
    }

    protected String getEmailSubject() {
        return "Login Credentials from TopCoder";
    }

    protected String getEmailFromAddress() {
        return "service@topcoder.com";
    }

    protected String getEmailFromAddressName() {
        return "TopCoder Service";
    }

    abstract protected String getSuccessPage();

    abstract protected String getStartPage();

}
