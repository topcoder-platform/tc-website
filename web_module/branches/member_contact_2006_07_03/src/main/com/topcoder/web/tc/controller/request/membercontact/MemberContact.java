package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidationResult;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

public class MemberContact extends HibernateProcessor {

    protected void dbProcessing() throws Exception {
        String toHandle = getRequest().getParameter(Constants.TO_HANDLE);
        String subject = getRequest().getParameter(Constants.SUBJECT);
        String message = getRequest().getParameter(Constants.MESSAGE);
        
        if (toHandle != null) {
            HandleValidationResult result = (HandleValidationResult) new HandleValidator().validate(new StringInput(toHandle));
            if (!result.isValid()) {
                throw new Exception("Can't contact that user.");
            }
                
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(message);
            mail.addToAddress(result.getEmail(), TCSEmailMessage.TO); 
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);        
    }


}
