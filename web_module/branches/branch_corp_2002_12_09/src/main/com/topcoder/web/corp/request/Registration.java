package com.topcoder.web.corp.request;

import java.rmi.RemoteException;
import java.util.Iterator;
import java.util.Map;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.transaction.Transaction;

import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.RolePrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.MisconfigurationException;
import com.topcoder.web.ejb.address.Address;
import com.topcoder.web.ejb.address.AddressHome;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.company.CompanyHome;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserAddress;
import com.topcoder.web.ejb.user.UserAddressHome;
import com.topcoder.web.ejb.user.UserHome;

/**
 * This class contains logic Primary registration.
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class Registration extends BaseRegistration {
    private final static Logger log = Logger.getLogger(Registration.class);
   
    public static final String KEY_TITLE        = "prim-title";
    public static final String KEY_COMPANY      = "prim-company-name";
    public static final String KEY_ADDRLINE1    = "prim-company-address-1";
    public static final String KEY_ADDRLINE2    = "prim-company-address-2";
    public static final String KEY_CITY         = "prim-company-city";
    public static final String KEY_STATE        = "prim-company-state";
    public static final String KEY_ZIP          = "prim-company-zip";
    public static final String KEY_COUNTRY      = "prim-company-country";

    private String title;
    private String company;
    private String compAddress1;
    private String compAddress2;
    private String city;
    private String state;
    private String zip;
    private String country;

    public Registration() {
        pageInContext = true;
        // For this processor next page is always in the context. It is either
        // same form page (if any errors were encountered) or next workflow page
        // (something like to thank u very much for registration)
        }
    
    /**
     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        // for all methods except POST just return form to the user
        // depending on whether user is primary person or regular user
        boolean userKnown = ! authToken.getActiveUser().isAnonymous();
        boolean isPrimaryPerson = isPrimaryContact(); 
        if( ! "POST".equals(request.getMethod()) ) {
            if( userKnown ) {
                if( isPrimaryPerson ) { // populate from db primary data
                    retrieveFromDB(authToken.getActiveUser().getId());
                    nextPage = Constants.REGISTRATION_PAGE_RETRY;
                }
                else { // populate from db regular user 
                    nextPage = Constants.USEREDIT_PAGE_RETRY;
                }
            }
            else { // return empty primary contact registration form
                nextPage = Constants.REGISTRATION_PAGE_RETRY;
            }
            return;
        }
        
        //log.debug("business processing ("+request.getMethod()+")");
        // well, user filled the form
        // and possible he thinks that it is allright
        // so lets prove that he is wrong
        firstName      = (String) request.getParameter(KEY_FIRSTNAME);
        lastName       = (String) request.getParameter(KEY_LASTNAME);
        title          = (String) request.getParameter(KEY_TITLE);
        company        = (String) request.getParameter(KEY_COMPANY);
        compAddress1   = (String) request.getParameter(KEY_ADDRLINE1);
        compAddress2   = (String) request.getParameter(KEY_ADDRLINE2);
        city           = (String) request.getParameter(KEY_CITY);
        state          = (String) request.getParameter(KEY_STATE);
        zip            = (String) request.getParameter(KEY_ZIP);
        country        = (String) request.getParameter(KEY_COUNTRY);
        phone          = (String) request.getParameter(KEY_PHONE);
        userName       = (String) request.getParameter(KEY_LOGIN);
        password       = (String) request.getParameter(KEY_PASSWORD);
        password2      = (String) request.getParameter(KEY_PASSWORD2);
        email          = (String) request.getParameter(KEY_EMAIL);
        email2         = (String) request.getParameter(KEY_EMAIL2);
        
        boolean formDataValid = isValid();
        if( formDataValid ) {
            log.debug("data entered seem to be valid");

            makePersistent();
            nextPage = Constants.REGISTRATION_PAGE_SUCCESS;
        }
        else {
            log.debug("invalid data entered");
            nextPage = Constants.REGISTRATION_PAGE_RETRY;
        }
    }
    
    /**
     * performs validity checks of data entered by user
     * @return boolean true if all seems to be valid
     */
    private boolean isValid() {
        boolean ret = genericValidityCheck(false); // checks common fields
        ret &= // title name validity 
        checkItemValidity(KEY_TITLE, title, 
            StringUtils.ALPHABET_ALPHA_PUNCT_EN, true, 5,
            "Ensure title is not empty, consists of letters and punctuation signs only"
        );

        ret &= // company name validity (required)
        checkItemValidity(KEY_COMPANY, company,
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 7,
            "Ensure company name consists of letters, digits and punctuation signs only (no more than 7 words)"
        );

        ret &= // addr line 1 validity (required)
        checkItemValidity(KEY_ADDRLINE1, compAddress1, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 7,
            "Ensure address line 1 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
        );

        ret &= // addr line 2 validity (optional)
        checkItemValidity(KEY_ADDRLINE2, compAddress2, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
            "Ensure address line 2 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
        );

        ret &= // city validity (required) 
        checkItemValidity(KEY_CITY, city, 
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 3,
            "Ensure city is not empty, consists of letters, digits and punctuation signs only (no more than 3 words)"
        );

        ret &= // state validity (required)
        checkAgainstDB(
            KEY_STATE, 
            state,
            "Please choose state from the list carefully"
        );

        ret &= // country validity (required)
        checkAgainstDB(
            KEY_COUNTRY,
            country,
            "Please choose country from the list carefully"
        );

        ret &= // zip validity (required)
        checkItemValidity(KEY_ZIP, zip, StringUtils.ALPHABET_DIGITS_EN, 
            true, 1, "Ensure ZIP code is not empty and, consists of digits only"
        );
        return ret;
    }
    
    /**
     * Makes user data persistent. Not implemented yet (until ejbs will be
     * ready).
     */
    private void makePersistent()
    throws MisconfigurationException, RemoteException, CreateException,
            NamingException, Exception 
    {
        // first of all we are needed in TCSubject of web-application itself
        // it must be supplied when creating security user via security
        // component
        TCSubject corpAppSubject = null;
        try {
            corpAppSubject = Util.retrieveTCSubject(Constants.CORP_PRINCIPAL);
        }
        catch(Exception cause) {
            cause.printStackTrace();
            throw new MisconfigurationException(
                "Can't retrieve TCSubject for corp web application"
//                , cause
            );
        }
        
        // will create security user at first
        PrincipalMgrRemote mgr = null;
        InitialContext icEJB = null;
        Transaction tx = null;
        UserPrincipal newSecurityUser = null;
        try {
            mgr = Util.getPrincipalManager();
            newSecurityUser = mgr.createUser(userName, password, corpAppSubject);
            Iterator groups = mgr.getGroups(corpAppSubject).iterator();
            GroupPrincipal group = null;
            while(groups.hasNext()) {
                group = (GroupPrincipal)groups.next();
                if( group.getName().equalsIgnoreCase(Constants.CORP_GROUP)) {
                    break;
                }
            }
            if( group != null ) {
                log.debug("including to the corporate group");
                mgr.addUserToGroup(group, newSecurityUser, corpAppSubject);
            }
            else {
                log.error("Can't find corporate group '"+Constants.CORP_GROUP+"'");
            }
            
            // as requested add user to the anonymous group
            groups = mgr.getGroups(corpAppSubject).iterator();
            group = null;
            while(groups.hasNext()) {
                group = (GroupPrincipal)groups.next();
                if( group.getName().equalsIgnoreCase(Constants.CORP_ANONYMOUS_GROUP)) {
                    break;
                }
            }
            if( group != null ) {
                log.debug("including to the anonymous group");
                mgr.addUserToGroup(group, newSecurityUser, corpAppSubject);
            }
            else {
                log.error("Can't find anonymous group '"+Constants.CORP_ANONYMOUS_GROUP+"'");
            }
            
            
            // becase user is company primary person,
            // grant 'Corp Company Admin' role to he
            Iterator roles = mgr.getRoles(corpAppSubject).iterator();
        	RolePrincipal role = null;
        	while(roles.hasNext()) {
        		role = (RolePrincipal)roles.next();
        		if( role.getName().equalsIgnoreCase(Constants.CORP_ADMIN_ROLE)) {
        			break;
        		}
        	}
        	if( role != null ) {
                log.debug("assigning of corp admin role");
        		mgr.assignRole(newSecurityUser, role, corpAppSubject);
        	}
            else {
                log.error("Can't find corp admins role '"+Constants.CORP_ADMIN_ROLE+"'");
            }
            
            
            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
            long userID = newSecurityUser.getId();
            
            // transaction boundary
            tx = Util.beginTransaction();

            // user first, last names            
            User userTable = (
                (UserHome)icEJB.lookup(UserHome.EJB_REF_NAME)
            ).create();
            userTable.createUser(userID, userName, 'A');
            userTable.setFirstName(userID, firstName);
            userTable.setLastName(userID, lastName);
            
            // company item for user
            Company companyTable = ( 
                (CompanyHome)icEJB.lookup(CompanyHome.EJB_REF_NAME)
            ).create();
            long companyID = companyTable.createCompany();
            companyTable.setName(companyID, company);

            // link primary user with company            
            Contact contactTable = (
                (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
            ).create();            
            contactTable.createContact(companyID, userID);
            contactTable.setTitle(userID, title);
            companyTable.setPrimaryContactId(companyID, userID);
            
            // setup email for user
            Email emailTable = (
                (EmailHome)icEJB.lookup(EmailHome.EJB_REF_NAME)
            ).create();
            long emailID = emailTable.createEmail(userID);
            emailTable.setPrimaryEmailId(userID, emailID);
            emailTable.setAddress(emailID, email);
            
            
            // create address item for user
            Address addrTable = (
                (AddressHome)icEJB.lookup(AddressHome.EJB_REF_NAME)
            ).create();
            long addrID = addrTable.createAddress();
            addrTable.setAddress1(addrID, compAddress1);
            addrTable.setAddress2(addrID, compAddress2);
            addrTable.setCity(addrID, city);
            addrTable.setStateCode(addrID, state);
            addrTable.setZip(addrID, zip);
            addrTable.setCountryCode(addrID, country);
            
            // link address to the user
            UserAddress xrefUserAddr = (
                (UserAddressHome)icEJB.lookup(UserAddressHome.EJB_REF_NAME)
            ).create();
            xrefUserAddr.createUserAddress(userID, addrID);
            
            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = phoneTable.createPhone(userID);
            phoneTable.setPrimaryPhoneId(userID, phoneID);
            phoneTable.setNumber(phoneID, phone);
            
            // int t = 0;
            // System.err.println(1/t);
            tx.commit();
        }
        catch(Exception exc) {
            rollbackRoutine(tx, newSecurityUser, mgr, corpAppSubject);
            throw exc;
        }
        finally {
            Util.closeIC(icEJB);
        }
    }

    /**
     * 
     * @param key
     * @param value
     * @param message
     * @return boolean
     */    
    private boolean checkAgainstDB(
        String key,
        String value,
        String message
    )
    {
        InitialContext ic = null;
        boolean techProblems = false;
        boolean success = false;
        try {
            ic = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
            Request stateRequest = new Request();
            if( KEY_STATE.equals(key) ) {
                stateRequest.setContentHandle("cmd-state-name-from-id");
                stateRequest.setProperty("stateID", value );
            }
            else {
                stateRequest.setContentHandle("cmd-country-name-from-id");
                stateRequest.setProperty("countryID", value );
            }
            DataAccessInt dai = new DataAccess(
                (DataSource) ic.lookup(Constants.JTA_DATA_SOURCE)
            );
            Map state = dai.getData(stateRequest);
            ResultSetContainer rsc;
            if( KEY_STATE.equals(key) ) {
                rsc = (ResultSetContainer) state.get("qry-state-name-from-id");
            }
            else {
                rsc = (ResultSetContainer) state.get("qry-country-name-from-id");
            }
            success = rsc.getRowCount() == 1;
        }
        catch(NamingException ne) {
            techProblems = true;
            log.error("NamingException - primary registration process ["+key+"]");
            ne.printStackTrace();
        }
        catch(Exception e) {
            techProblems = true;
            log.error("Exception - primary registration process ["+key+"]");
            e.printStackTrace();
        }
        finally {
            Util.closeIC(ic);
            if( techProblems ) {
                markFormFieldAsInvalid(
                    key,
                    "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        if( !success ) {
            markFormFieldAsInvalid(key, message);
        }
        return success;
    }

    /**
     * 
     * @return boolean
     */    
    private boolean isPrimaryContact() throws Exception {
        if( authToken.getActiveUser().isAnonymous() ) {
            return false;
        }

        long userID = authToken.getActiveUser().getId();
        InitialContext icEJB = null;
        try {
            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
            Contact contactTable = (
                (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
            ).create();
            long companyID = contactTable.getCompanyId(userID);
            Company companyTable = (
                (CompanyHome)icEJB.lookup(CompanyHome.EJB_REF_NAME)
            ).create();
            long primaryContactID = companyTable.getPrimaryContactId(companyID);
            return primaryContactID == userID; 
        }
        catch(Exception ex) {
            throw new Exception("Error accessing DB company tables");
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
    
    /**
     * Fetches a few fields required for primary person. These are Title,
     * Company, Address, City, State, Zip, Country
     */
    protected void retrieveAdditionalFields(InitialContext icEJB, long userID)
    throws NamingException, RemoteException, CreateException
    {
        // title item for user
        Contact contactTable = (
            (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
        ).create();
        long companyID = contactTable.getCompanyId(userID);
        title = contactTable.getTitle(userID);
        setFormFieldDefault(KEY_TITLE, title);
        
        // company item for user
        Company companyTable = (
            (CompanyHome)icEJB.lookup(CompanyHome.EJB_REF_NAME)
        ).create();
        company = companyTable.getName(companyID);
        setFormFieldDefault(KEY_COMPANY, company);
        
        // address item for user
        UserAddress xrefUserAddr = (
            (UserAddressHome)icEJB.lookup(UserAddressHome.EJB_REF_NAME)
        ).create();
        long addrID = 101; // until next method implemented
//        addrID = xrefUserAddr.getAddressID(userID);
        
        Address addrTable = (
            (AddressHome)icEJB.lookup(AddressHome.EJB_REF_NAME)
        ).create();
        compAddress1 = addrTable.getAddress1(addrID);
        setFormFieldDefault(KEY_ADDRLINE1, compAddress1);
        
        compAddress2 = addrTable.getAddress2(addrID);
        setFormFieldDefault(KEY_ADDRLINE2, compAddress2);
        
        city = addrTable.getCity(addrID);
        setFormFieldDefault(KEY_CITY, city);
        
        state = addrTable.getStateCode(addrID);
        setFormFieldDefault(KEY_STATE, state);
        
        zip = addrTable.getZip(addrID);
        setFormFieldDefault(KEY_ZIP, zip);
        
        country = addrTable.getCountryCode(addrID);
        setFormFieldDefault(KEY_COUNTRY, country);
    }
}
