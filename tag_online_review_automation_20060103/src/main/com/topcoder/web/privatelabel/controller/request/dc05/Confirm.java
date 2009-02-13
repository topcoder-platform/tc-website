package com.topcoder.web.privatelabel.controller.request.dc05;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.StringTokenizer;

public class Confirm extends FullRegConfirm {
    protected void setNextPage() {
        //reg closed
        if (hasErrors()) {
            setNextPage(Constants.DC05_REG_PAGE);
        } else {
            setNextPage(Constants.DC05_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);

    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        super.checkRegInfo(info);

        try {
            //validate front fields here

            //check handle
            if (info.getHandle().length() > Constants.MAX_HANDLE_LENGTH ||
                    info.getHandle().length() < Constants.MIN_HANDLE_LENGTH) {
                addError(Constants.HANDLE, "Your handle must contain between " +
                        Constants.MIN_HANDLE_LENGTH + " and " + Constants.MAX_HANDLE_LENGTH + " characters.");
            }

            if (!StringUtils.containsOnly(info.getHandle(), Constants.HANDLE_ALPHABET, false)) {
                addError(Constants.HANDLE,
                        "Please limit the characters in your handle to letter, numbers and common punctuation symbols.");
            }

            try {
                if (info.isNew() && userExists(info.getHandle())) {
                    addError(Constants.HANDLE, "Please choose another handle.");
                }
            } catch (Exception e) {
                throw new TCWebException(e);
            }

            //check password
            if (info.getPassword().length() > Constants.MAX_PASSWORD_LENGTH ||
                    info.getPassword().length() < Constants.MIN_PASSWORD_LENGTH) {
                addError(Constants.PASSWORD, "Your password must contain between " +
                        Constants.MIN_PASSWORD_LENGTH + " and " + Constants.MAX_PASSWORD_LENGTH + " characters.");
            }
            if (!info.getPassword().equals(info.getPasswordConfirm())) {
                addError(Constants.PASSWORD_CONFIRM, "Please be sure password and password confirmation match.");
            }

            //check email
            if (info.getEmail().length() > Constants.MAX_EMAIL_LENGTH) {
                addError(Constants.EMAIL, "Your email must be between at most " +
                        Constants.MAX_EMAIL_LENGTH + " characters.");
            }

            StringTokenizer st = new StringTokenizer(info.getEmail(), "@.");
            if (st.countTokens() < 3
                    || !StringUtils.contains(info.getEmail(), '@')
                    || !StringUtils.contains(info.getEmail(), '.')) {
                addError(Constants.EMAIL, "Please enter a valid email address.");
            }

            //check first name
            if (info.getFirstName().length() < 1) {
                addError(Constants.FIRST_NAME, "Please enter your first name.");
            }

            //check last name
            if (info.getLastName().length() < 1) {
                addError(Constants.LAST_NAME, "Please enter your last name.");
            }

        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }
}
