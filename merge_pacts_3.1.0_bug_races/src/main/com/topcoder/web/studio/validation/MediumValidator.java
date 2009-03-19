/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.validation;

import java.util.Iterator;
import java.util.List;

import com.topcoder.web.common.validation.BasicResult;
import com.topcoder.web.common.validation.ValidationInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.studio.Constants;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.studio.dao.StudioDAOUtil;
import com.topcoder.web.studio.model.Medium;

/**
 * <p>A validator for intended medium types for submissions for the created contests.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly v2 (Req# 5.1.5)
 */
public class MediumValidator implements Validator {

    /**
     * <p>Constructs new <code>MediumValidator</code> instance. This implementation does nothing.</p>
     */
    public MediumValidator() {
    }

    /**
     * <p>Validates the specified input which is expected to provide the list of IDs of selected medium types. The
     * validation will succeed only if the provided list contains at least one element.</p>
     *
     * @param input a <code>ValidationInput</code> providing the data to be validated.
     * @return a <code>ValidationResult</code> providing the result of validation of the provided input.
     */
    public ValidationResult validate(ValidationInput input) {
        List mediums = (List) input.getInput();
        if (mediums == null || mediums.isEmpty()) {
            //return new BasicResult(false, Constants.ERROR_MSG_NO_MEDIUM);
            return ValidationResult.SUCCESS;
        } else {
            try {
                MediumDAO dao = StudioDAOUtil.getFactory().getMediumDAO();
                Medium medium;
                for (Iterator it = mediums.iterator(); it.hasNext();) {
                    medium = dao.find(new Integer((String) it.next()));
                    if (medium == null) {
                        return new BasicResult(false, Constants.ERROR_MSG_MEDIUM_INVALID);
                    }
                }
                return ValidationResult.SUCCESS;
            } catch (NumberFormatException e) {
                return new BasicResult(false, Constants.ERROR_MSG_MEDIUM_INVALID);
            }
        }
    }
}
