package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

public class MemberContact extends HibernateProcessor {

    protected void dbProcessing() throws Exception {
        String toHandle = getRequest().getParameter(Constants.TO_HANDLE);
        String subject = getRequest().getParameter(Constants.SUBJECT);
        String message = getRequest().getParameter(Constants.MESSAGE);
        
        if (toHandle != null) {
            ValidationResult result = new HandleValidator().validate(new StringInput(toHandle));
            if (!result.isValid()) {
                throw new Exception("Can't contact that user.");
            }
            User user = DAOUtil.getFactory().getUserDAO().find(toHandle, true, true);
            Email e = user.getPrimaryEmailAddress();
            if (e == null) log.debug("e is null!");
            String addr = e.getAddress();
            if (addr == null) log.debug("addr is null!");
            
            
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(message);
            mail.addToAddress(addr==null? "amarcu@gmail.com" : addr, TCSEmailMessage.TO); 
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);        
    }


}
