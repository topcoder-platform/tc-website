/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.NonEmptyValidator;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.dao.ContestTypeDAO;
import com.topcoder.web.studio.model.ContestType;
import com.topcoder.web.studio.Constants;

/**
 * <p>A validator for types of created/updated contests.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.4)
 */
public class ContestTypeValidator implements Validator {

    /**
     * <p>Constructs new <code>ContestTypeValidator</code> instance. This implementation does nothing.</p>
     */
    public ContestTypeValidator() {
    }

    /**
     * <p>Validates the specified input which is expected to provide the ID of selected contest type. The validation
     * will succeed only if the provided ID maps to existing contest type.</p>
     *
     * @param input a <code>ValidationInput</code> providing the data to be validated.
     * @return a <code>ValidationResult</code> providing the result of validation of the provided input.
     */
    public ValidationResult validate(ValidationInput input) {
        ValidationResult ret = new NonEmptyValidator(Constants.ERROR_MSG_NO_CONTEST_TYPE).validate(input);
        if (ret.isValid()) {
            try {
                ContestTypeDAO dao = StudioDAOUtil.getFactory().getContestTypeDAO();
                ContestType type = dao.find(new Integer((String) input.getInput()));
                if (type == null) {
                    return new BasicResult(false, Constants.ERROR_MSG_CONTEST_TYPE_INVALID);
                } else {
                    return ValidationResult.SUCCESS;
                }
            } catch (NumberFormatException e) {
                return new BasicResult(false, Constants.ERROR_MSG_CONTEST_TYPE_INVALID);
            }
        } else {
            return ret;
        }
    }
}
