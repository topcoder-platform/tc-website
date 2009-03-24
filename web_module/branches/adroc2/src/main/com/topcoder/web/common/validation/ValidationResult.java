package com.topcoder.web.common.validation;

import java.io.Serializable;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public interface ValidationResult extends Serializable {
    public static final BasicResult SUCCESS = new BasicResult(true, "Success");

    boolean isValid();

    String getMessage();

}
