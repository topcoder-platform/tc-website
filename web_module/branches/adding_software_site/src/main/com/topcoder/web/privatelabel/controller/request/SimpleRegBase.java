package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.security.NoSuchUserException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import java.util.StringTokenizer;

/**
 * Provides some basic functionality for the different processors
 * involved in a simple registration process.
 * @author gpaul 06.26.2003
 */
public abstract class SimpleRegBase extends RegistrationBase {
    protected static Logger log = Logger.getLogger(SimpleRegBase.class);

    protected abstract void registrationProcessing() throws TCWebException;

    protected abstract void setNextPage();

    protected void setDefaults(SimpleRegInfo info) {
        setDefault(Constants.HANDLE, info.getHandle());
        setDefault(Constants.PASSWORD, info.getPassword());
        setDefault(Constants.PASSWORD_CONFIRM, info.getPasswordConfirm());
        setDefault(Constants.EMAIL, info.getEmail());
        setDefault(Constants.EMAIL_CONFIRM, info.getEmailConfirm());
        setDefault(Constants.FIRST_NAME, info.getFirstName());
        setDefault(Constants.MIDDLE_NAME, info.getMiddleName());
        setDefault(Constants.LAST_NAME, info.getLastName());
        setDefault(Constants.ADDRESS1, info.getAddress1());
        setDefault(Constants.ADDRESS2, info.getAddress2());
        setDefault(Constants.ADDRESS3, info.getAddress3());
        setDefault(Constants.COUNTRY_CODE, info.getCountryCode());
        setDefault(Constants.STATE_CODE, info.getStateCode());
        setDefault(Constants.PROVINCE, info.getProvince());
        setDefault(Constants.CITY, info.getCity());
        setDefault(Constants.ZIP, info.getZip());
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo info = getRegInfoFromPersistor();
        if (info == null) {
            log.debug("didn't find info in persistor, proceding with info from request");
            info = new SimpleRegInfo();
        } else {
            log.debug("found info in persistor, proceding with that");
            log.debug("company: " + info.getCompanyId() + " event: " + info.getEventId());
        }
        if (hasRequestParameter(Constants.HANDLE))
            info.setHandle(StringUtils.checkNull(getRequestParameter(Constants.HANDLE)));
        if (hasRequestParameter(Constants.PASSWORD))
            info.setPassword(StringUtils.checkNull(getRequestParameter(Constants.PASSWORD)));
        if (hasRequestParameter(Constants.PASSWORD_CONFIRM))
            info.setPasswordConfirm(StringUtils.checkNull(getRequestParameter(Constants.PASSWORD_CONFIRM)));
        if (hasRequestParameter(Constants.EMAIL))
            info.setEmail(StringUtils.checkNull(getRequestParameter(Constants.EMAIL)));
        if (hasRequestParameter(Constants.EMAIL_CONFIRM))
            info.setEmailConfirm(StringUtils.checkNull(getRequestParameter(Constants.EMAIL_CONFIRM)));
        if (hasRequestParameter(Constants.FIRST_NAME))
            info.setFirstName(StringUtils.checkNull(getRequestParameter(Constants.FIRST_NAME)));
        if (hasRequestParameter(Constants.MIDDLE_NAME))
            info.setMiddleName(StringUtils.checkNull(getRequestParameter(Constants.MIDDLE_NAME)));
        if (hasRequestParameter(Constants.LAST_NAME))
            info.setLastName(StringUtils.checkNull(getRequestParameter(Constants.LAST_NAME)));
        if (hasRequestParameter(Constants.ADDRESS1))
            info.setAddress1(StringUtils.checkNull(getRequestParameter(Constants.ADDRESS1)));
        if (hasRequestParameter(Constants.ADDRESS2))
            info.setAddress2(StringUtils.checkNull(getRequestParameter(Constants.ADDRESS2)));
        if (hasRequestParameter(Constants.ADDRESS3))
            info.setAddress3(StringUtils.checkNull(getRequestParameter(Constants.ADDRESS3)));
        if (hasRequestParameter(Constants.COUNTRY_CODE))
            info.setCountryCode(StringUtils.checkNull(getRequestParameter(Constants.COUNTRY_CODE)));
        if (hasRequestParameter(Constants.STATE_CODE))
            info.setStateCode(StringUtils.checkNull(getRequestParameter(Constants.STATE_CODE)));
        if (hasRequestParameter(Constants.CITY))
            info.setCity(StringUtils.checkNull(getRequestParameter(Constants.CITY)));
        if (hasRequestParameter(Constants.PROVINCE))
            info.setProvince(StringUtils.checkNull(getRequestParameter(Constants.PROVINCE)));
        if (hasRequestParameter(Constants.ZIP))
            info.setZip(StringUtils.checkNull(getRequestParameter(Constants.ZIP)));
        if (hasRequestParameter(Constants.COMPANY_ID))
            info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        if (hasRequestParameter(Constants.EVENT_ID))
            info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));

        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        log.debug("called checkRegInfo");
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
        if (st.countTokens()<3
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

        //nothing for middle name

        //check last name
        if (info.getLastName().length()<1) {
            addError(Constants.LAST_NAME, "Please enter your last name.");
        }

        //check address1
        if (info.getAddress1().length()<1) {
            addError(Constants.ADDRESS1, "Please enter your address.");
        }

        //nothing to check for address2

        //nothing to check for address3

        //check country code
        if (info.getCountryCode().trim().length()==0 || findCountry(info.getCountryCode())==null) {
            addError(Constants.COUNTRY_CODE, "Please chooose a country from the list.");
        }

        //state code
        if (info.getCountryCode().equals("840")) {
            if (info.getStateCode().trim().length()==0 || findState(info.getStateCode())==null) {
                addError(Constants.STATE_CODE, "Please chooose a state from the list.");
            }
        }

        //nothing to check for province

        //city
        if (info.getCity().length()<1) {
            addError(Constants.CITY, "Please enter your city.");
        }
        //zip
        if (info.getZip().length() != 0 && info.getZip().length() < 4) {
            addError(Constants.ZIP, "Please enter your zip code.");
        }
    }


    protected boolean userExists(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user exists");
        r.setProperty("hn", handle);

        ResultSetContainer rsc = (ResultSetContainer)getDataAccess(db).getData(r).get("user exists");
        return !rsc.isEmpty();

    }

}
