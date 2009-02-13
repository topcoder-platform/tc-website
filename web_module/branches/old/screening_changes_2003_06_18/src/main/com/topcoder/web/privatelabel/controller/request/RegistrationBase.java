package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.RegistrationInfo;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.CachedDataAccess;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;

import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.rmi.PortableRemoteObject;
import java.util.StringTokenizer;
import java.util.Map;
import java.util.Iterator;

abstract class RegistrationBase extends BaseProcessor {

    private String db;
    protected RegistrationInfo regInfo;
    protected final void businessProcessing() throws TCWebException {
        regInfo = new RegistrationInfo(getRequest());
        getRequest().setAttribute("registrationInfo", regInfo);
        setDb(getCompanyDb(regInfo.getCompanyId()));
        registrationProcessing();
    }

    protected abstract void registrationProcessing() throws TCWebException;

    private String getCompanyDb(long companyId) {
        //TODO dynamicize when we have db support
        return "OLTP";
    }

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

    protected void checkRegInfo(RegistrationInfo info) throws TCWebException {
        //check handle
        //TODO check if handle exists
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
        if (info.getCountryCode().trim().length()==0 || findCountry(info.getCountryCode())==null) {
            addError(Constants.COUNTRY_CODE, "Please chooose a country from the list.");
        }

        //state code
        if (info.getCountryCode().equals("840")) {
            if (info.getStateCode().trim().length()==0 || findState(info.getStateCode())==null) {
                addError(Constants.COUNTRY_CODE, "Please chooose a state from the list.");
            }
        }

        //city
        if (info.getCity().length()<1) {
            addError(Constants.CITY, "Please enter your city.");
        }
        //zip
        if (info.getZip().length()<5) {
            addError(Constants.ZIP, "Please enter your zip code.");
        }
    }

    public String getDb() {
        return db;
    }

    public void setDb(String db) {
        this.db = db;
    }

    public DataAccessInt getDataAccess() throws Exception {
        return getDataAccess(getDb(), false);
    }
    public DataAccessInt getDataAccess(boolean cached) throws Exception {
        return getDataAccess(getDb(), cached);
    }

    public DataAccessInt getDataAccess(String datasource, boolean cached) throws Exception {
        if(datasource == null) return null;
        InitialContext context = new InitialContext();
        DataSource ds = (DataSource)
            PortableRemoteObject.narrow(context.lookup(datasource),
                                        DataSource.class);
        DataAccessInt dAccess = null;
        if (cached) dAccess = new CachedDataAccess(ds);
        else dAccess = new DataAccess(ds);
        return dAccess;
    }

    protected String findState(String stateCode) throws TCWebException {
        ResultSetContainer list = getStateList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            if (row.getItem("state_code").toString().equals(stateCode))
                return row.getItem("state_name").toString();
        }
        return null;
    }

    protected String findCountry(String countryCode) throws TCWebException {
        ResultSetContainer list = getCountryList();
        ResultSetContainer.ResultSetRow row = null;
        for (Iterator it = list.iterator(); it.hasNext();) {
            row = (ResultSetContainer.ResultSetRow)it.next();
            if (row.getItem("country_code").toString().equals(countryCode))
                return row.getItem("country_name").toString();
        }
        return null;
    }

    protected ResultSetContainer getCountryList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("country_list");
            Map map = getDataAccess(true).getData(request);
            if (map == null)
                throw new Exception("error getting country list from db");
            else
                return (ResultSetContainer) map.get("country_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected ResultSetContainer getStateList() throws TCWebException {
        try {
            Request request = new Request();
            request.setContentHandle("state_list");
            Map map = getDataAccess(true).getData(request);
            if (map == null)
                throw new Exception("error getting state list from db");
            else
                return (ResultSetContainer) map.get("state_list");
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

}
