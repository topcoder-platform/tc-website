package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

public class MemberContact extends HibernateProcessor {

    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        String toHandle = getRequest().getParameter(Constants.TO_HANDLE);
        String subject = getRequest().getParameter(Constants.SUBJECT);
        String message = getRequest().getParameter(Constants.MESSAGE);
        boolean sendCopy = getRequest().getParameter("sc") != null;

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
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);        
    }


}
