/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.validation;

import com.topcoder.web.common.validation.*;
import com.topcoder.web.reg.Constants;

/**
 * <p>Simple email validator.</p>
 * <p>
 *   Version 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0) Change notes:
 *   <ol>
 *     <li> Add a simple email format checker.</li>
 *   </ol>
 * </p>
 * @author dok, TCSASSEMBLER
 * @version 1.1
 */
public class EmailValidator implements Validator {
    /**
     * <p>
     * The REGEX checker to tell the email apart from the user in query string.
     * </p>
     */
    public static final String EMAIL_REGEX_CHECKER = ".+@[^\\.]+(\\.[^\\.]+)*";
    
    /**
     * <p>Validate the email.</p>
     * @param input the validation input contains email address.
     * @return the validation result.
     */
    public ValidationResult validate(ValidationInput input) {
        String queryString = (String)input.getInput();
        if(queryString.length() == 0){
            return new BasicResult(false, "Please enter your email address.");
        }
        if(queryString.length() > Constants.MAX_EMAIL_LENGTH){
            return new BasicResult(false, "The email address exceeds the maximum length " + Constants.MAX_EMAIL_LENGTH);
        }
        if(!queryString.matches(EMAIL_REGEX_CHECKER)){
            return new BasicResult(false, "Please enter an email which has valid format.");
        }
        return new BasicResult(true, "The email is fine.");
    }
}
