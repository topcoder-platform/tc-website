package com.topcoder.web.corp.request;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.NamingException;
import javax.transaction.Transaction;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Util;

/**
 * This class contains some sommen methods for form processing
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
abstract class BaseRegistration extends BaseProcessor {
    public static final String KEY_TARGET_USER_ID = "id";
    
    protected String firstName;
    protected String lastName;
    protected String userName;
    protected String phone;
    protected String password;
    protected String password2;
    protected String email;
    
    

//    private final static Logger log = Logger.getLogger(BaseRegistration.class);
   
//    public static final String KEY_FIRSTNAME    = "prim-first-name";
//    public static final String KEY_LASTNAME     = "prim-last-name";
//    public static final String KEY_TITLE        = "prim-title";
//    public static final String KEY_COMPANY      = "prim-company-name";
//    public static final String KEY_ADDRLINE1    = "prim-company-address-1";
//    public static final String KEY_ADDRLINE2    = "prim-company-address-2";
//    public static final String KEY_CITY         = "prim-company-city";
//    public static final String KEY_STATE        = "prim-company-state";
//    public static final String KEY_ZIP          = "prim-company-zip";
//    public static final String KEY_COUNTRY      = "prim-company-country";
//    public static final String KEY_PHONE        = "prim-phone";
//    public static final String KEY_LOGIN        = "prim-username";
//    public static final String KEY_PASSWORD1    = "prim-password";
//    public static final String KEY_PASSWORD2    = "prim-password-once-more";
//    public static final String KEY_EMAIL1       = "prim-email";
//    public static final String KEY_EMAIL2       = "prim-email-once-more";
//
//    private String firstName;
//    private String lastName;
//    private String title;
//    private String company;
//    private String compAddress1;
//    private String compAddress2;
//    private String city;
//    private String state;
//    private String zip;
//    private String country;
//    private String phone;
//    private String userName;
//    private String password;
//    private String password2;
//
//    private String email;
//    private String email2;
//    
//    private boolean stateFieldEmpty = false;
//    private boolean countryFieldEmpty = false;
//    
//    public BaseRegistration() {
//        pageInContext = true;
//        // For this processor next page is always in the context. It is either
//        // same form page (if any errors were encountered) or next workflow page
//        // (something like to thank u very much for registration)
//        }
//    
//    /**
//     * @see com.topcoder.web.common.AbstractRequestProcessor#businessProcessing()
//     */
//    void businessProcessing() throws Exception {
//        // for all methods except POST
//        //just return form to the user
//        if( ! "POST".equals(request.getMethod()) ) {
//                nextPage = "/reg/Registration.jsp";
//                return;
//        }
//        
//        //log.debug("business processing ("+request.getMethod()+")");
//        // well, user filled the form
//        // and possible he thinks that it is allright
//        // so lets prove that he is wrong
//        firstName      = (String) request.getParameter(KEY_FIRSTNAME);
//        lastName       = (String) request.getParameter(KEY_LASTNAME);
//        title          = (String) request.getParameter(KEY_TITLE);
//        company        = (String) request.getParameter(KEY_COMPANY);
//        compAddress1   = (String) request.getParameter(KEY_ADDRLINE1);
//        compAddress2   = (String) request.getParameter(KEY_ADDRLINE2);
//        city           = (String) request.getParameter(KEY_CITY);
//        state          = (String) request.getParameter(KEY_STATE);
//        zip            = (String) request.getParameter(KEY_ZIP);
//        country        = (String) request.getParameter(KEY_COUNTRY);
//        phone          = (String) request.getParameter(KEY_PHONE);
//        userName       = (String) request.getParameter(KEY_LOGIN);
//        password       = (String) request.getParameter(KEY_PASSWORD1);
//        password2      = (String) request.getParameter(KEY_PASSWORD2);
//        email          = (String) request.getParameter(KEY_EMAIL1);
//        email2         = (String) request.getParameter(KEY_EMAIL2);
//        
//        try {
//            stateFieldEmpty = Integer.parseInt(state) == -1;
//        }
//        catch(Exception ignore ) {}
//        
//        try {
//            countryFieldEmpty = Integer.parseInt(country) == -1;
//        }
//        catch(Exception ignore ) {}
//
//        boolean formDataValid = isValid();
//        if( formDataValid ) {
//                log.debug("data entered seem to be valid");
//
//                makePersistent();
//            nextPage = "/reg/RegSuccess.jsp";
//        }
//        else {
//            log.debug("invalid data entered");
//            nextPage = "/reg/Registration.jsp";
//        }
//    }
//    
//    /**
//     * performs validity checks of data entered by user
//     * @return boolean true if all seems to be valid
//     */
//    private boolean isValid() {
//        boolean ret = true;
//        
//        ret &=  // first name validity check 
//        checkItemValidity(KEY_FIRSTNAME, firstName, 
//            StringUtils.ALPHABET_ALPHA_EN, true, 1,
//            "Ensure first name is not empty, consists of letters and has not spaces inside"
//        );
//
//        ret &= // last name validity check 
//        checkItemValidity(KEY_LASTNAME, lastName, 
//            StringUtils.ALPHABET_ALPHA_EN, true, 1,
//            "Ensure last name is not empty, consists of letters and has not spaces inside"
//        );
//
//        ret &= // title name validity 
//        checkItemValidity(KEY_TITLE, title, 
//            StringUtils.ALPHABET_ALPHA_PUNCT_EN, true, 5,
//            "Ensure title is not empty, consists of letters and punctuation signs only"
//        );
//
//        ret &= // company name validity (optional)
//        checkItemValidity(KEY_COMPANY, company,
//            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
//            "Ensure company name consists of letters, digits and punctuation signs only (no more than 7 words)"
//        );
//
//        ret &= // addr line 1 validity (optional)
//        checkItemValidity(KEY_ADDRLINE1, compAddress1, 
//            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
//            "Ensure address line 1 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
//        );
//
//        ret &= // addr line 2 validity (optional)
//        checkItemValidity(KEY_ADDRLINE2, compAddress2, 
//            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 7,
//            "Ensure address line 2 is not empty, consists of letters, digits and punctuation signs only (no more than 7 words)"
//        );
//
//        ret &= // city validity (optional) 
//        checkItemValidity(KEY_CITY, city, 
//            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, false, 3,
//            "Ensure city is not empty, consists of letters, digits and punctuation signs only (no more than 3 words)"
//        );
//
//        if( !stateFieldEmpty ) {        
//            ret &= // state validity (optional)
//            checkAgainstDB(
//                KEY_STATE, 
//                state,
//                "Please choose state from the list carefully"
//            );
//        }
//
//        if( !countryFieldEmpty ) {
//            ret &= // country validity (optional)
//            checkAgainstDB(
//                KEY_COUNTRY,
//                country,
//                "Please choose country from the list carefully"
//            );
//        }
//
//        ret &= // zip validity (optional)
//        checkItemValidity(KEY_ZIP, zip, StringUtils.ALPHABET_DIGITS_EN, 
//            false, 1, "Ensure ZIP code is not empty and, consists of digits only"
//        );
//        
//        ret &= // phone validity
//        checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_NUM_PUNCT_EN, 
//            true, 1, 
//            "Ensure phone is not empty and, consists of digits only (minus sign is allowed too)"
//        );
//
//        ret &= // username validity
//        checkUsernameValidity();
//
//        ret &= // password validity
//        checkItemValidity(KEY_PASSWORD1, password, 
//            StringUtils.ALPHABET_ALPHA_NUM_EN, true, 1,
//            "Ensure password is not empty and, consists of letters and digits only"
//        );
//
//        // password2 validity
//        if( password2 == null ) password2 = "";
//        setFormFieldDefault(KEY_PASSWORD2, password2);
//        if( ! password2.equals(password) ) {
//            markFormFieldAsInvalid(
//                KEY_PASSWORD2, 
//                "Passwords entered must be same in the both fields"
//            );
//            ret = false;
//        }
//        
//        ret &= // email validity
//        checkItemValidity(KEY_EMAIL1, email, 
//            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
//            "Ensure email address is not empty and, has written correct"
//        );
//
//        // email2 validity
//        if( email2 == null ) email2 = "";
//        setFormFieldDefault(KEY_EMAIL2, email2);
//        if( ! email2.equals(email) ) {
//            markFormFieldAsInvalid(
//                KEY_EMAIL2,
//                "e-mail addresses entered must be same in the both fields"
//            );
//            ret = false;
//            }
//        return ret;
//    }
//    
//

    /**
     * simplified validity check - does not use alphabets
     * 
     */
    protected boolean simpleValidityCheck(
        String itemKey,
        String itemValue,
        int minLen, int maxLen,
        String errMsg
    )
    {
        if( itemValue==null || 
            itemValue.length()<minLen ||
            itemValue.length()>maxLen
        )
        {
            markFormFieldAsInvalid(itemKey, errMsg);
            return false;
        }
        
        return true;
    }
    

    /**
     * Item validity check. Returns if item is valid 
     */
    protected boolean checkItemValidity(
        String itemKey, 
        String itemValue, 
        String alphabet, 
        boolean required,
        int maxWords,
        String errMsg
    )
    {
        boolean ret = true;
        boolean chkMore = true;
        
        setFormFieldDefault(itemKey, itemValue == null ? "" : itemValue);
        
        if( !required ) {
            if( itemValue == null || itemValue.length() == 0 ) {
                chkMore = false;
            }
        }
        if( ! chkMore ) return ret;
        
        // either this field is required or (optional and not empty)
        if( itemValue == null || itemValue.length() == 0 ) {
            ret = false;
            markFormFieldAsInvalid(itemKey, errMsg);
        }
        else {
            //  alphabet check
            if( (! StringUtils.consistsOf(itemValue, alphabet, true )) )  {
                ret = false;
                markFormFieldAsInvalid(itemKey, errMsg);
            }
            else {
                if( maxWords <= 1 ) maxWords = 1;
                
                if( ! StringUtils.hasNotMoreWords(itemValue, maxWords) ) {
                    ret = false;
                    markFormFieldAsInvalid(itemKey, errMsg);
                }
            }
        }
        return ret;
    }
//    
//    /**
//     * Makes user data persistent. Not implemented yet (until ejbs will be
//     * ready).
//     */
//    private void makePersistent()
//    throws MisconfigurationException, RemoteException, CreateException,
//            NamingException, Exception 
//    {
//        // first of all we are needed in TCSubject of web-application itself
//        // it must be supplied when creating security user via security
//        // component
//        TCSubject corpAppSubject = null;
//        try {
//            corpAppSubject = Util.retrieveTCSubject(Constants.CORP_PRINCIPAL);
//        }
//        catch(Exception cause) {
//            cause.printStackTrace();
//            throw new MisconfigurationException(
//                "Can't retrieve TCSubject for corp web application"
////                , cause
//            );
//        }
//        
//        // will create security user at first
//        PrincipalMgrRemote mgr = null;
//        InitialContext icEJB = null;
//        Transaction tx = null;
//        UserPrincipal newSecurityUser = null;
//        try {
//            mgr = Util.getPrincipalManager();
//            newSecurityUser = mgr.createUser(userName, password, corpAppSubject);
//            Iterator groups = mgr.getGroups(corpAppSubject).iterator();
//            GroupPrincipal group = null;
//            while(groups.hasNext()) {
//                group = (GroupPrincipal)groups.next();
//                if( group.getName().equalsIgnoreCase("Corp User")) {
//                    break;
//                }
//            }
//            if( group != null ) {
//                log.debug("including to the 'Corp User' group");
//                mgr.addUserToGroup(group, newSecurityUser, corpAppSubject);
//            }
//            // becase user is company primary person,
//            // grant 'Corp Company Admin' role to he
//            Iterator roles = mgr.getRoles(corpAppSubject).iterator();
//        	RolePrincipal role = null;
//        	while(roles.hasNext()) {
//        		role = (RolePrincipal)roles.next();
//        		if( role.getName().equalsIgnoreCase("Corp Company Admin")) {
//        			break;
//        		}
//        	}
//        	if( role != null ) {
//                log.debug("assigning 'Company Admin' role");
//        		mgr.assignRole(newSecurityUser, role, corpAppSubject);
//        	}
//            
//            
//            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);
//            long userID = newSecurityUser.getId();
//            
//            // transaction boundary
//            tx = Util.beginTransaction();
//
//            // user first, last names            
//            User userTable = (
//                (UserHome)icEJB.lookup(UserHome.EJB_REF_NAME)
//            ).create();
//            userTable.createUser(userID, userName);
//            userTable.setFirstName(userID, firstName);
//            userTable.setLastName(userID, lastName);
//            
//            // company item for user
//            Company companyTable = ( 
//                (CompanyHome)icEJB.lookup(CompanyHome.EJB_REF_NAME)
//            ).create();
//            long companyID = companyTable.createCompany();
//            companyTable.setName(companyID, company);
//
//            // link primary user with company            
//            Contact contactTable = (
//                (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
//            ).create();            
//            contactTable.createContact(companyID, userID);
//            contactTable.setTitle(userID, title);
//            companyTable.setPrimaryContactId(companyID, userID);
//            
//            // setup email for user
//            Email emailTable = (
//                (EmailHome)icEJB.lookup(EmailHome.EJB_REF_NAME)
//            ).create();
//            long emailID = emailTable.createEmail(userID);
//            emailTable.setAddress(userID, emailID, email);
//            
//            // create address item for user
//            Address addrTable = (
//                (AddressHome)icEJB.lookup(AddressHome.EJB_REF_NAME)
//            ).create();
//            long addrID = addrTable.createAddress();
//            addrTable.setAddress1(addrID, compAddress1);
//            addrTable.setAddress2(addrID, compAddress2);
//            addrTable.setCity(addrID, city);
//            if( !stateFieldEmpty ) {
//                addrTable.setStateCode(addrID, state);
//            }
//            addrTable.setZip(addrID, zip);
//            if( ! countryFieldEmpty ) {
//                addrTable.setCountryCode(addrID, country);
//            }
//            
//            // link address to the user
//            UserAddress xrefUserAddr = (
//                (UserAddressHome)icEJB.lookup(UserAddressHome.EJB_REF_NAME)
//            ).create();
//            xrefUserAddr.createUserAddress(userID, addrID);
//            
//            // phone
//            Phone phoneTable = (
//                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
//            ).create();
//            long phoneID = phoneTable.createPhone(userID);
//            phoneTable.setNumber(userID, phoneID, phone);
//            
//            // int t = 0;
//            // System.err.println(1/t);
//            tx.commit();
//        }
//        catch(Exception exc) {
//            rollbackRoutine(tx, newSecurityUser, mgr, corpAppSubject);
//            throw exc;
//        }
//        finally {
//            Util.closeIC(icEJB);
//        }
//    }
//
    /**
     * Performs transaction rollback
     * 
     * @param tx
     * @param user
     * @param mgr
     * @param corpAppSubject
     */    
    protected void rollbackRoutine(
        Transaction tx,
        UserPrincipal user,
        PrincipalMgrRemote mgr,
        TCSubject corpAppSubject
    )
    {
        if( tx != null ) {
            log.error("rolling transaction back "+tx);
            try {
                tx.rollback();
            }
            catch(Exception ignore) {
                ignore.printStackTrace();
                log.error("tx.roolback(): op has failed");
            }
        }
        if( user != null ) {
            // security user creation is performed by the remote component
            // (thus, outside of transaction scope) so we have remove it
            // by hands
            try {
                mgr.removeUser(user, corpAppSubject);
            }
            catch(Exception ignore) {
                ignore.printStackTrace();
                log.error("tx.roolback(): removing of security user has failed");
            }
        }
    }
    
    /**
     * Checks if login consists of valid symbols and will it be allowed by DB
     * rules (uniquiness)
     * @return boolean true if allowed
     */
    protected boolean checkUsernameValidity(String keyLogin) {
        boolean success;
        // check for length
        success = simpleValidityCheck(keyLogin, userName, 7, 15, 
            "Please enter a user name between 7 and 15 characters in length."
        );
        //as usually check against alphabet 
        success = checkItemValidity(keyLogin, userName, 
            StringUtils.ALPHABET_USERNAME_EN, true, 1,
            "Please include only letters, numbers, dashes, underscores and" +
            " periods."
        );
        if( !success ) {
            return false;
        }
        // and additionally check against DB - not implemented for now
        boolean techProblems = false;
        try {
            PrincipalMgrRemote mgr = Util.getPrincipalManager();
            
            try {
                success = false;
                UserPrincipal user = mgr.getUser(userName);
                markFormFieldAsInvalid(
                    keyLogin, "Please enter another user name."
                );
            }
            catch(NoSuchUserException nsue) {
                // it is fine - handle seem to be free yet
                success = true;
            }
        }
        catch(RemoteException re) {
            techProblems = true;
            log.error("RemoteException - user registration process");
            re.printStackTrace();
        }
        catch(CreateException ce) {
            techProblems = true;
            log.error("CreateException - user registration process");
            ce.printStackTrace();
        }
        catch(NamingException ne) {
            techProblems = true;
            log.error("NamingException - user registration process");
            ne.printStackTrace();
        }
        catch(GeneralSecurityException gse) {
            techProblems = true;
            log.error("GeneralSecurityException - user registration process");
            gse.printStackTrace();
        }
        finally {
//            Util.closeIC(ic);
            if( techProblems ) {
                markFormFieldAsInvalid(
                    keyLogin,
                    "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return success;
    }
}
