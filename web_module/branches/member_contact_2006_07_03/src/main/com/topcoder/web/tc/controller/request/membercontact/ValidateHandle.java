package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

public class ValidateHandle extends HibernateProcessor {
    
	
    protected void dbProcessing() throws Exception {
        String handle = getRequest().getParameter(MemberContact.TO_HANDLE);
        
        ValidationResult result = new HandleValidator().validate(new StringInput(handle));
    	
        getRequest().setAttribute("result", result);
        getRequest().setAttribute("send", getRequest().getParameter(MemberContact.SEND));
        
        

        setNextPage(Constants.VALIDATE_HANDLE);
        setIsNextPageInContext(true);        
    }


}
