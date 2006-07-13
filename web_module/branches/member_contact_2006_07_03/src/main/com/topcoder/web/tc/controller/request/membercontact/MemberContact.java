package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

public class MemberContact extends HibernateProcessor {
    
    public static String SUBJECT = "sbj";
    public static String TO_HANDLE = "th";
    public static String TEXT = "txt";
    public static String SEND_COPY = "sc";
    public static String CONFIRM = "conf";
    public static String SEND = "send";
    public static String CAN_RECEIVE = "cr";
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String toHandle = getRequest().getParameter(TO_HANDLE);
        String subject = getRequest().getParameter(SUBJECT);
        String message = getRequest().getParameter(TEXT);
        boolean sendCopy = getRequest().getParameter(SEND_COPY) != null;

        if (toHandle != null) {
            ValidationResult result = new HandleValidator().validate(new StringInput(toHandle));
            if (!result.isValid()) {
                throw new Exception("Can't contact that user.");
            }
            
            User sender  = DAOUtil.getFactory().getUserDAO().find(getUser().getUserName(), true, true);
            User destination = DAOUtil.getFactory().getUserDAO().find(toHandle, true, true);
            String senderEmail = sender.getPrimaryEmailAddress().getAddress();
            String destinationEmail = destination.getPrimaryEmailAddress().getAddress();
            
            
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(message);
            mail.setToAddress(destinationEmail, TCSEmailMessage.TO); 
            mail.setFromAddress(senderEmail);
            EmailEngine.send(mail);
            
            if (sendCopy) {
                mail.setSubject("[mail sent to " + toHandle + "] " + subject);
                mail.setToAddress(senderEmail, TCSEmailMessage.TO); 
                mail.setFromAddress(senderEmail);
                EmailEngine.send(mail);
            }
            getRequest().setAttribute(CONFIRM, "true");
        }
        
        String canReceive = DAOUtil.getFactory().getUserPreferenceDAO().find(
                new Long(getUser().getId()), Preference.MEMBER_CONTACT_PREFERENCE_ID).getValue();

        getRequest().setAttribute(CAN_RECEIVE, canReceive);
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);        
    }


}
