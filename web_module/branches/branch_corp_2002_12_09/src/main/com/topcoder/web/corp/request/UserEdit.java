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
        catch(Exception ignore) {}

        if( targetUserID == -1 && ! authToken.getActiveUser().isAnonymous() ) {
            targetUserID = authToken.getActiveUser().getId();
        }
        log.debug("target user id ["+targetUserID+"]");
        if( ! "POST".equalsIgnoreCase(request.getMethod()) ) {
            if( targetUserID >= 0 ) {
                // populate form with user data
                retrieveFromDB(targetUserID);
            }
            nextPage = Constants.USEREDIT_PAGE_RETRY;
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
        boolean formDataValid = genericValidityCheck(forUpdate);
        if( formDataValid ) {
            log.debug("data entered seem to be valid");
            targetUserID = makePersistent(targetUserID);
            nextPage = Constants.USEREDIT_PAGE_SUCCESS;
        }
        else {
            log.debug("invalid data entered");
            nextPage = Constants.USEREDIT_PAGE_RETRY;
        }
        setFormFieldDefault(KEY_LOGIN, userName);
        if( targetUserID != -1 ) {
            request.setAttribute(KEY_TARGET_USER_ID, ""+targetUserID);
        }
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
                    if( group.getName().equalsIgnoreCase(Constants.CORP_GROUP)) {
                        break;
                    }
                }
                if( group != null ) {
                    log.debug("including to the corporate group");
                    mgr.addUserToGroup(group, securityUser, primaryContact);
                }
                else {
                    log.error("Can't find corporate group '"+Constants.CORP_GROUP+"'");
                }

                // as requested add user to the anonymous group
                groups = mgr.getGroups(primaryContact).iterator();
                group = null;
                while(groups.hasNext()) {
                    group = (GroupPrincipal)groups.next();
                    if( group.getName().equalsIgnoreCase(Constants.CORP_ANONYMOUS_GROUP)) {
                        break;
                    }
                }
                if( group != null ) {
                    log.debug("including to the anonymous group");
                    mgr.addUserToGroup(group, securityUser, primaryContact);
                }
                else {
                    log.error("Can't find anonymous group '"+Constants.CORP_ANONYMOUS_GROUP+"'");
                }
                
                
                
                userID = securityUser.getId();
            }
            else { // modification of existent user
                securityUser = mgr.getUser(userID);
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
            long emailID = -1;
            if( ! createNewUser ) {
                emailID = emailTable.getPrimaryEmailId(userID);
            }
            if( emailID <= 0 ) {
                emailID = emailTable.createEmail(userID);
                emailTable.setPrimaryEmailId(userID, emailID);
            }
            emailTable.setAddress(emailID, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = -1;
            if( !createNewUser ) {
                phoneID = phoneTable.getPrimaryPhoneId(userID);
            }
            if( phoneID <= 0 ) {
                phoneID = phoneTable.createPhone(userID);
                phoneTable.setPrimaryPhoneId(userID, phoneID);
            }
            phoneTable.setNumber(phoneID, phone);

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
            email = emailTable.getAddress(emailID); 
            setFormFieldDefault(KEY_EMAIL, email);

            // phone
            Phone phoneTable = (
                (PhoneHome)icEJB.lookup(PhoneHome.EJB_REF_NAME)
            ).create();
            long phoneID = phoneTable.getPrimaryPhoneId(userID);
            phone = phoneTable.getNumber(phoneID);
            setFormFieldDefault(KEY_PHONE, phone);
        }
        finally {
            Util.closeIC(icEJB);
        }
    }
}
