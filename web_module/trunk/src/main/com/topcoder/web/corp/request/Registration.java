package com.topcoder.web.corp.request;

import com.topcoder.security.*;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.MisconfigurationException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.company.CompanyHome;
import com.topcoder.web.ejb.user.*;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseHome;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.rmi.RemoteException;
import java.util.Iterator;
import java.util.Map;

/**
 * This class contains logic Primary registration.
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public final class Registration extends UserEdit {
    private final static Logger log = Logger.getLogger(Registration.class);

    public static final String KEY_TITLE = "title";
    public static final String KEY_COMPANY = "prim-company-name";
    public static final String KEY_ADDRLINE = "prim-company-address-1";
    public static final String KEY_ADDRLINE2 = "prim-company-address-2";
    public static final String KEY_CITY = "prim-company-city";
    public static final String KEY_STATE = "prim-company-state";
    public static final String KEY_ZIP = "prim-company-zip";
    public static final String KEY_COUNTRY = "prim-company-country";

    private static final String COUNTRY_USA = "840";

    private String title;
    private String company;
    private String compAddress;
    private String compAddress2;
    private String city;
    private String state;
    private String zip;
    private String country;
    private boolean agree = false;

    /**
     *
     *
     */
    public Registration() {
        pageInContext = true;
        formPage = Constants.REGISTRATION_PAGE_RETRY;
        successPage = Constants.REGISTRATION_PAGE_SUCCESS;
    }

    /**
     * @see com.topcoder.web.corp.request.UserEdit#getFormFields()
     */
    protected boolean getFormFields() throws Exception {
        company = request.getParameter(KEY_COMPANY);
        title = request.getParameter(KEY_TITLE);
        compAddress = request.getParameter(KEY_ADDRLINE);
        compAddress2 = request.getParameter(KEY_ADDRLINE2);
        city = request.getParameter(KEY_CITY);
        state = request.getParameter(KEY_STATE);
        zip = request.getParameter(KEY_ZIP);
        country = request.getParameter(KEY_COUNTRY);

        agree = "on".equalsIgnoreCase(request.getParameter(Constants.KEY_AGREE_TO_TERMS));
        return super.getFormFields();
    }


    /**
     * this is a total hack to get this thing working.  what we really
     * need to do is decouple more of registration and user edit.
     * this will populate the user's information in the fields if
     * we know who they are.
     * @return
     * @throws Exception
     */
    protected boolean loadUserData() throws Exception {
        InitialContext icEJB = null;
        PrincipalMgrRemote mgr = Util.getPrincipalManager();
        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            if (!secTok.createNew) {
                try {
                    password = mgr.getPassword(targetUserID);
                    password2 = password;
                    userName = secTok.targetUser.getName();
                    icEJB = (InitialContext)TCContext.getInitial();
                    retrieveUserDataFromDB(icEJB);
                } finally {
                    Util.closeIC(icEJB);
                }
            }
            setFormFieldsDefaults();
            nextPage = formPage;
            return true;
        }
        return false;
    }

    /**
     * @see com.topcoder.web.corp.request.UserEdit#setFormFieldsDefaults()
     */
    protected void setFormFieldsDefaults() throws Exception {
        setFormFieldDefault(KEY_COMPANY, company);
        setFormFieldDefault(KEY_TITLE, title);
        setFormFieldDefault(KEY_ADDRLINE, compAddress);
        setFormFieldDefault(KEY_ADDRLINE2, compAddress2);
        setFormFieldDefault(KEY_CITY, city);
        setFormFieldDefault(KEY_STATE, state);
        setFormFieldDefault(KEY_ZIP, zip);
        setFormFieldDefault(KEY_COUNTRY, country);
        request.setAttribute("ext-fields-editable", "" + isExtFieldsEditable());

        Request dataRequest = new Request();
        InitialContext ic = null;
        ResultSetContainer rsc = null;
        try {
            ic = (InitialContext)TCContext.getInitial();
            DataAccessInt dai = new DataAccess((DataSource) ic.lookup(DBMS.CORP_OLTP_DATASOURCE_NAME));
            dataRequest.setContentHandle("cmd-states-list");
            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("State_List");
            request.setAttribute("rsc-states-list", rsc);

            dataRequest.setContentHandle("cmd-countries-list");
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Country_List");
            request.setAttribute("rsc-countries-list", rsc);

            TermsOfUse terms = ((TermsOfUseHome)ic.lookup("corp:"+TermsOfUseHome.EJB_REF_NAME)).create();
            setFormFieldDefault(Constants.KEY_TERMS, terms.getText(Constants.CORP_SITE_TERMS_ID));

            UserTermsOfUse userTerms = ((UserTermsOfUseHome)ic.lookup("corp:"+UserTermsOfUseHome.EJB_REF_NAME)).create();
            if (userTerms.hasTermsOfUse(getAuthentication().getUser().getId(), Constants.CORP_SITE_TERMS_ID)) {
                setFormFieldDefault(Constants.KEY_AGREE_TO_TERMS, Boolean.TRUE.toString());
            } else {
                setFormFieldDefault(Constants.KEY_AGREE_TO_TERMS, Boolean.FALSE.toString());
            }

        } finally {
            Util.closeIC(ic);
        }
        super.setFormFieldsDefaults();
    }

    /**
     *
     * @return boolean
     */
    private boolean isExtFieldsEditable() {
        return
                (secTok.isAccountAdmin && !secTok.createNew) ||
                (getAuthentication().getUser().isAnonymous() && secTok.createNew);
    }

    /**
     */
    protected boolean verifyFormFieldsValidity() {
        boolean valid = super.verifyFormFieldsValidity();
        valid &= // title name validity
                checkItemValidity(KEY_TITLE, title,
                        StringUtils.ALPHABET_ALPHA_PUNCT_EN, true, 5,
                        "Ensure title is not empty, consists of letters and punctuation " +
                "signs only"
                );

        if (!isExtFieldsEditable()) return valid;

        // checks below make sense only when registering new primary contact
        // or modifying existent one
        valid &= // company name validity (required)
                checkItemValidity(KEY_COMPANY, company,
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 7,
                        "Ensure company name consists of letters, digits and punctuation " +
                "signs only (no more than 7 words)"
                );

        valid &= // addr line 1 validity (required)
                checkItemValidity(KEY_ADDRLINE, compAddress,
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 7,
                        "Ensure address line 1 is not empty, consists of letters, digits " +
                "and punctuation signs only (no more than 7 words)"
                );

        valid &= // addr line 2 validity (optional)
                checkItemValidity(KEY_ADDRLINE2, compAddress2,
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
                        "Ensure address line 2 is not empty, consists of letters, digits " +
                "and punctuation signs only (no more than 7 words)"
                );

        valid &= // city validity (required)
                checkItemValidity(KEY_CITY, city,
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 3,
                        "Ensure city is not empty, consists of letters, digits and " +
                "punctuation signs only (no more than 3 words)"
                );

        valid &= // country validity (required)
                checkStateOrCountryAgainstDB(
                        KEY_COUNTRY,
                        country,
                        "Please choose country from the list carefully"
                );

        if (COUNTRY_USA.equals(country)) {
            valid &= // state validity (required if and only if country is USA)
                    checkStateOrCountryAgainstDB(
                            KEY_STATE,
                            state,
                            "Please choose state from the list carefully"
                    );
        }

        valid &= // zip validity (required)
                checkItemValidity(KEY_ZIP, zip, StringUtils.ALPHABET_ZIPCODE_EN,
                        true, 1, "Ensure ZIP code is not empty and, consists of digits only"
                );
        valid &= checkTerms(agree);
        return valid;
    }

    private boolean checkTerms(boolean agree) {
        if (!agree) {
            markFormFieldAsInvalid(Constants.KEY_AGREE_TO_TERMS, "You must agree to terms in order to register.");
        }
        return agree;
    }


    /**
     */
    protected void verifyAllowed()
            throws NotAuthorizedException, Exception {
        com.topcoder.shared.security.User loggedInUser = getAuthentication().getUser();
        com.topcoder.shared.security.User knownUser = getAuthentication().getActiveUser();


        if (secTok.createNew) {
            if (!knownUser.isAnonymous()) {
                if (loggedInUser.isAnonymous()) {
                    throw new NotAuthorizedException("You must be logged on, in order to continue");
                } else {
                    targetUserID = loggedInUser.getId();
                    secTok.createNew = false;
                    secTok.renewTargetUser();
                }
            }
        } else {
            if (loggedInUser.isAnonymous()) {
                throw new NotAuthorizedException("You must be logged on, in order to continue");
            }
        }
    }


    /**
     * Verifies that state and country codes are valid (ie. there related
     * records in underlying DB tables).
     *
     * @param key
     * @param value
     * @param message
     * @return boolean
     */
    private boolean checkStateOrCountryAgainstDB(
            String key,
            String value,
            String message
            ) {
        InitialContext ic = null;
        boolean techProblems = false;
        boolean success = false;
        try {
            ic = (InitialContext)TCContext.getInitial();
            Request stateRequest = new Request();
            if (KEY_STATE.equals(key)) {
                stateRequest.setContentHandle("cmd-state-name-from-id");
                stateRequest.setProperty("stateID", value);
            } else {
                stateRequest.setContentHandle("cmd-country-name-from-id");
                stateRequest.setProperty("countryID", value);
            }
            DataAccessInt dai = new DataAccess(
                    (DataSource) ic.lookup(DBMS.CORP_JTS_OLTP_DATASOURCE_NAME)
            );
            Map state = dai.getData(stateRequest);
            ResultSetContainer rsc;
            if (KEY_STATE.equals(key)) {
                rsc = (ResultSetContainer) state.get("qry-state-name-from-id");
            } else {
                rsc = (ResultSetContainer) state.get("qry-country-name-from-id");
            }
            success = rsc.getRowCount() == 1;
        } catch (NamingException ne) {
            techProblems = true;
            log.error("NamingException - primary registration process [" + key + "]");
            ne.printStackTrace();
        } catch (Exception e) {
            techProblems = true;
            log.error("Exception - primary registration process [" + key + "]");
            e.printStackTrace();
        } finally {
            Util.closeIC(ic);
            if (techProblems) {
                markFormFieldAsInvalid(
                        key,
                        "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        if (!success) {
            markFormFieldAsInvalid(key, message);
        }
        return success;
    }

    /**
     * Makes user data persistent. Persistance mode depends on
     * secToken.createNew. When true, new primary contact is being creating,
     * otherwise user with that id is about to be modified
     *
     */
    protected void storeUserDataIntoDB(InitialContext ic)
            throws NamingException, CreateException, RemoteException,
            GeneralSecurityException {
        commonFieldsStore(ic, secTok.createNew);
        // company item for user
        Company companyTable = (
                (CompanyHome) ic.lookup(CompanyHome.EJB_REF_NAME)
                ).create();

        Contact contactTable = (
                (ContactHome) ic.lookup("corp:"+ContactHome.EJB_REF_NAME)
                ).create();

        long companyID = -1;

        if (secTok.createNew) {
            companyID = companyTable.createCompany();
            companyTable.setPrimaryContactId(companyID, targetUserID);
            contactTable.createContact(companyID, targetUserID);
        } else {
            companyID = contactTable.getCompanyId(targetUserID);
        }
        contactTable.setTitle(targetUserID, title);
        if (secTok.isAccountAdmin || getAuthentication().getUser().isAnonymous()) {
            companyTable.setName(companyID, company);
        }

        // address items for user
        UserAddress xrefUserAddr = (
                (UserAddressHome) ic.lookup("corp:"+UserAddressHome.EJB_REF_NAME)
                ).create();

        Address addrTable = (
                (AddressHome) ic.lookup(AddressHome.EJB_REF_NAME)
                ).create();

        long addressID = -1;
        if (!secTok.createNew) { // editing mode
            ResultSetContainer rsc = xrefUserAddr.getUserAddresses(targetUserID);
            try {
                String tmp = rsc.getItem(0, "address_id").getResultData().toString();
                addressID = Long.parseLong(tmp);
            } catch (IndexOutOfBoundsException e) {
				e.printStackTrace();
            }
        }
        if (addressID < 0) {
            // either create mode or editing mode but there was not an address yet
            addressID = addrTable.createAddress();
            xrefUserAddr.createUserAddress(targetUserID, addressID);
            addrTable.setAddressTypeId(addressID, 1); // *HARDCODED*
        }
        addrTable.setAddress1(addressID, compAddress);
        addrTable.setAddress2(addressID, compAddress2);
        addrTable.setCity(addressID, city);
        addrTable.setCountryCode(addressID, country);
        if (COUNTRY_USA.equals(country)) {
            addrTable.setStateCode(addressID, state);
        } else {
            addrTable.setStateCode(addressID, null);
        }
        addrTable.setZip(addressID, zip);

        UserTermsOfUse userTerms = ((UserTermsOfUseHome)ic.lookup("corp:"+UserTermsOfUseHome.EJB_REF_NAME)).create();
        if (!userTerms.hasTermsOfUse(getAuthentication().getUser().getId(), Constants.CORP_SITE_TERMS_ID)) {
            userTerms.createUserTermsOfUse(targetUserID, Constants.CORP_SITE_TERMS_ID);
        }


    }

    /**
     * @see com.topcoder.web.corp.request.UserEdit#retrieveUserDataFromDB(javax.naming.InitialContext)
     */
    protected void retrieveUserDataFromDB(InitialContext ic) throws Exception {
        super.retrieveUserDataFromDB(ic); // base fields

        // additional fields
        // title item for user
        Contact contactTable = ((ContactHome) ic.lookup("corp:"+ContactHome.EJB_REF_NAME)).create();
        long companyID = contactTable.getCompanyId(targetUserID);
        title = contactTable.getTitle(targetUserID);

        // company item for user
        Company companyTable = ((CompanyHome) ic.lookup(CompanyHome.EJB_REF_NAME)).create();
        company = companyTable.getName(companyID);

        // address item for user
        UserAddress xrefUserAddr = ((UserAddressHome) ic.lookup("corp:"+UserAddressHome.EJB_REF_NAME)).create();
        long addrID = -1;
        // single address per company so address is to be fetched for primary
        ResultSetContainer rsc = xrefUserAddr.getUserAddresses(targetUserID);
        try {
            String tmp = rsc.getItem(0, "address_id").getResultData().toString();
            addrID = Long.parseLong(tmp);
        } catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
        }

        if (addrID < 0) { // user has not an address yet
            compAddress = "";
            compAddress2 = "";
            city = "";
            state = "";
            zip = "";
            country = "";
        } else {
            Address addrTable = (
                    (AddressHome) ic.lookup(AddressHome.EJB_REF_NAME)
                    ).create();
            compAddress = addrTable.getAddress1(addrID);
            compAddress2 = addrTable.getAddress2(addrID);
            city = addrTable.getCity(addrID);
            country = addrTable.getCountryCode(addrID);
            zip = addrTable.getZip(addrID);
            if (COUNTRY_USA.equals(country)) {
                state = addrTable.getStateCode(addrID);
            } else {
                state = "";
            }
        }
    }


    /**
     * Also assigns account admin role
     */
    protected UserPrincipal createUserPrincipal()
            throws RemoteException, GeneralSecurityException, MisconfigurationException {
        UserPrincipal ret = super.createUserPrincipal();

        // because it is primary person, grant 'Account Admin' role
        try {
            PrincipalMgrRemote mgr = Util.getPrincipalManager();
            Iterator roles = mgr.getRoles(secTok.requestor).iterator();
            RolePrincipal role = null;
            while (roles.hasNext()) {
                role = (RolePrincipal) roles.next();
                if (role.getName().equalsIgnoreCase(Constants.CORP_ADMIN_ROLE)) {
                    break;
                }
            }
            if (role == null) {
                throw new MisconfigurationException("Account Admin role was not found");
            }
            mgr.assignRole(ret, role, secTok.requestor);
            log.debug("Assigned Account Admin role");
        } catch (NamingException ne) {
            throw new MisconfigurationException("Error getting principal manager" + ne.getMessage());
        } catch (CreateException ce) {
            throw new MisconfigurationException("Error getting principal manager" + ce.getMessage());
        }
        return ret;
    }

}
