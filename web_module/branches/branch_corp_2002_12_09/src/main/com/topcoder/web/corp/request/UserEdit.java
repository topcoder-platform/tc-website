package com.topcoder.web.corp.request;

import java.rmi.RemoteException;
import java.util.Enumeration;
import java.util.Iterator;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.Transaction;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.RolePrincipal;
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
    public static final String KEY_PASSWORD2      = "password-once-more";
    public static final String KEY_EMAIL          = "email";
    
    
    public UserEdit() {
        pageInContext = true;
    }

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    void businessProcessing() throws Exception {
        long targetUserID = -1;
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
        password       = (String) request.getParameter(KEY_PASSWORD);
        password2      = (String) request.getParameter(KEY_PASSWORD2);
        email          = (String) request.getParameter(KEY_EMAIL);

        boolean forUpdate = targetUserID >= 0;
        
        if( forUpdate ) {
            userName = Util.getPrincipalManager().getUser(targetUserID).getName();
        }
        else {
            userName   = (String) request.getParameter(KEY_LOGIN);
        }
        boolean formDataValid = isValid(forUpdate);
        if( formDataValid ) {
            log.debug("data entered seem to be valid");
            targetUserID = makePersistent(targetUserID);
        }
        else {
            log.debug("invalid data entered");
        }
        setFormFieldDefault(KEY_LOGIN, userName);
        if( targetUserID != -1 ) {
            request.setAttribute(KEY_TARGET_USER_ID, ""+targetUserID);
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

        setFormFieldDefault(KEY_FIRSTNAME, firstName);
        ret &=  // first name validity check
        simpleValidityCheck(KEY_FIRSTNAME, firstName, 1, 50,
            "Please enter a first name."
        );

        setFormFieldDefault(KEY_LASTNAME, lastName);
        ret &= // last name validity check
        simpleValidityCheck(KEY_LASTNAME, lastName, 1, 50,
            "Please enter a last name."
        );

        ret &= // phone validity
        simpleValidityCheck(KEY_PHONE, phone, 1, 30,
            "Please enter a phone number"
        );
        ret &=
        checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_PHONE_NUMBER,
            true, 1, "Please enter a valid phone number"
        );

        if( !forUpdate ) {
            ret &= // username validity
            checkUsernameValidity(KEY_LOGIN);
        }

        setFormFieldDefault(KEY_PASSWORD, password);
        ret &= // password validity
        simpleValidityCheck(KEY_PASSWORD, password, 7, 15,
            "Please enter a password between 7 and 15 characters in length."
        );
        // password2 validity
        if( password2 == null ) password2 = "";
        setFormFieldDefault(KEY_PASSWORD2, password2);
        if( ! password2.equals(password) ) {
            markFormFieldAsInvalid(
                KEY_PASSWORD2,
                "Passwords entered must be same in the both fields"
            );
            ret = false;
        }

        ret &= // email validity
        simpleValidityCheck(KEY_EMAIL, email, 1, 50,
            "Please enter an email address."
        );
        ret &=
        checkItemValidity(KEY_EMAIL, email,
            StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
            "Please enter a valid email address."
        );
        return ret;
    }

    /**
     * Makes user data persistent.
     * 
     */
    private long makePersistent(long userID)
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
                GroupPrincipal group = null;
                securityUser = mgr.createUser(userName, password, primaryContact);
                Iterator groups = mgr.getGroups(primaryContact).iterator();
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
                userTable.createUser(userID, userName, 'A');
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
                emailID = emailTable.getPrimaryEmailId(userID);
            }
            else {
                emailID = emailTable.createEmail(userID);
                emailTable.setPrimaryEmailId(userID, emailID);
            }
            emailTable.setAddress(userID, emailID, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID;
            if( !createNewUser ) {
                phoneID = phoneTable.getPrimaryPhoneId(userID);
            }
            else {
                phoneID = phoneTable.createPhone(userID);
                phoneTable.setPrimaryPhoneId(userID, phoneID);
            }
            phoneTable.setNumber(userID, phoneID, phone);

            // set up additional permissions            
            if( userID != primContactID ) {
                Enumeration e = request.getParameterNames();
                while( e.hasMoreElements() ) {
                    String pName = (String)e.nextElement();
                    if( ! pName.startsWith("permid-")) continue;
                    long permID = -1;
                    try {
                        permID = Long.parseLong(
                            pName.substring("permid-".length())
                        );
                    }
                    catch(Exception ignore) {
                        continue;
                    }
                    String pValue = (String) request.getParameter("perm-"+permID);
                    boolean set = "on".equalsIgnoreCase(pValue);
                    RolePrincipal role = mgr.getRole(permID);
                    if( set ) {
                        mgr.assignRole(securityUser, role, primaryContact);
                    }
                    else {
                        mgr.unAssignRole(securityUser, role, primaryContact);
                    }
                }
            }
            // int t = 0;
            // System.err.println(1/t);
            tx.commit();
            return userID;
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
            email = emailTable.getAddress(userID, emailID); 
            setFormFieldDefault(KEY_EMAIL, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = phoneTable.getPrimaryPhoneId(userID);
            phone = phoneTable.getNumber(userID, phoneID);
            setFormFieldDefault(KEY_PHONE, phone);
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
}
