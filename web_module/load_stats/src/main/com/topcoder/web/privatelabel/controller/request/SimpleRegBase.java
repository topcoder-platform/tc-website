package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.StringTokenizer;

/**
 * Provides some basic functionality for the different processors
 * involved in a simple registration process.
 *
 * @author gpaul 06.26.2003
 */
public abstract class SimpleRegBase extends RegistrationBase {
    protected static Logger log = Logger.getLogger(SimpleRegBase.class);

    protected abstract void registrationProcessing() throws TCWebException;

    protected abstract void setNextPage();

    protected void setDefaults(SimpleRegInfo info) {
        log.debug("setting defaults");
        setDefault(Constants.HANDLE, info.getHandle());
        setDefault(Constants.PASSWORD, info.getPassword());
        setDefault(Constants.PASSWORD_CONFIRM, info.getPasswordConfirm());
        setDefault(Constants.EMAIL, info.getEmail());
        setDefault(Constants.EMAIL_CONFIRM, info.getEmailConfirm());
        setDefault(Constants.GIVEN_NAME, info.getFirstName());
        setDefault(Constants.MIDDLE_NAME, info.getMiddleName());
        setDefault(Constants.SURNAME, info.getLastName());
        setDefault(Constants.NAME_IN_ANOTHER_LANGUAGE, info.getNameInAnotherLanguage());
        setDefault(Constants.ADDRESS1, info.getAddress1());
        setDefault(Constants.ADDRESS2, info.getAddress2());
        setDefault(Constants.ADDRESS3, info.getAddress3());
        setDefault(Constants.COUNTRY_CODE, info.getCountryCode());
        setDefault(Constants.STATE_CODE, info.getStateCode());
        setDefault(Constants.PROVINCE, info.getProvince());
        setDefault(Constants.CITY, info.getCity());
        setDefault(Constants.POSTAL_CODE, info.getZip());
        setDefault(Constants.PHONE_NUMBER, info.getPhoneNumber());
        setDefault(Constants.LOCALE, getLocale().getLanguage());
        setDefault(Constants.COMP_COUNTRY_CODE, info.getCompCountryCode());

    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo info = getRegInfoFromPersistor();
        if (info == null) {
            log.debug("didn't find info in persistor, proceding with info from request");
            info = new SimpleRegInfo();
        } else {
            log.debug("found info in persistor, proceding with that");
            log.debug("company: " + info.getCompanyId() + " event: " + info.getEventId());
            log.debug("info: " + info.getFirstName() + " " + info.getLastName() + " " + info.getHandle());
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
        if (hasRequestParameter(Constants.GIVEN_NAME))
            info.setFirstName(StringUtils.checkNull(getRequestParameter(Constants.GIVEN_NAME)));
        if (hasRequestParameter(Constants.MIDDLE_NAME))
            info.setMiddleName(StringUtils.checkNull(getRequestParameter(Constants.MIDDLE_NAME)));
        if (hasRequestParameter(Constants.SURNAME))
            info.setLastName(StringUtils.checkNull(getRequestParameter(Constants.SURNAME)));
        if (hasRequestParameter(Constants.NAME_IN_ANOTHER_LANGUAGE))
            info.setLastName(StringUtils.checkNull(getRequestParameter(Constants.NAME_IN_ANOTHER_LANGUAGE)));
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
        if (hasRequestParameter(Constants.POSTAL_CODE))
            info.setZip(StringUtils.checkNull(getRequestParameter(Constants.POSTAL_CODE)));
        if (hasRequestParameter(Constants.COMPANY_ID))
            info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        if (hasRequestParameter(Constants.EVENT_ID))
            info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));
        if (hasRequestParameter(Constants.PHONE_NUMBER))
            info.setPhoneNumber(StringUtils.checkNull(getRequestParameter(Constants.PHONE_NUMBER)));
        if (hasRequestParameter(Constants.COMP_COUNTRY_CODE))
            info.setCompCountryCode(StringUtils.checkNull(getRequestParameter(Constants.COMP_COUNTRY_CODE)));
        return info;
    }

    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        log.debug("called checkRegInfo");
        //check handle
        if (info.getHandle().length() > Constants.MAX_HANDLE_LENGTH ||
                info.getHandle().length() < Constants.MIN_HANDLE_LENGTH) {
            addError(Constants.HANDLE, getBundle().getProperty("error_handle_length"));
        }
        if (!StringUtils.containsOnly(info.getHandle(), Constants.HANDLE_ALPHABET, false)) {
            addError(Constants.HANDLE, getBundle().getProperty("error_handle_chars"));
        }
        try {
            if (info.isNew() && !info.isAccountConversion() && userExists(info.getHandle())) {
                addError(Constants.HANDLE, getBundle().getProperty("error_dup_handle"));
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        //check password
        if (info.getPassword().length() > Constants.MAX_PASSWORD_LENGTH ||
                info.getPassword().length() < Constants.MIN_PASSWORD_LENGTH) {
            addError(Constants.PASSWORD, getBundle().getProperty("error_password_length"));
        }
        if (!info.getPassword().equals(info.getPasswordConfirm())) {
            addError(Constants.PASSWORD_CONFIRM, getBundle().getProperty("error_password_mismatch"));
        }

        //check email
        if (info.getEmail().length() > Constants.MAX_EMAIL_LENGTH) {
            addError(Constants.EMAIL, getBundle().getProperty("error_email_length"));
        }
        StringTokenizer st = new StringTokenizer(info.getEmail(), "@.");
        if (st.countTokens() < 3
                || !StringUtils.contains(info.getEmail(), '@')
                || !StringUtils.contains(info.getEmail(), '.')) {
            addError(Constants.EMAIL, getBundle().getProperty("error_invalid_email"));
        }
        if (!info.getEmail().equals(info.getEmailConfirm())) {
            addError(Constants.EMAIL_CONFIRM, getBundle().getProperty("error_email_mismatch"));
        }

        //check first name
        if (info.getFirstName().length() < 1) {
            addError(Constants.GIVEN_NAME, getBundle().getProperty("error_enter_first_name"));
        }

        //nothing for middle name

        //check last name
        if (info.getLastName().length() < 1) {
            addError(Constants.SURNAME, getBundle().getProperty("error_enter_last_name"));
        }

        // nothing to check for name in another language

        //check address1
        if (info.getAddress1().length() < 1) {
            addError(Constants.ADDRESS1, getBundle().getProperty("error_enter_address"));
        }

        //nothing to check for address2

        //nothing to check for address3

        //check country code
        if (info.getCountryCode().trim().length() == 0 || findCountry(info.getCountryCode()) == null) {
            addError(Constants.COUNTRY_CODE, getBundle().getProperty("error_enter_country"));
        }

        //state code
        if (info.getCountryCode().equals("840")) {
            if (info.getStateCode().trim().length() == 0 || findState(info.getStateCode()) == null) {
                addError(Constants.STATE_CODE, getBundle().getProperty("error_enter_state"));
            }
        }

        //nothing to check for province

        //city
        if (info.getCity().length() < 1) {
            addError(Constants.CITY, getBundle().getProperty("error_enter_city"));
        }
        //zip
        if (info.getZip().length() != 0 && info.getZip().length() < 4) {
            addError(Constants.POSTAL_CODE, getBundle().getProperty("error_enter_zip"));
        }
    }


    protected boolean userExists(String handle) throws Exception {
        User user = (User) createEJB(getInitialContext(), User.class);
        return user.userExists(handle, db) || user.userExists(handle, DBMS.OLTP_DATASOURCE_NAME);

    }

    protected boolean emailExists(String email) throws Exception {
        Request r = new Request();
        r.setContentHandle("email exists");
        r.setProperty("em", email);
        r.setProperty("cm", getRequestParameter(Constants.COMPANY_ID));

        ResultSetContainer rsc = (ResultSetContainer) getDataAccess(db).getData(r).get("email exists");
        return !rsc.isEmpty();

    }


}
