package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.NonEmptyValidator;
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
public class ValidateHandle extends ShortHibernateProcessor {

    protected void dbProcessing() throws Exception {
        String handle = getRequest().getParameter(SendMail.TO_HANDLE);
        String text = getRequest().getParameter(SendMail.TEXT);

        User user = DAOUtil.getFactory().getUserDAO().find(new Long(getUser().getId()));

        ValidationResult handleValidation = new HandleValidator(user).validate(new StringInput(handle));
        ValidationResult textValidation = new NonEmptyValidator("Please enter the message text.")
            .validate(new StringInput(text));

        getRequest().setAttribute("handleValidation", handleValidation);
        getRequest().setAttribute("textValidation", textValidation);

        setNextPage(Constants.VALIDATE_HANDLE);
        setIsNextPageInContext(true);
    }


}
