package com.topcoder.web.corp.request;

import java.rmi.RemoteException;
import java.util.Iterator;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.Transaction;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.login.AuthenticationException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserHome;

/**
 * This processing module is responsible for user creation/modification. 
 * 
 * 
 * @author djFD molc@mail.ru
 * @version 1.02
 */
public class UserEdit extends BaseRegistration {
    private static final String formPage    = "/acc_admin/AddUser.jsp";
    
    public static final String KEY_FIRSTNAME      = "first-name";
    public static final String KEY_LASTNAME       = "last-name";
    public static final String KEY_PHONE          = "phone";
    public static final String KEY_LOGIN          = "username";
    public static final String KEY_PASSWORD       = "password";
    public static final String KEY_EMAIL          = "email";
    
    
    public UserEdit() {
        pageInContext = true;
        // For this processor next page is always in the context. It is either
        // same form page (if any errors were encountered) or next workflow page
        // (presumably same page from where he started the process)
    }

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        //check if user is logged in - *must be*
        if( authToken.getUser().isAnonymous() ) {
            throw new AuthenticationException(
                "You must be logged in to perform this action"
            );
        }
        
        // well, user is logged in
        // now we will define what action requested
        // if ID of user is omitted, is negative or absent (also if page is to
        // be fetched by non POST method) then will suppose that it
        // is 'user create' request
        int targetUserID = -1;
        try {
            targetUserID = Integer.parseInt(
                request.getParameter(KEY_TARGET_USER_ID)
            );
        }
        catch(Exception ignore) { }
        
        if( ! "POST".equalsIgnoreCase(request.getMethod()) ) {
            if( targetUserID >= 0 ) {
                // populate form with user data
                retrieveFromDB(targetUserID);
            }
            nextPage = formPage;
            return;
        }
            
        firstName      = (String) request.getParameter(KEY_FIRSTNAME);
        lastName       = (String) request.getParameter(KEY_LASTNAME);
        phone          = (String) request.getParameter(KEY_PHONE);
        userName       = (String) request.getParameter(KEY_LOGIN);
        password       = (String) request.getParameter(KEY_PASSWORD);
        email          = (String) request.getParameter(KEY_EMAIL);

        boolean forUpdate = targetUserID >= 0;
        boolean formDataValid = isValid(forUpdate);
        if( formDataValid ) {
            log.debug("data entered seem to be valid");
            makePersistent(targetUserID);
        }
        else {
            log.debug("invalid data entered");
        }
        nextPage = formPage;
    }
    
    /**
     * performs validity checks of data entered by user
     * @return boolean true if all seems to be valid
     */
    private boolean isValid(boolean forUpdate) {
        log.debug("forUpdate="+forUpdate);
        boolean ret = true;

        ret &=  // first name validity check
        checkItemValidity(KEY_FIRSTNAME, firstName,
            StringUtils.ALPHABET_ALPHA_EN, true, 1,
            "Ensure first name is not empty, consists of letters and has not "+
            "spaces inside"
        );

        ret &= // last name validity check
        checkItemValidity(KEY_LASTNAME, lastName,
            StringUtils.ALPHABET_ALPHA_EN, true, 1,
            "Ensure last name is not empty, consists of letters and has not "+
            "spaces inside"
        );

        ret &= // phone validity
        checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_NUM_PUNCT_EN,
            true, 1,
            "Ensure phone is not empty and, consists of digits only "+
            "(minus sign is allowed too)"
        );

        ret &= // username validity
        checkUsernameValidity(KEY_LOGIN, forUpdate);

        ret &= // password validity
        checkItemValidity(KEY_PASSWORD, password,
            StringUtils.ALPHABET_ALPHA_NUM_EN, true, 1,
            "Ensure password is not empty and, consists of letters and "+
            "digits only"
        );

        ret &= // email validity
        checkItemValidity(KEY_EMAIL, email,
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
            "Ensure email address is not empty and, has written correct"
        );
        return ret;
    }

    /**
     * Makes user data persistent.
     * 
     */
    private void makePersistent(long userID)
    throws GeneralSecurityException, RemoteException, CreateException,
            NamingException, Exception
    {
        // first of all we are needed in TCSubject of primary user
        TCSubject primaryContact = null;
        long primContactID = authToken.getActiveUser().getId(); 
        try {
            primaryContact = Util.retrieveTCSubject(primContactID);
        }
        catch(Exception cause) {
            cause.printStackTrace();
            throw new GeneralSecurityException(
                "Can't retrieve TCSubject for primary contact person [id="+
                primContactID+"]"
            );
        }
        
        PrincipalMgrRemote mgr = null;
        InitialContext icEJB = null;
        Transaction tx = null;
        UserPrincipal securityUser = null;
        boolean createNewUser = userID < 0;
        try {
            mgr = Util.getPrincipalManager();
            if( createNewUser ) { // new user creation
                securityUser = mgr.createUser(userName, password, primaryContact);
                Iterator groups = mgr.getGroups(primaryContact).iterator();
                GroupPrincipal group = null;
                while(groups.hasNext()) {
                    group = (GroupPrincipal)groups.next();
                    if( group.getName().equalsIgnoreCase("Corp User")) {
                        break;
                    }
                }
                if( group != null ) {
                    log.debug("including to the 'Corp User' group");
                    mgr.addUserToGroup(group, securityUser, primaryContact);
                }
                userID = securityUser.getId();
            }
            else { // modification of existent user
                securityUser = mgr.getUser(userID);
                log.debug("edit password");
                mgr.editPassword(securityUser, password, primaryContact);
            }

            icEJB = new InitialContext(Constants.EJB_CONTEXT_ENVIRONMENT);

            // transaction boundary
            tx = Util.beginTransaction();

            // user first, last names
            User userTable = (
                (UserHome)icEJB.lookup(UserHome.EJB_REF_NAME)
            ).create();
            if( createNewUser ) {
                userTable.createUser(userID, userName);
            }
            userTable.setFirstName(userID, firstName);
            userTable.setLastName(userID, lastName);

            if( createNewUser ) {
                // find company item for user
                Contact contactTable = (
                    (ContactHome)icEJB.lookup(ContactHome.EJB_REF_NAME)
                ).create();
                long companyID = contactTable.getCompanyId(primContactID);
            
                // link user with company
                contactTable.createContact(companyID, userID);
            }
            
            // setup email for user
            Email emailTable = (
                (EmailHome)icEJB.lookup(EmailHome.EJB_REF_NAME)
            ).create();
            long emailID;
            if( ! createNewUser ) {
                emailID = emailTable.getEmailID(userID);
            }
            else {
                emailID = emailTable.createEmail(userID);
            }
            emailTable.setAddress(userID, emailID, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID;
            if( !createNewUser ) {
                phoneID = phoneTable.getPhoneId(userID);
            }
            else {
                phoneID = phoneTable.createPhone(userID);
            }
            phoneTable.setNumber(userID, phoneID, phone);

            // int t = 0;
            // System.err.println(1/t);
            tx.commit();
        }
        catch(Exception exc) {
            rollbackRoutine(tx, securityUser, mgr, primaryContact);
            throw exc;
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
    
    private void retrieveFromDB(long userID) throws Exception {
        PrincipalMgrRemote mgr = null;
        InitialContext icEJB = null;
        Transaction tx = null;
        UserPrincipal securityUser = null;
        boolean createNewUser = userID < 0;
        try {
            mgr = Util.getPrincipalManager();
            securityUser = mgr.getUser(userID);
            
            setFormFieldDefault(KEY_LOGIN, securityUser.getName());
            setFormFieldDefault(KEY_PASSWORD, mgr.getPassword(userID));
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
            long emailID = emailTable.getEmailID(userID);
            email = emailTable.getAddress(userID, emailID); 
            setFormFieldDefault(KEY_EMAIL, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = phoneTable.getPhoneId(userID);
            phone = phoneTable.getNumber(userID, phoneID);
            setFormFieldDefault(KEY_PHONE, phone);

            // int t = 0;
            // System.err.println(1/t);
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
}
