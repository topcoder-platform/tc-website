package com.topcoder.web.corp.controller.request;

import com.topcoder.security.*;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.*;
import com.topcoder.web.corp.Constants;
import com.topcoder.web.corp.Util;
import com.topcoder.web.corp.controller.MisconfigurationException;
import com.topcoder.web.ejb.company.Company;
import com.topcoder.web.ejb.company.CompanyHome;
import com.topcoder.web.ejb.email.Email;
import com.topcoder.web.ejb.email.EmailHome;
import com.topcoder.web.ejb.phone.Phone;
import com.topcoder.web.ejb.phone.PhoneHome;
import com.topcoder.web.ejb.user.Contact;
import com.topcoder.web.ejb.user.ContactHome;
import com.topcoder.web.ejb.user.User;
import com.topcoder.web.ejb.user.UserHome;

import javax.ejb.CreateException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.transaction.Transaction;
import java.rmi.RemoteException;
import java.util.Enumeration;
import java.util.Map;

/**
 * This class contains some common methods for form processing
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class UserEdit extends BaseProcessor {
    private static Logger log = Logger.getLogger(UserEdit.class);

    public static final String KEY_TARGET_USER_ID = "id";
    public static final String KEY_FIRSTNAME = "first-name";
    public static final String KEY_LASTNAME = "last-name";
    public static final String KEY_LOGIN = "username";
    public static final String KEY_PASSWORD = "password";
    public static final String KEY_PASSWORD2 = "password-once-more";
    public static final String KEY_PHONE = "phone";
    public static final String KEY_EMAIL = "email";
    public static final String KEY_EMAIL2 = "email-once-more";
    public static final String KEY_USER_PERMS = "user-permissions";

    protected String firstName;
    protected String lastName;
    protected String userName = null;
    protected String phone;
    protected String password;
    protected String password2;
    protected String email;
    protected String email2;
    protected long targetUserID = -1;
    protected String formPage;
    protected String successPage;
    protected SecurityInfo secTok = null;

    public UserEdit() {
        setIsNextPageInContext(true);
        formPage = Constants.USEREDIT_PAGE_RETRY;
        successPage = Constants.USEREDIT_PAGE_SUCCESS;
    }

    protected void setNextPage() {
        setIsNextPageInContext(true);
        setNextPage(successPage);
    }

    /**
     * @see com.topcoder.web.common.BaseProcessor#businessProcessing()
     */
    protected final void businessProcessing() throws TCWebException {
        try {
            secTok = new SecurityInfo(getFormFields());
            log.debug(secTok.createNew ? "user creation intiated" : "user modification initiated");

            verifyAllowed();
            log.debug(secTok.createNew ? "verification passed: create" : "verification passed: edit");

            InitialContext icEJB = null;
            PrincipalMgrRemote mgr = null;

            if (loadUserData()) return;

            boolean formValid = verifyFormFieldsValidity();
            if (!formValid) {
                setFormFieldsDefaults();
                setNextPage(formPage);
                return;
            }
            // form is valid - store it
            icEJB = null;
            Transaction tx = null;
            String oldPass = null;
            try {
                mgr = Util.getPrincipalManager();

                // transaction boundary
                tx = Util.beginTransaction();

                if (secTok.createNew) {
                    secTok.targetUser = createUserPrincipal();
                    targetUserID = secTok.targetUser.getId();
                } else {
                    oldPass = mgr.getPassword(secTok.targetUser.getId());
                    mgr.editPassword(secTok.targetUser, password, secTok.requestor);
                }

                icEJB = TCContext.getInitial();
                storeUserDataIntoDB(icEJB);

                tx.commit();
            } catch (Exception exc) {
                rollbackHelper(tx, secTok.createNew, oldPass);
                throw exc;
            } finally {
                Util.closeIC(icEJB);
            }
        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            throw(new TCWebException(e));
        }

        setNextPage();
    }

    /**
     * this is a total hack to get this thing working.  what we really
     * need to do is decouple more of registration and user edit.
     * registration implements a real version of this.
     * @return
     * @throws java.lang.Exception
     */
    protected boolean loadUserData() throws Exception {
        if (!"POST".equalsIgnoreCase(getRequest().getMethod())) {
            if (!secTok.createNew) {
                PrincipalMgrRemote mgr = Util.getPrincipalManager();
                password = mgr.getPassword(targetUserID);
                password2 = password;
                userName = secTok.targetUser.getName();
                retrieveUserDataFromDB(TCContext.getInitial());
            }
            setFormFieldsDefaults();
            setNextPage(formPage);
            return true;
        }
        return false;
    }

    /**
     *
     * @param ic
     */
    protected void storeUserDataIntoDB(InitialContext ic)
            throws NamingException, CreateException, RemoteException,
            GeneralSecurityException, Exception {
        PrincipalMgrRemote mgr = secTok.man;
        commonFieldsStore(ic, secTok.createNew);

        // associate with company
        if (secTok.createNew) {
            // find company item for user
            Contact contactTable = ((ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)).create();
            // link user with company
            contactTable.createContact(secTok.primaryUserCompanyID, targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }

        if (targetUserID != getUser().getId()) {
            // set up additional permissions for non primary users
            Enumeration e = getRequest().getParameterNames();
            while (e.hasMoreElements()) {
                String pName = (String) e.nextElement();
                if (!pName.startsWith("permid-")) continue;

                long permID = -1;
                try {
                    permID = Long.parseLong(pName.substring("permid-".length()));
                } catch (Exception ignore) {
                    continue;
                }
                String pValue = getRequest().getParameter("perm-" + permID);
                boolean set = "on".equalsIgnoreCase(pValue);
                RolePrincipal role = mgr.getRole(permID);
                if (set) {
                    if (!hasRole(SecurityHelper.getUserSubject(targetUserID, true), role)) {
                        mgr.assignRole(secTok.targetUser, role, secTok.requestor);
                    }
                } else {
                    mgr.unAssignRole(secTok.targetUser, role, secTok.requestor);
                }
            }
            //refresh the cache on this person
            SecurityHelper.getUserSubject(targetUserID, true);
        }
    }

    private boolean hasRole(TCSubject user, RolePrincipal role) {
        RolePrincipal[] roles = (RolePrincipal[]) user.getPrincipals().toArray(new RolePrincipal[0]);
        for (int i = 0; i < roles.length; i++) {
            if (roles[i].equals(role)) return true;
        }
        return false;
    }


    /**
     * Fetches form fields from DB.
     *
     * @param ic initial DB EJB context
     * @throws java.lang.Exception
     */
    protected void retrieveUserDataFromDB(InitialContext ic) throws Exception {
        // user first, last names
        User userTable = ((UserHome) ic.lookup(UserHome.EJB_REF_NAME)).create();
        firstName = userTable.getFirstName(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        lastName = userTable.getLastName(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

        // email for user
        Email emailTable = ((EmailHome) ic.lookup(EmailHome.EJB_REF_NAME)).create();
        long emailID = emailTable.getPrimaryEmailId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        email = emailTable.getAddress(emailID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        email2 = email;

        // phone
        Phone phoneTable = ((PhoneHome) ic.lookup(PhoneHome.EJB_REF_NAME)).create();
        long phoneID = phoneTable.getPrimaryPhoneId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        phone = phoneTable.getNumber(phoneID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
    }

    /**
     *
     * @throws com.topcoder.web.common.PermissionException
     * @throws java.lang.Exception
     */
    protected void verifyAllowed()
            throws PermissionException, Exception {
        if (secTok.createNew) { // only primary persons are allowed to do it
            // so all others get switched into editor mode
            if (getAuthentication().getUser().isAnonymous()) { // not logged in
                throw new PermissionException(getUser(),
                        new ClassResource(this.getClass()), new Exception("You must be logged in to create a user."));
            }

            // user is logged in
/*
            if (!secTok.isAccountAdmin) { // primary user can create
                // other are still able to edit themself
                log.debug("switched to edit mode");
                targetUserID = getAuthentication().getUser().getId();
                secTok.createNew = false;
                secTok.renewTargetUser();
            }
*/
        } else { // edit mode
            // modifications is allowed if primary edits own group members
            // or regular user edits self
            if (secTok.isAccountAdmin) {
                // check if user belongs same company
                if (secTok.targetUserCompanyID != secTok.loggedUserCompanyID) {
                    throw new PermissionException(getUser(),
                            new ClassResource(this.getClass()), new Exception("You may only edit the accounts of employees at your company."));
                }
            } else { // regular member tries to edit user
                if (targetUserID != getAuthentication().getUser().getId()) {
                    throw new PermissionException(getUser(),
                            new ClassResource(this.getClass()), new Exception("You are not allowed to modify other users."));
                }
            }
        }
        return;
    }

    /**
     * Reads common fields for both registration types (primary, regular) from
     * the form.
     *
     * @return boolean createNew status. if true, then creation of the new user
     * was requested. If false, then it is modification request - so username
     * must be fetched from the DB by targetUserID value
     */
    protected boolean getFormFields() throws Exception {
        firstName = getRequest().getParameter(KEY_FIRSTNAME);
        lastName = getRequest().getParameter(KEY_LASTNAME);
        phone = getRequest().getParameter(KEY_PHONE);
        password = getRequest().getParameter(KEY_PASSWORD);
        password2 = getRequest().getParameter(KEY_PASSWORD2);
        email = getRequest().getParameter(KEY_EMAIL);
        email2 = getRequest().getParameter(KEY_EMAIL2);
        userName = getRequest().getParameter(KEY_LOGIN);

        // retrieve ID of user requested to be modified
        targetUserID = -1;
        try {
            targetUserID = Integer.parseInt(
                    getRequest().getParameter(KEY_TARGET_USER_ID)
            );
        } catch (Exception e) {
            //if there was an exception, just use -1
        }
        return targetUserID < 0;
    }

    /**
     * Populates common form's filelds with their default values (eiter
     * pulled from DB or entered by user).
     */
    protected void setFormFieldsDefaults() throws Exception {
        setDefault(KEY_FIRSTNAME, firstName);
        setDefault(KEY_LASTNAME, lastName);
        setDefault(KEY_PHONE, phone);
        setDefault(KEY_PASSWORD, password);
        setDefault(KEY_PASSWORD2, password2);
        setDefault(KEY_EMAIL, email);
        setDefault(KEY_EMAIL2, email2);
        setDefault(KEY_LOGIN, userName);
        if (targetUserID >= 0) {
            getRequest().setAttribute(KEY_TARGET_USER_ID, "" + targetUserID);
        }
        try {
            embedPermissions();
        } catch (Exception ignore) {
            log.error("Cant get user permissions. Only default ones will be available");
            ignore.printStackTrace();
        }
    }

    /**
     *
     * @return boolean
     */
    protected boolean verifyFormFieldsValidity() {
        // passwords validity
        boolean valid = true;

        if (secTok.createNew) {
            valid &= // username validity
                    verifyUsernameValidity();
        }
        valid &= simpleValidityCheck(KEY_PASSWORD, password, 7, 15,
                "Please enter a password between 7 and 15 characters in length."
        );
        if (password2 == null) password2 = "";
        if (!password2.equals(password)) {
            addError(
                    KEY_PASSWORD2,
                    "Passwords entered must be same in the both fields"
            );
            valid = false;
        }

        valid &=
                checkItemValidity(KEY_PHONE, phone, StringUtils.ALPHABET_PHONE_NUMBER,
                        true, -1, "Please enter a valid phone number"
                );

        valid &= // email validity
                simpleValidityCheck(KEY_EMAIL, email, 1, 50,
                        "Please enter an email address."
                );
        valid &=
                checkItemValidity(KEY_EMAIL, email,
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN + "@", true, 1,
                        "Please enter a valid email address."
                );

        // email2 validity
        if (email2 == null) email2 = "";
        if (!email2.equals(email)) {
            addError(
                    KEY_EMAIL2,
                    "e-mail addresses entered must be same in the both fields"
            );
            valid = false;
        }

        valid &= // first name validity check
                simpleValidityCheck(KEY_FIRSTNAME, firstName, 1, 50,
                        "Please enter a first name."
                );

        valid &= // last name validity check
                simpleValidityCheck(KEY_LASTNAME, lastName, 1, 50,
                        "Please enter a last name."
                );
        return valid;
    }

    /**
     * Checks if login consists of valid symbols and will it be allowed by DB
     * rules (uniquiness)
     * @return boolean true if allowed
     */
    private boolean verifyUsernameValidity() {
        log.debug("username validity check");
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
        if (!success) {
            return false;
        }
        // and additionally check against DB
        boolean techProblems = false;
        try {
            success = false;
            if (userExists(userName)) {
                addError(KEY_LOGIN, "Please enter another user name.");
            } else {
                success = true;
            }
        } catch (RemoteException re) {
            techProblems = true;
            log.error("RemoteException - user registration process");
            re.printStackTrace();
        } catch (CreateException ce) {
            techProblems = true;
            log.error("CreateException - user registration process");
            ce.printStackTrace();
        } catch (NamingException ne) {
            techProblems = true;
            log.error("NamingException - user registration process");
            ne.printStackTrace();
        } catch (GeneralSecurityException gse) {
            techProblems = true;
            log.error("GeneralSecurityException - user registration process");
            gse.printStackTrace();
        } catch (Exception e) {
            techProblems = true;
            e.printStackTrace();
        } finally {
            if (techProblems) {
                addError(
                        KEY_LOGIN,
                        "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return success;
    }

    protected boolean userExists(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user exists");
        r.setProperty("hn", handle);

        DataAccessInt dai = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);

        ResultSetContainer rsc = (ResultSetContainer) dai.getData(r).get("user exists");
        return !rsc.isEmpty();

    }

    /**
     * simplified validity check - does not use alphabets
     */
    protected final boolean simpleValidityCheck(
            String itemKey,
            String itemValue,
            int minLen, int maxLen,
            String errMsg
            ) {
        if (itemValue == null ||
                itemValue.length() < minLen ||
                itemValue.length() > maxLen
        ) {
            addError(itemKey, errMsg);
            return false;
        }
        return true;
    }

    /**
     * Item validity check. Returns true if item is valid
     */
    protected final boolean checkItemValidity(
            String itemKey,
            String itemValue,
            String alphabet,
            boolean required,
            int maxWords,
            String errMsg
            ) {
        boolean ret = true;
        boolean chkMore = true;

        if (!required) {
            if (itemValue == null || itemValue.length() == 0) {
                chkMore = false;
            }
        }
        if (!chkMore) return ret;

        // either this field is required or (optional and not empty)
        if (itemValue == null || itemValue.length() == 0) {
            ret = false;
            addError(itemKey, errMsg);
        } else {
            //  alphabet check
            if ((!StringUtils.containsOnly(itemValue, alphabet, true))) {
                ret = false;
                addError(itemKey, errMsg);
            } else {
                // if word couunt is negative, then do not perworm this check
                if (maxWords < 0) {
                    return ret;
                }
                if (maxWords == 0) maxWords = 1;

                if (!StringUtils.hasNotMoreWords(itemValue, maxWords)) {
                    ret = false;
                    addError(itemKey, errMsg);
                }
            }
        }
        return ret;
    }

    /**
     * Performs transaction rollback
     *
     * @param tx
     */
    private final void rollbackHelper(Transaction tx, boolean removeSecurityUser, String oldPassword) {
        if (tx != null) {
            log.error("rolling transaction back " + tx);
            try {
                tx.rollback();
            } catch (Exception ignore) {
                ignore.printStackTrace();
                log.error("tx.roolback(): op has failed");
            }
        }
        if (secTok.targetUser != null) {
            // security user creation is performed by the remote component
            // (thus, outside of transaction scope) so we have remove it
            // by hand
            try {
                if (removeSecurityUser) {
                    secTok.man.removeUser(secTok.targetUser, secTok.requestor);
                } else {
                    //reset their password
                    Util.getPrincipalManager().editPassword(secTok.targetUser, oldPassword, secTok.requestor);
                }
            } catch (Exception ignore) {
                ignore.printStackTrace();
                log.error("tx.roolback(): removing/restoring of security user has failed");
            }
        }
    }


    /**
     * Creates new UserPrincipal by means of security manager component and add
     * it to the related groups
     *
     * @return UserPrincipal
     * @throws java.rmi.RemoteException
     * @throws com.topcoder.security.GeneralSecurityException
     * @throws com.topcoder.web.corp.controller.MisconfigurationException
     */
    protected UserPrincipal createUserPrincipal()
            throws RemoteException, GeneralSecurityException, MisconfigurationException {
        UserPrincipal securityUser = null;
        securityUser = secTok.man.createUser(userName, password, secTok.requestor);
        Object[] groups = secTok.man.getGroups(secTok.requestor).toArray();
        GroupPrincipal corpGroup = null;
        GroupPrincipal anonGroup = null;
        GroupPrincipal userGroup = null;
        for (int i = 0; i < groups.length; i++) {
            if (((GroupPrincipal) groups[i]).getName().equals(Constants.CORP_GROUP)) {
                corpGroup = (GroupPrincipal) groups[i];
            } else if (((GroupPrincipal) groups[i]).getName().equals(Constants.CORP_ANONYMOUS_GROUP)) {
                anonGroup = (GroupPrincipal) groups[i];
            } else if (((GroupPrincipal) groups[i]).getName().equals(Constants.SOFTWARE_USER_GROUP)) {
                userGroup = (GroupPrincipal) groups[i];
            }
        }
        if (corpGroup == null) {
            throw new MisconfigurationException("Can't find corporate group '" + Constants.CORP_GROUP + "'");
        } else if (anonGroup == null) {
            throw new MisconfigurationException("Can't find anonymous group '" + Constants.CORP_ANONYMOUS_GROUP + "'");
        } else if (userGroup == null) {
            throw new MisconfigurationException("Can't find software user group '" + Constants.SOFTWARE_USER_GROUP + "'");
        }

        log.debug("including to the corporate group");
        secTok.man.addUserToGroup(corpGroup, securityUser, secTok.requestor);
        log.debug("including to the anonymous group");
        secTok.man.addUserToGroup(anonGroup, securityUser, secTok.requestor);
        log.debug("including to the software user group");
        secTok.man.addUserToGroup(userGroup, securityUser, secTok.requestor);
        try {
            SecurityHelper.getUserSubject(securityUser.getId(), true);
        } catch (Exception e) {
            throw new GeneralSecurityException(e);
        }


        return securityUser;
    }

    /**
     * Saves generic user fields common for both of registration types. User to
     * be modified is that identified by targetUserID.
     *
     * @param ic initial context for remote DB EJB
     * @param createNew if true then creates new records for user, oterwise
     * method modifies existent records for a given user
     *
     * @throws java.rmi.RemoteException
     * @throws javax.ejb.CreateException
     * @throws javax.naming.NamingException
     */
    protected final void commonFieldsStore(InitialContext ic, boolean createNew)
            throws RemoteException, CreateException, NamingException {
        // user first, last names
        User userTable = (
                (UserHome) ic.lookup(UserHome.EJB_REF_NAME)
                ).create();
        if (createNew) {
            userTable.createUser(targetUserID, userName, 'A', DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        userTable.setFirstName(targetUserID, firstName, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        userTable.setLastName(targetUserID, lastName, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

        // phone
        Phone phoneTable = (
                (PhoneHome) ic.lookup(PhoneHome.EJB_REF_NAME)
                ).create();
        long phoneID = -1;
        if (!createNew) {
            phoneID = phoneTable.getPrimaryPhoneId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        if (phoneID <= 0) {
            phoneID = phoneTable.createPhone(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME, DBMS.CORP_OLTP_DATASOURCE_NAME);
            phoneTable.setPrimaryPhoneId(targetUserID, phoneID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        phoneTable.setNumber(phoneID, phone, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        if (createNew) {
            phoneTable.setPhoneTypeId(phoneID, 1, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME); // *HARDCODED*
        }

        // setup email for user
        Email emailTable = (
                (EmailHome) ic.lookup(EmailHome.EJB_REF_NAME)
                ).create();
        long emailID = -1;
        if (!createNew) {
            emailID = emailTable.getPrimaryEmailId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        if (emailID <= 0) {
            emailID = emailTable.createEmail(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME, DBMS.CORP_OLTP_DATASOURCE_NAME);
            emailTable.setPrimaryEmailId(targetUserID, emailID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            emailTable.setStatusId(emailID, 1, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        }
        emailTable.setAddress(emailID, email, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
        if (createNew) {
            emailTable.setEmailTypeId(emailID, 1, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME); // *HARDCODED*
        }
    }

    /**
     *
     * Helper class contains a set of fields with various information useful
     * when checking edit/create related permissions
     *
     * @author djFD molc@mail.ru
     * @version 1.02
     *
     */
    protected class SecurityInfo {
        private Contact contactTable;

        boolean isAccountAdmin = false;
        TCSubject requestor = null;
        long primaryUserID = -1;

        long primaryUserCompanyID = -1;
        long targetUserCompanyID = -1;
        long loggedUserCompanyID = -1;
        UserPrincipal targetUser = null;
        private PrincipalMgrRemote man = null;
        boolean createNew = false;

        private SecurityInfo(boolean createNew)
                throws MisconfigurationException, Exception {
            this.createNew = createNew;
            man = Util.getPrincipalManager();

            InitialContext icEJB = null;
            if (getUser().isAnonymous()) {
                try {
                    requestor = Util.retrieveTCSubject(Constants.CORP_PRINCIPAL);
                } catch (Exception cause) {
                    throw new MisconfigurationException(
                            "Can't retrieve TCSubject for corp web application " + cause.getMessage()
                    );
                }
                return;
            }

            try {
                icEJB = TCContext.getInitial();
                contactTable = ((ContactHome) icEJB.lookup(ContactHome.EJB_REF_NAME)).create();
                loggedUserCompanyID = contactTable.getCompanyId(getAuthentication().getUser().getId(), DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
                Company companyTable = ((CompanyHome) icEJB.lookup(CompanyHome.EJB_REF_NAME)).create();
                primaryUserID = companyTable.getPrimaryContactId(loggedUserCompanyID);

                try {
                    requestor = Util.retrieveTCSubject(getAuthentication().getUser().getId());
                } catch (Exception cause) {
                    throw new MisconfigurationException("Can't retrieve TCSubject for: " +
                            getAuthentication().getUser().getId() + cause.getMessage());
                }
                RolePrincipal[] roles = (RolePrincipal[]) requestor.getPrincipals().toArray(new RolePrincipal[0]);
                for (int i = 0; i < roles.length && !isAccountAdmin; i++) {
                    isAccountAdmin = (roles[i].getName().equals(Constants.CORP_ADMIN_ROLE));
                }
                if (isAccountAdmin)
                    primaryUserCompanyID = loggedUserCompanyID;
                else
                    primaryUserCompanyID = contactTable.getCompanyId(primaryUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);

                renewTargetUser();
            } catch (Exception ex) {
                ex.printStackTrace();
                throw new Exception("Error accessing DB company tables [" + ex.getMessage() + "]");
            } finally {
                Util.closeIC(icEJB);
            }
        }

        protected void renewTargetUser()
                throws RemoteException, NoSuchUserException, GeneralSecurityException,
                NamingException, CreateException {
            if (targetUserID >= 0) {
                targetUser = man.getUser(targetUserID);
                if (contactTable == null) {
                    InitialContext ic = null;

                    try {
                        ic = TCContext.getInitial();
                        contactTable = (
                                (ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)
                                ).create();
                    } finally {
                        Util.closeIC(ic);
                    }
                }
                targetUserCompanyID = contactTable.getCompanyId(targetUserID, DBMS.CORP_JTS_OLTP_DATASOURCE_NAME);
            } else {
                targetUserCompanyID = -1;
                targetUser = null;
            }
        }
    }

    /**
     * Embeds ResultSetContainer containing user permissions and their states
     * inro request
     *
     * @throws javax.naming.NamingException
     * @throws java.lang.Exception
     */
    private void embedPermissions()
            throws NamingException, Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("cmd-TCSubject-permissions");
        dataRequest.setProperty("uid", "" + targetUserID);
        dataRequest.setProperty("puid", "" + getAuthentication().getUser().getId());

        ResultSetContainer rsc = null;
        DataAccessInt dai = new DataAccess(DBMS.CORP_OLTP_DATASOURCE_NAME);
        Map resultMap = dai.getData(dataRequest);
        rsc = (ResultSetContainer) resultMap.get("qry-permissions-for-user");
        getRequest().setAttribute(KEY_USER_PERMS, rsc);


    }

}
