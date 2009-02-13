package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision: 45940 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class BasicResult implements ValidationResult {

    private boolean valid;
    private String message;

    public BasicResult(boolean valid, String message) {
        this.valid = valid;
        this.message = message;
    }

    public boolean isValid() {
        return valid;
    }

    public String getMessage() {
        return message;
    }

}
