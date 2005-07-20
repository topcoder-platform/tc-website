package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.UserPrincipal;

import javax.naming.Context;

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
        String firstName = StringUtils.checkNull(getRequest().getParameter(Constants.FIRST_NAME));
        String lastName = StringUtils.checkNull(getRequest().getParameter(Constants.LAST_NAME));
        String email = StringUtils.checkNull(getRequest().getParameter(Constants.EMAIL));
        if (firstName.equals("") && lastName.equals("") && email.equals("")) {
            setDefault(Constants.COMPANY_ID, getRequest().getParameter(Constants.COMPANY_ID));
            setNextPage("/recoverPassword.jsp");
            setIsNextPageInContext(true);
        } else {
            if (firstName.equals("")) addError(Constants.FIRST_NAME, "Please enter your first name.");
            if (lastName.equals("")) addError(Constants.LAST_NAME, "Please enter your last name.");
            if (email.equals("")) addError(Constants.EMAIL, "Please enter your email address.");

            try {
                Request r = new Request();
                r.setContentHandle("password_email");
                r.setProperty(Constants.FIRST_NAME, clean(firstName));
                r.setProperty(Constants.LAST_NAME, clean(lastName));
                r.setProperty(Constants.EMAIL, clean(email));
                ResultSetContainer rsc = (ResultSetContainer) getDataAccess(db).getData(r).get("password_email");
                if (rsc.isEmpty()) {
                    addError(Constants.FIRST_NAME, "Sorry, the information you supplied was not found.");
                } else if (rsc.size() > 1) {
                    log.warn(rsc.size() + " users found with first/last/email: " + firstName + "/" + lastName + "/" + email);
                }

                if (hasErrors()) {
                    setNextPage("/recoverPassword.jsp");
                    setIsNextPageInContext(true);
                } else {

                    Context context = null;
                    String password = null;
                    try {
                        context = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                            ApplicationServer.SECURITY_PROVIDER_URL);
                        PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) context.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                        PrincipalMgrRemote pmr = pmrh.create();
                        UserPrincipal p = pmr.getUser(rsc.getLongItem(0, "user_id"));
                        password = pmr.getPassword(p.getId());
                    } finally {
                        close(context);
                    }


                    TCSEmailMessage mail = new TCSEmailMessage();
                    mail.setSubject("TopCoder Password Information");
                    StringBuffer msgText = new StringBuffer(1000);
                    msgText.append("Your TopCoder login credentials are:\n\n");
                    msgText.append("Handle:  ");
                    msgText.append(rsc.getStringItem(0, "handle"));
                    msgText.append("\nPassword:  ");
                    msgText.append(password);
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
