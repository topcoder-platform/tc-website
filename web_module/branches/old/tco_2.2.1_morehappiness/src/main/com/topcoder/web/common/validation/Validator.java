package com.topcoder.web.common.validation;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public interface Validator {

    ValidationResult validate(ValidationInput input);

}
