package com.topcoder.web.corp.request;

import com.topcoder.security.*;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.web.common.StringUtils;
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
import javax.sql.DataSource;
import javax.transaction.Transaction;
import java.rmi.RemoteException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Map;

/**
 * This class contains some common methods for form processing
 *
 * @author djFD molc@mail.ru
 * @version 1.02
 *
 */
public class UserEdit extends BaseProcessor {
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
        pageInContext = true;
        formPage = Constants.USEREDIT_PAGE_RETRY;
        successPage = Constants.USEREDIT_PAGE_SUCCESS;
    }

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    final void businessProcessing() throws Exception {
        secTok = new SecurityInfo(getFormFields());
        log.debug(
                secTok.createNew ?
                "user creation intiated" :
                "user modification initiated"
        );

        verifyAllowed();
        log.debug(
                secTok.createNew ?
                "verification passed: create" :
                "verification passed: edit"
        );

        if (authToken.getActiveUser().getId() != authToken.getUser().getId()) {
            throw new NotAuthorizedException(
                    "Log in if logged off, and vice versa"
            );
        }

        InitialContext icEJB = null;
        PrincipalMgrRemote mgr = secTok.man;
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
            return;
        }

        if (!secTok.createNew) {
            userName = secTok.targetUser.getName();
        }
        boolean formValid = verifyFormFieldsValidity();
        if (!formValid) {
            setFormFieldsDefaults();
            nextPage = formPage;
            return;
        }
        // form is valid - store it
        icEJB = null;
        Transaction tx = null;
        try {
            mgr = Util.getPrincipalManager();

            // transaction boundary
            tx = Util.beginTransaction();

            if (secTok.createNew) {
                secTok.targetUser = createUserPrincipal();
                targetUserID = secTok.targetUser.getId();
            } else {
                mgr.editPassword(secTok.targetUser, password, secTok.requestor);
            }

            icEJB = (InitialContext)TCContext.getInitial();
            storeUserDataIntoDB(icEJB);

            tx.commit();
        } catch (Exception exc) {
            rollbackHelper(tx);
            throw exc;
        } finally {
            Util.closeIC(icEJB);
        }

        // for create operations will redirect to the page specified in web.xml
        // for edit ops just return to previous page
        if (secTok.createNew) {
            nextPage = successPage;
        } else {
            nextPage = null;
            pageInContext = false;
        }
    }

    /**
     *
     * @param ic
     */
    protected void storeUserDataIntoDB(InitialContext ic)
            throws NamingException, CreateException, RemoteException,
            GeneralSecurityException {
        PrincipalMgrRemote mgr = secTok.man;
        commonFieldsStore(ic, secTok.createNew);

        // associate with company
        if (secTok.createNew) {
            // find company item for user
            Contact contactTable = (
                    (ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)
                    ).create();
            // link user with company
            contactTable.createContact(secTok.primaryUserCompanyID, targetUserID);
        }


        if (targetUserID == secTok.loggedUserID) return;

        // set up additional permissions for non primary users
        Enumeration e = request.getParameterNames();
        while (e.hasMoreElements()) {
            String pName = (String) e.nextElement();
            if (!pName.startsWith("permid-")) continue;

            long permID = -1;
            try {
                permID = Long.parseLong(pName.substring("permid-".length()));
            } catch (Exception ignore) {
                continue;
            }
            String pValue = request.getParameter("perm-" + permID);
            boolean set = "on".equalsIgnoreCase(pValue);
            RolePrincipal role = mgr.getRole(permID);
            if (set) {
                mgr.assignRole(secTok.targetUser, role, secTok.requestor);
            } else {
                mgr.unAssignRole(secTok.targetUser, role, secTok.requestor);
            }
        }
    }

    /**
     * Fetches form fields from DB.
     *
     * @param ic initial DB EJB context
     * @throws Exception
     */
    protected void retrieveUserDataFromDB(InitialContext ic) throws Exception {
        // user first, last names
        User userTable = (
                (UserHome) ic.lookup(UserHome.EJB_REF_NAME)
                ).create();
        firstName = userTable.getFirstName(targetUserID);
        lastName = userTable.getLastName(targetUserID);
        setFormFieldDefault(KEY_LASTNAME, lastName);

        // email for user
        Email emailTable = (
                (EmailHome) ic.lookup(EmailHome.EJB_REF_NAME)
                ).create();
        long emailID = emailTable.getPrimaryEmailId(targetUserID);
        email = emailTable.getAddress(emailID);
        email2 = email;

        // phone
        Phone phoneTable = (
                (PhoneHome) ic.lookup(PhoneHome.EJB_REF_NAME)
                ).create();
        long phoneID = phoneTable.getPrimaryPhoneId(targetUserID);
        phone = phoneTable.getNumber(phoneID);
    }

    /**
     *
     * @throws NotAuthorizedException
     * @throws Exception
     */
    protected void verifyAllowed()
            throws NotAuthorizedException, Exception {
        if (secTok.createNew) { // only primary persons are allowed to do it
            // so all others get switched into editor mode
            if (secTok.loggedUserID < 0) { // not logged in
                throw new NotAuthorizedException(
                        "You must be logged in, in order to create new users"
                );
            }

            // user is logged in
            if (!secTok.loggedAsPrimary) { // primary user can create
                // other are still able to edit themself
                log.debug("switched to edit mode");
                targetUserID = secTok.loggedUserID;
                secTok.createNew = false;
                secTok.renewTargetUser();
            }
        }

        if (!secTok.createNew) { // edit mode
            // modifications is allowed if primary edits own group members
            // or regular user edits self
            if (secTok.loggedAsPrimary) {
                // check if user belongs same company
                if (secTok.targetUserCompanyID != secTok.loggedUserCompanyID) {
                    throw new NotAuthorizedException(
                            "You are allowed only edit of your company persons"
                    );
                }
            } else { // regular member tries to edit user
                if (targetUserID != secTok.loggedUserID) {
                    throw new NotAuthorizedException(
                            "You are not allowed to modify other users"
                    );
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
        firstName = request.getParameter(KEY_FIRSTNAME);
        lastName = request.getParameter(KEY_LASTNAME);
        phone = request.getParameter(KEY_PHONE);
        password = request.getParameter(KEY_PASSWORD);
        password2 = request.getParameter(KEY_PASSWORD2);
        email = request.getParameter(KEY_EMAIL);
        email2 = request.getParameter(KEY_EMAIL2);
        userName = request.getParameter(KEY_LOGIN);

        // retrieve ID of user requested to be modified
        targetUserID = -1;
        try {
            targetUserID = Integer.parseInt(
                    request.getParameter(KEY_TARGET_USER_ID)
            );
        } catch (Exception ignore) {
        }
        return targetUserID < 0;
    }

    /**
     * Populates common form's filelds with their default values (eiter
     * pulled from DB or entered by user).
     */
    protected void setFormFieldsDefaults() throws Exception {
        setFormFieldDefault(KEY_FIRSTNAME, firstName);
        setFormFieldDefault(KEY_LASTNAME, lastName);
        setFormFieldDefault(KEY_PHONE, phone);
        setFormFieldDefault(KEY_PASSWORD, password);
        setFormFieldDefault(KEY_PASSWORD2, password2);
        setFormFieldDefault(KEY_EMAIL, email);
        setFormFieldDefault(KEY_EMAIL2, email2);
        setFormFieldDefault(KEY_LOGIN, userName);
        if (targetUserID >= 0) {
            request.setAttribute(KEY_TARGET_USER_ID, "" + targetUserID);
        }
        if (targetUserID != secTok.primaryUserID) {
            try {
                embedPermissions();
            } catch (Exception ignore) {
                log.error(
                        "Cant get user permissions. Only default ones will be available"
                );
                ignore.printStackTrace();
            }
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
            markFormFieldAsInvalid(
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
                        StringUtils.ALPHABET_ALPHA_NUM_PUNCT_EN, true, 1,
                        "Please enter a valid email address."
                );

        // email2 validity
        if (email2 == null) email2 = "";
        if (!email2.equals(email)) {
            markFormFieldAsInvalid(
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
            PrincipalMgrRemote mgr = Util.getPrincipalManager();

            try {
                success = false;
                UserPrincipal user = mgr.getUser(userName);
                markFormFieldAsInvalid(
                        KEY_LOGIN, "Please enter another user name."
                );
            } catch (NoSuchUserException nsue) {
                // it is fine - handle seem to be free yet
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
        } finally {
            if (techProblems) {
                markFormFieldAsInvalid(
                        KEY_LOGIN,
                        "Some technical problems prevent further processing. Try again later"
                );
                return false;
            }
        }
        return success;
    }

    /**
     * simplified validity check - does not use alphabets
     */
    private final boolean simpleValidityCheck(
            String itemKey,
            String itemValue,
            int minLen, int maxLen,
            String errMsg
            ) {
        if (itemValue == null ||
                itemValue.length() < minLen ||
                itemValue.length() > maxLen
        ) {
            markFormFieldAsInvalid(itemKey, errMsg);
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
            markFormFieldAsInvalid(itemKey, errMsg);
        } else {
            //  alphabet check
            if ((!StringUtils.consistsOf(itemValue, alphabet, true))) {
                ret = false;
                markFormFieldAsInvalid(itemKey, errMsg);
            } else {
                // if word couunt is negative, then do not perworm this check
                if (maxWords < 0) {
                    return ret;
                }
                if (maxWords == 0) maxWords = 1;

                if (!StringUtils.hasNotMoreWords(itemValue, maxWords)) {
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
     */
    private final void rollbackHelper(Transaction tx) {
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
            // by hands
            try {
                secTok.man.removeUser(secTok.targetUser, secTok.requestor);
            } catch (Exception ignore) {
                ignore.printStackTrace();
                log.error("tx.roolback(): removing of security user has failed");
            }
        }
    }


    /**
     * Creates new UserPrincipal by means of security manager component and add
     * it to the related groups
     *
     * @return UserPrincipal
     * @throws RemoteException
     * @throws GeneralSecurityException
     * @throws MisconfigurationException
     */
    protected UserPrincipal createUserPrincipal()
            throws RemoteException, GeneralSecurityException, MisconfigurationException {
        UserPrincipal securityUser = null;
        securityUser = secTok.man.createUser(userName, password, secTok.requestor);
        Iterator groups = secTok.man.getGroups(secTok.requestor).iterator();
        GroupPrincipal group = null;
        while (groups.hasNext()) {
            group = (GroupPrincipal) groups.next();
            if (group.getName().equalsIgnoreCase(Constants.CORP_GROUP)) break;
        }
        if (group == null) {
            throw new MisconfigurationException(
                    "Can't find corporate group '" + Constants.CORP_GROUP + "'"
            );
        }

        log.debug("including to the corporate group");
        secTok.man.addUserToGroup(group, securityUser, secTok.requestor);

        // as requested add user to the anonymous group
        groups = secTok.man.getGroups(secTok.requestor).iterator();
        group = null;
        while (groups.hasNext()) {
            group = (GroupPrincipal) groups.next();
            if (group.getName().equalsIgnoreCase(Constants.CORP_ANONYMOUS_GROUP)) {
                break;
            }
        }
        if (group == null) {
            throw new MisconfigurationException(
                    "Can't find anonymous group '" + Constants.CORP_ANONYMOUS_GROUP + "'"
            );
        }
        log.debug("including to the anonymous group");
        secTok.man.addUserToGroup(group, securityUser, secTok.requestor);
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
     * @throws RemoteException
     * @throws CreateException
     * @throws NamingException
     */
    protected final void commonFieldsStore(InitialContext ic, boolean createNew)
            throws RemoteException, CreateException, NamingException {
        // user first, last names
        User userTable = (
                (UserHome) ic.lookup(UserHome.EJB_REF_NAME)
                ).create();
        if (createNew) {
            userTable.createUser(targetUserID, userName, 'A');
        }
        userTable.setFirstName(targetUserID, firstName);
        userTable.setLastName(targetUserID, lastName);

        // phone
        Phone phoneTable = (
                (PhoneHome) ic.lookup(PhoneHome.EJB_REF_NAME)
                ).create();
        long phoneID = -1;
        if (!createNew) {
            phoneID = phoneTable.getPrimaryPhoneId(targetUserID);
        }
        if (phoneID <= 0) {
            phoneID = phoneTable.createPhone(targetUserID);
            phoneTable.setPrimaryPhoneId(targetUserID, phoneID);
        }
        phoneTable.setNumber(phoneID, phone);
        if (createNew) {
            phoneTable.setPhoneTypeId(phoneID, 1); // *HARDCODED*
        }

        // setup email for user
        Email emailTable = (
                (EmailHome) ic.lookup(EmailHome.EJB_REF_NAME)
                ).create();
        long emailID = -1;
        if (!createNew) {
            emailID = emailTable.getPrimaryEmailId(targetUserID);
        }
        if (emailID <= 0) {
            emailID = emailTable.createEmail(targetUserID);
            emailTable.setPrimaryEmailId(targetUserID, emailID);
        }
        emailTable.setAddress(emailID, email);
        if (createNew) {
            emailTable.setEmailTypeId(emailID, 1); // *HARDCODED*
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

        boolean loggedAsPrimary = false;
        TCSubject requestor = null;
        long primaryUserID = -1;
        long loggedUserID = -1;

        long primaryUserCompanyID = -1;
        long targetUserCompanyID = -1;
        long loggedUserCompanyID = -1;
        UserPrincipal targetUser = null;
        PrincipalMgrRemote man = null;
        boolean createNew = false;

        private SecurityInfo(boolean createNew)
                throws MisconfigurationException, Exception {
            this.createNew = createNew;
            man = Util.getPrincipalManager();

            InitialContext icEJB = null;
            if (authToken.getActiveUser().isAnonymous()) {
                try {
                    requestor = Util.retrieveTCSubject(Constants.CORP_PRINCIPAL);
                } catch (Exception cause) {
                    throw new MisconfigurationException(
                            "Can't retrieve TCSubject for corp web application"
                    );
                }
                return;
            }
            loggedUserID = authToken.getActiveUser().getId();

            try {
                icEJB = (InitialContext)TCContext.getInitial();
                contactTable = (
                        (ContactHome) icEJB.lookup(ContactHome.EJB_REF_NAME)
                        ).create();
                loggedUserCompanyID = contactTable.getCompanyId(loggedUserID);
                Company companyTable = (
                        (CompanyHome) icEJB.lookup(CompanyHome.EJB_REF_NAME)
                        ).create();
                primaryUserID = companyTable.getPrimaryContactId(loggedUserCompanyID);
                if (loggedUserID == primaryUserID) {
                    loggedAsPrimary = true;
                    primaryUserCompanyID = loggedUserCompanyID;
                } else {
                    loggedAsPrimary = false;
                    primaryUserCompanyID = contactTable.getCompanyId(primaryUserID);
                }
                renewTargetUser();
            } catch (Exception ex) {
                throw new Exception(
                        "Error accessing DB company tables [" + ex.getMessage() + "]"
                );
            } finally {
                Util.closeIC(icEJB);
            }
            try {
                requestor = Util.retrieveTCSubject(primaryUserID);
            } catch (Exception cause) {
                throw new MisconfigurationException(
                        "Can't retrieve TCSubject for corp web application"
                );
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
                        ic = (InitialContext)TCContext.getInitial();
                        contactTable = (
                                (ContactHome) ic.lookup(ContactHome.EJB_REF_NAME)
                                ).create();
                    } finally {
                        Util.closeIC(ic);
                    }
                }
                targetUserCompanyID = contactTable.getCompanyId(targetUserID);
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
     * @throws NamingException
     * @throws Exception
     */
    private void embedPermissions()
            throws NamingException, Exception {
        Request dataRequest = new Request();
        dataRequest.setContentHandle("cmd-TCSubject-permissions");
        dataRequest.setProperty("uid", "" + targetUserID);
        dataRequest.setProperty("puid", "" + secTok.primaryUserID);

        InitialContext ic = null;
        ResultSetContainer rsc = null;
        try {
            ic = (InitialContext)TCContext.getInitial();
            DataAccessInt dai = new DataAccess((DataSource) ic.lookup(DBMS.CORP_DATASOURCE_NAME));
            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("qry-permissions-for-user");
            request.setAttribute(KEY_USER_PERMS, rsc);

        } finally {
            Util.closeIC(ic);
        }

    }
}
