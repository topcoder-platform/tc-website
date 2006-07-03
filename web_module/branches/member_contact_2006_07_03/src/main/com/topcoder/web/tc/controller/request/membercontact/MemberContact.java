package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.tc.Constants;

public class MemberContact extends BaseProcessor {

    protected void businessProcessing() throws Exception {
        String toHandle = getRequest().getParameter(Constants.TO_HANDLE);
        String subject = getRequest().getParameter(Constants.SUBJECT);
        String message = getRequest().getParameter(Constants.MESSAGE);
        
        if (toHandle != null) {
            // send mail
        }
        
        setNextPage(Constants.MEMBER_CONTACT);
        setIsNextPageInContext(true);
        
    }


}
