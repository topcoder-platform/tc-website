package com.topcoder.web.tc.controller.request.authentication;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.PasswordRecovery;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.tc.Constants;

import java.util.GregorianCalendar;

/**
 * Send an email to an user with an url to reset his password.
 * If the email needs to be sent to a different address than the registered, then
 * it is checked that the security question is correctly replyed.
 *
 * @author Cucu
 */
public class RecoverEmail extends ShortHibernateProcessor {

    public static final String SECRET_QUESTION_RESPONSE = "sqr";

    protected void dbProcessing() throws TCWebException {
        String userId = StringUtils.checkNull(getRequest().getParameter(Constants.CODER_ID));
        String email = getRequest().getParameter(Constants.EMAIL);
        String response = StringUtils.checkNull(getRequest().getParameter(SECRET_QUESTION_RESPONSE));

        User u = DAOUtil.getFactory().getUserDAO().find(new Long(userId));

        // if different mail, check that email is valid and the secret question.
        if (email != null) {
            if (!u.getSecretQuestion().getResponse().equalsIgnoreCase(response)) {
                addError("error", "Incorrect response");
            }

            ValidationResult vr = new EmailValidator().validate(new StringInput(email));

            if (!vr.isValid()) {
                addError("error", vr.getMessage());
            }

            if (hasErrors()) {
                getRequest().setAttribute(FindUser.SECRET_QUESTION, StringUtils.htmlEncode(u.getSecretQuestion().getQuestion()));
                getRequest().setAttribute(Constants.CODER_ID, userId);

                setDefault(Constants.EMAIL, email);
                setDefault(SECRET_QUESTION_RESPONSE, response);
                setNextPage(Constants.SECRET_QUESTION);
                setIsNextPageInContext(true);
                return;
            }
        }

        // Create a password recovery entry in DB
        GregorianCalendar expire = new GregorianCalendar();
        expire.add(GregorianCalendar.MINUTE, Constants.PASSWORD_RECOVERY_EXPIRE);

        PasswordRecovery pr = new PasswordRecovery();
        pr.setUser(u);
        pr.setRecoveryAddress(email != null ? email : u.getPrimaryEmailAddress().getAddress());
        pr.setExpireDate(expire.getTime());
        DAOUtil.getFactory().getPasswordRecoveryDAO().saveOrUpdate(pr);

        // send the email
        try {
            StringBuffer msgText = new StringBuffer(1000);
            msgText.append("In order to reset your password please go to the following URL: \n\n");
            msgText.append("http://");
            msgText.append(ApplicationServer.SERVER_NAME);
            msgText.append("/tc?module=ResetPassword&pr=" + pr.getId() + "&hc=" + pr.hash());
            msgText.append("\n\nYour user name is: " + u.getHandle() + ". Please remember that user names are case-sensitive.");

            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject("TopCoder Password Recovery");
            mail.setBody(msgText.toString());

            mail.setToAddress(pr.getRecoveryAddress(), TCSEmailMessage.TO);
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        } catch (Exception e) {
            throw new TCWebException("Couldn't send the email to the user.", e);
        }

        getRequest().setAttribute(Constants.EMAIL, pr.getRecoveryAddress());
        setNextPage(Constants.RECOVER_PASSWORD_CONFIRM);
        setIsNextPageInContext(true);
    }


}
