package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.validation.ValidationResult;

public class HandleValidationResult implements ValidationResult {


    private boolean handleExist;
    private boolean canReceiveEmail;
    private String email;
    
    public HandleValidationResult(boolean handleExist, boolean canReceiveEmail, String email) {
        this.handleExist = handleExist;
        this.canReceiveEmail = canReceiveEmail;
        this.email = email;
    }

    public HandleValidationResult(boolean handleExist, boolean canReceiveEmail) {
        this(handleExist, canReceiveEmail, null);
    }
    
    /**
     * @param args
     */

    public boolean isValid() {
        return handleExist && canReceiveEmail;
    }
    
  
    public boolean canReceiveEmail() {
        return canReceiveEmail;
    }

    public String getEmail() {
        return email;
    }

    public boolean handleExist() {
        return handleExist;
    }

    public String getMessage() {
        return "";
    }

}
