package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
import com.topcoder.web.common.model.State;
import com.topcoder.web.common.validation.*;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class StateValidator implements Validator {
    private static final Logger log = Logger.getLogger(StateValidator.class);

    private Country c;

    public StateValidator(Country c) {
        this.c = c;
    }

    /**
     * This will throw a null pointer if a null country was given to the constructor
     * that seems the best choice, as it's not a validity failure, it's a use failure.
     *
     * @param input
     * @return whether or not the input is valid
     */
    public ValidationResult validate(ValidationInput input) {
        if (c.equals(DAOUtil.getFactory().getCountryDAO().getUS())) {
            ValidationResult ret = new NonEmptyValidator("Please enter your state.").validate(input);
            if (ret.isValid()) {
                State s = DAOUtil.getFactory().getStateDAO().find((String) input.getInput());
                if (s == null) {
                    return new BasicResult(false, "Please enter a valid state.");
                } else {
                    return ValidationResult.SUCCESS;
                }
            } else {
                return ret;
            }
        } else {
            //if they're not from the US, we dont' really care.
            return ValidationResult.SUCCESS;
        }
    }
}