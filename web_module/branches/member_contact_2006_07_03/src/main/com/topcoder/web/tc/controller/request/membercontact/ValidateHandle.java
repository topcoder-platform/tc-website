package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.controller.request.membercontact.validation.HandleValidator;

/**
 * Validates whether the handle in parameter MemberContact.TO_HANDLE can receive
 * a member contact.
 * The result is stored in attribute result
 * 
 * @author cucu
 */
public class ValidateHandle extends HibernateProcessor {
	
    protected void dbProcessing() throws Exception {
        String handle = getRequest().getParameter(MemberContact.TO_HANDLE);
        
        ValidationResult result = new HandleValidator().validate(new StringInput(handle));
    	
        getRequest().setAttribute("result", result);        

        setNextPage(Constants.VALIDATE_HANDLE);
        setIsNextPageInContext(true);        
    }


}
