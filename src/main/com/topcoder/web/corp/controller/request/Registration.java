package com.topcoder.web.corp.controller.request;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.MisconfigurationException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.company.CompanyHome;
import com.topcoder.web.ejb.termsofuse.TermsOfUse;
import com.topcoder.web.ejb.termsofuse.TermsOfUseHome;
import com.topcoder.web.ejb.user.*;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
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
        setIsNextPageInContext(true);
        formPage = Constants.REGISTRATION_PAGE_RETRY;
        successPage = Constants.REGISTRATION_PAGE_SUCCESS;
    }

    protected void setNextPage() {
        if (!secTok.createNew) {
            setIsNextPageInContext(false);
            setNextPage(Constants.REGISTRATION_UPDATE_SUCCESS);
        } else {
            setIsNextPageInContext(true);
            setNextPage(successPage);
        }
    }

    /**
     * @see com.topcoder.web.corp.controller.request.UserEdit#getFormFields()
     */
    protected boolean getFormFields() throws Exception {
        company = getRequest().getParameter(KEY_COMPANY);
        title = getRequest().getParameter(KEY_TITLE);
        compAddress = getRequest().getParameter(KEY_ADDRLINE);
        compAddress2 = getRequest().getParameter(KEY_ADDRLINE2);
        city = getRequest().getParameter(KEY_CITY);
        state = getRequest().getParameter(KEY_STATE);
        zip = getRequest().getParameter(KEY_ZIP);
        country = getRequest().getParameter(KEY_COUNTRY);

        agree = "on".equalsIgnoreCase(getRequest().getParameter(Constants.KEY_AGREE_TO_TERMS));
        return super.getFormFields();
    }


    /**
     * this is a total hack to get this thing working.  what we really
     * need to do is decouple more of registration and user edit.
     * this will populate the user's information in the fields if
     * we know who they are.
     * @return
     * @throws java.lang.Exception
     */
    protected boolean loadUserData() throws Exception {
        InitialContext icEJB = null;
        PrincipalMgrRemote mgr = Util.getPrincipalManager();
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            if (!secTok.createNew) {
                try {
                    password = mgr.getPassword(targetUserID);
                    password2 = password;
                    userName = secTok.targetUser.getName();
                    icEJB = (InitialContext) TCContext.getInitial();
                    retrieveUserDataFromDB(icEJB);
                } finally {
                    Util.closeIC(icEJB);
                }
            }
            setFormFieldsDefaults();
            setNextPage(formPage);
            return true;
        }
        return false;
    }

    /**
     * @see com.topcoder.web.corp.controller.request.UserEdit#setFormFieldsDefaults()
     */
    protected void setFormFieldsDefaults() throws Exception {
        setDefault(KEY_COMPANY, company);
        setDefault(KEY_TITLE, title);
        setDefault(KEY_ADDRLINE, compAddress);
        setDefault(KEY_ADDRLINE2, compAddress2);
        setDefault(KEY_CITY, city);
        setDefault(KEY_STATE, state);
        setDefault(KEY_ZIP, zip);
        setDefault(KEY_COUNTRY, country);
        getRequest().setAttribute("ext-fields-editable", "" + isExtFieldsEditable());

        Request dataRequest = new Request();
        InitialContext ic = null;
        ResultSetContainer rsc = null;
        try {
            ic = (InitialContext) TCContext.getInitial();
            DataAccessInt dai = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);
            dataRequest.setContentHandle("cmd-states-list");
            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("State_List");
            getRequest().setAttribute("rsc-states-list", rsc);

            dataRequest.setContentHandle("cmd-countries-list");
            resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("Country_List");
            getRequest().setAttribute("rsc-countries-list", rsc);

            TermsOfUse terms = ((TermsOfUseHome) ic.lookup(TermsOfUseHome.EJB_REF_NAME)).create();
            setDefault(Constants.KEY_TERMS, terms.getText(Constants.CORP_SITE_TERMS_ID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME));

            UserTermsOfUse userTerms = ((UserTermsOfUseHome) ic.lookup(UserTermsOfUseHome.EJB_REF_NAME)).create();
            if (userTerms.hasTermsOfUse(getAuthentication().getUser().getId(), Constants.CORP_SITE_TERMS_ID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME)) {
                setDefault(Constants.KEY_AGREE_TO_TERMS, Boolean.TRUE.toString());
            } else {
                setDefault(Constants.KEY_AGREE_TO_TERMS, Boolean.FALSE.toString());
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

        valid &= simpleValidityCheck(KEY_ADDRLINE2, compAddress2, 0, 254, "Please enter a shorter address2.");

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
                        "Please choose country from the list."
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
            addError(Constants.KEY_AGREE_TO_TERMS, "You must agree to terms in order to register.");
        }
        return agree;
    }


    /**
     */
    protected void verifyAllowed()
            throws PermissionException, Exception {
        com.topcoder.shared.security.User loggedInUser = getAuthentication().getUser();
        com.topcoder.shared.security.User knownUser = getUser();


        if (secTok.createNew) {
            if (!knownUser.isAnonymous()) {
                if (loggedInUser.isAnonymous()) {
                    throw new PermissionException(knownUser,
                            new ClassResource(this.getClass()), new Exception("You must be logged on, in order to access your account."));

                } else {
                    targetUserID = loggedInUser.getId();
                    secTok.createNew = false;
                    secTok.renewTargetUser();
                }
            }
        } else {
            if (loggedInUser.isAnonymous()) {
                throw new PermissionException(knownUser,
                        new ClassResource(this.getClass()), new Exception("You must be logged on, in order to access your account."));
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
            ic = (InitialContext) TCContext.getInitial();
            Request stateRequest = new Request();
            if (KEY_STATE.equals(key)) {
                stateRequest.setContentHandle("cmd-state-name-from-id");
                stateRequest.setProperty("stateID", value);
            } else {
                stateRequest.setContentHandle("cmd-country-name-from-id");
                stateRequest.setProperty("countryID", value);
            }
            DataAccessInt dai = new DataAccess(DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
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
                addError(
                        key,
                        "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        if (!success) {
            addError(key, message);
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
                (ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)
                ).create();

        long companyID = -1;

        if (secTok.createNew) {
            companyID = companyTable.createCompany();
            companyTable.setPrimaryContactId(companyID, targetUserID);
            contactTable.createContact(companyID, targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        } else {
            companyID = contactTable.getCompanyId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        contactTable.setTitle(targetUserID, title, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        if (secTok.isAccountAdmin || getAuthentication().getUser().isAnonymous()) {
            companyTable.setName(companyID, company);
        }

        // address items for user
        UserAddress xrefUserAddr = (
                (UserAddressHome) ic.lookup(UserAddressHome.EJB_REF_NAME)
                ).create();

        Address addrTable = (
                (AddressHome) ic.lookup(AddressHome.EJB_REF_NAME)
                ).create();

        long addressID = -1;
        if (!secTok.createNew) { // editing mode
            ResultSetContainer rsc = xrefUserAddr.getUserAddresses(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            try {
                String tmp = rsc.getItem(0, "address_id").getResultData().toString();
                addressID = Long.parseLong(tmp);
            } catch (IndexOutOfBoundsException e) {
                e.printStackTrace();
            }
        }
        if (addressID < 0) {
            // either create mode or editing mode but there was not an address yet
            addressID = addrTable.createAddress(DBMS.CORP_JTS_OLTP_DATASOURCE_NAME, DBMS.CORP_OLTP_DATASOURCE_NAME);
            xrefUserAddr.createUserAddress(targetUserID, addressID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            addrTable.setAddressTypeId(addressID, 1, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME); // *HARDCODED*
        }
        addrTable.setAddress1(addressID, compAddress, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        addrTable.setAddress2(addressID, compAddress2, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        addrTable.setCity(addressID, city, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        addrTable.setCountryCode(addressID, country, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        if (COUNTRY_USA.equals(country)) {
            addrTable.setStateCode(addressID, state, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        } else {
            addrTable.setStateCode(addressID, null, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        addrTable.setZip(addressID, zip, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

        UserTermsOfUse userTerms = ((UserTermsOfUseHome) ic.lookup(UserTermsOfUseHome.EJB_REF_NAME)).create();
        if (!userTerms.hasTermsOfUse(getAuthentication().getUser().getId(), Constants.CORP_SITE_TERMS_ID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME)) {
            userTerms.createUserTermsOfUse(targetUserID, Constants.CORP_SITE_TERMS_ID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }


    }

    /**
     * @see com.topcoder.web.corp.controller.request.UserEdit#retrieveUserDataFromDB(javax.naming.InitialContext)
     */
    protected void retrieveUserDataFromDB(InitialContext ic) throws Exception {
        super.retrieveUserDataFromDB(ic); // base fields

        // additional fields
        // title item for user
        Contact contactTable = ((ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)).create();
        long companyID = contactTable.getCompanyId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        title = contactTable.getTitle(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

        // company item for user
        Company companyTable = ((CompanyHome) ic.lookup(CompanyHome.EJB_REF_NAME)).create();
        company = companyTable.getName(companyID);

        // address item for user
        UserAddress xrefUserAddr = ((UserAddressHome) ic.lookup(UserAddressHome.EJB_REF_NAME)).create();
        long addrID = -1;
        ResultSetContainer rsc = xrefUserAddr.getUserAddresses(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        if (!rsc.isEmpty()) {
            String tmp = rsc.getItem(0, "address_id").getResultData().toString();
            addrID = Long.parseLong(tmp);
        }

        if (addrID < 0) { // user has not an address yet
            compAddress = "";
            compAddress2 = "";
            city = "";
            state = "";
            zip = "";
            country = "";
        } else {
            Address addrTable = ((AddressHome) ic.lookup(AddressHome.EJB_REF_NAME)).create();
            compAddress = addrTable.getAddress1(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            compAddress2 = addrTable.getAddress2(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            city = addrTable.getCity(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            country = addrTable.getCountryCode(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            zip = addrTable.getZip(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            if (COUNTRY_USA.equals(country)) {
                state = addrTable.getStateCode(addrID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
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
