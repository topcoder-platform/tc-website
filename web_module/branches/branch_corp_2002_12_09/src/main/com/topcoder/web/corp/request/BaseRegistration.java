package com.topcoder.web.corp.request;

import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.Transaction;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserHome;

/**
 * This class contains some common methods for form processing
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
abstract class BaseRegistration extends BaseProcessor {
    public static final String KEY_TARGET_USER_ID = "id";
    
    public static final String KEY_FIRSTNAME    = "first-name";
    public static final String KEY_LASTNAME     = "last-name";
    public static final String KEY_LOGIN        = "username";
    public static final String KEY_PASSWORD     = "password";
    public static final String KEY_PASSWORD2    = "password-once-more";
    public static final String KEY_PHONE        = "phone";
    public static final String KEY_EMAIL        = "email";
    public static final String KEY_EMAIL2       = "email-once-more";
    
    protected String firstName;
    protected String lastName;
    protected String userName;
    protected String phone;
    protected String password;
    protected String password2;
    protected String email;
    protected String email2;
    
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
    private boolean checkUsernameValidity() {
        boolean success;
        // check for length
        success = simpleValidityCheck(KEY_LOGIN, userName, 1, 15, 
            "Please enter a user name between 1 and 15 characters in length."
        );
        //as usually check against alphabet 
        success = checkItemValidity(KEY_LOGIN, userName, 
            StringUtils.ALPHABET_USERNAME_EN, true, 1,
            "Please include only letters, numbers, dashes, underscores and" +
            " periods."
        );
        if( !success ) {
            return false;
        }
        // and additionally check against DB
        boolean techProblems = false;
        try {
            PrincipalMgrRemote mgr = Util.getPrincipalManager();
            
            try {
                success = false;
                UserPrincipal user = mgr.getUser(userName);
                markFormFieldAsInvalid(
                    KEY_LOGIN, "Please enter another user name."
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
            if( techProblems ) {
                markFormFieldAsInvalid(
                    KEY_LOGIN,
                    "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return success;
    }
    
    protected boolean genericValidityCheck(boolean forUpdate) {
        // passwords validity
        boolean valid = true;
        
        if( !forUpdate ) {
            valid &= // username validity
            checkUsernameValidity();
        }
        valid &= simpleValidityCheck(KEY_PASSWORD, password, 7, 15,
            "Please enter a password between 7 and 15 characters in length."
        );
        setFormFieldDefault(KEY_PASSWORD, password);

        if( password2 == null ) password2 = "";
        setFormFieldDefault(KEY_PASSWORD2, password2);
        if( ! password2.equals(password) ) {
            markFormFieldAsInvalid(
                KEY_PASSWORD2,
                "Passwords entered must be same in the both fields"
            );
            valid = false;
        }
        
        valid &=
        checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_PHONE_NUMBER,
            true, 1, "Please enter a valid phone number"
        );
        
        valid &= // email validity
        simpleValidityCheck(KEY_EMAIL, email, 1, 50,
            "Please enter an email address."
        );
        valid &=
        checkItemValidity(KEY_EMAIL, email,
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
            "Please enter a valid email address."
        );
        
        // email2 validity
        if( email2 == null ) email2 = "";
        setFormFieldDefault(KEY_EMAIL2, email2);
        if( ! email2.equals(email) ) {
            markFormFieldAsInvalid(
                KEY_EMAIL2,
                "e-mail addresses entered must be same in the both fields"
            );
            valid = false;
        }
        
        setFormFieldDefault(KEY_FIRSTNAME, firstName);
        valid &=  // first name validity check
        simpleValidityCheck(KEY_FIRSTNAME, firstName, 1, 50,
            "Please enter a first name."
        );

        setFormFieldDefault(KEY_LASTNAME, lastName);
        valid &= // last name validity check
        simpleValidityCheck(KEY_LASTNAME, lastName, 1, 50,
            "Please enter a last name."
        );
        return valid;
    }

    /**
     * Fetches entire form field set. Base fiesld are quyeried here and
     * additional will be populated in supplyed by subclass method
     * retrieveAdditionalFields
     * 
     * @param userID
     * @throws Exception
     */ 
    protected void retrieveFromDB(long userID) throws Exception {
        PrincipalMgrRemote mgr = null;
        InitialContext icEJB = null;
        Transaction tx = null;
        UserPrincipal securityUser = null;
        boolean createNewUser = userID < 0;
        try {
            mgr = Util.getPrincipalManager();
            securityUser = mgr.getUser(userID);

            setFormFieldDefault(KEY_LOGIN, securityUser.getName());
            String passw = mgr.getPassword(userID);
            setFormFieldDefault(KEY_PASSWORD, passw);
            setFormFieldDefault(KEY_PASSWORD2, passw);
            request.setAttribute(KEY_TARGET_USER_ID, ""+userID);

            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);

            // user first, last names
            User userTable = (
                (UserHome)icEJB.lookup(UserHome.EJB_REF_NAME)
            ).create();
            firstName = userTable.getFirstName(userID);
            setFormFieldDefault(KEY_FIRSTNAME, firstName);
            lastName = userTable.getLastName(userID);
            setFormFieldDefault(KEY_LASTNAME, lastName);

            // email for user
            Email emailTable = (
                (EmailHome)icEJB.lookup(EmailHome.EJB_REF_NAME)
            ).create();
            long emailID = emailTable.getPrimaryEmailId(userID);
            email = emailTable.getAddress(emailID);
            setFormFieldDefault(KEY_EMAIL, email);
            email2 = email;
            setFormFieldDefault(KEY_EMAIL2, email2);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = phoneTable.getPrimaryPhoneId(userID);
            phone = phoneTable.getNumber(phoneID);
            setFormFieldDefault(KEY_PHONE, phone);
            
            retrieveAdditionalFields(icEJB, userID);
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
 
    /**
     * Populates additional fields is requered by subclass
     * @param ic
     */ 
    protected abstract void retrieveAdditionalFields(
        InitialContext ic,
        long userID
    )
    throws Exception;
}
