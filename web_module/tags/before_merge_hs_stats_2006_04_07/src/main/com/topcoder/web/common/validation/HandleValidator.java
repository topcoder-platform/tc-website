package com.topcoder.web.common.validation;

/**
 * This implementation of Validator validates a handle.
 *
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class HandleValidator implements Validator {

    private String db;

    public HandleValidator(String db) {
        this.db = db;
    }

    public ValidationResult validate(ValidationInput input) {
        return ValidationResult.SUCCESS;
    }


}
