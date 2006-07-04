package com.topcoder.web.tc.controller.request.membercontact;

import antlr.StringUtils;

import com.topcoder.apps.review.ApplicationServer;
import com.topcoder.shared.util.EmailEngine;
import com.topcoder.shared.util.TCSEmailMessage;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.Constants;

public class MemberContact extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        String toHandle = getRequest().getParameter(Constants.TO_HANDLE);
        String subject = getRequest().getParameter(Constants.SUBJECT);
        String message = getRequest().getParameter(Constants.MESSAGE);
        
        if (toHandle != null) {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setSubject(subject);
            mail.setBody(toHandle);
            mail.addToAddress("amarcu@gmail.com", TCSEmailMessage.TO); // fix
            mail.setFromAddress("service@topcoder.com");
            EmailEngine.send(mail);
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);
        
    }


}
