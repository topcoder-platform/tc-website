package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.RegistrationInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;

import java.util.StringTokenizer;

abstract class RegistrationBase extends BaseProcessor {

    protected abstract void businessProcessing();

    protected void setDefaults(RegistrationInfo info) {
        setDefault(Constants.HANDLE, info.getHandle());
        setDefault(Constants.PASSWORD, "");
        setDefault(Constants.PASSWORD_CONFIRM, "");
        setDefault(Constants.EMAIL, info.getEmail());
        setDefault(Constants.EMAIL_CONFIRM, info.getEmailConfirm());
        setDefault(Constants.FIRST_NAME, info.getFirstName());
        setDefault(Constants.LAST_NAME, info.getLastName());
        setDefault(Constants.ADDRESS1, info.getAddress1());
        setDefault(Constants.ADDRESS2, info.getAddress2());
        setDefault(Constants.COUNTRY_CODE, info.getCountryCode());
        setDefault(Constants.STATE_CODE, info.getStateCode());
        setDefault(Constants.CITY, info.getCity());
        setDefault(Constants.ZIP, info.getZip());
    }

    protected void checkRegInfo(RegistrationInfo info) {
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
            addError(Constants.EMAIL, "Your password must be between at most " +
                    Constants.MAX_EMAIL_LENGTH + " characters.");
        }
        StringTokenizer st = new StringTokenizer(info.getEmail(), "@.");
        if (st.countTokens()!=3
                || !StringUtils.contains(info.getEmail(), '@')
                || !StringUtils.contains(info.getEmail(), '.')) {
            addError(Constants.EMAIL, "Please enter a valid email address.");
        }
        if (!info.getEmail().equals(info.getEmailConfirm())) {
            addError(Constants.EMAIL_CONFIRM, "Please be sure email and email confirmation match.");
        }

        //check first name
        if (info.getFirstName().length()<1) {
            addError(Constants.FIRST_NAME, "Please enter your first name.");
        }

        //check last name
        if (info.getLastName().length()<1) {
            addError(Constants.LAST_NAME, "Please enter your last name.");
        }

        //check address1
        if (info.getAddress1().length()<1) {
            addError(Constants.ADDRESS1, "Please enter your address.");
        }

        //nothing to check for address2

        //check country code

        //state code

        //city
        if (info.getCity().length()<1) {
            addError(Constants.CITY, "Please enter your city.");
        }
        //zip
        if (info.getZip().length()<1) {
            addError(Constants.ZIP, "Please enter your zip code.");
        }
    }

}
