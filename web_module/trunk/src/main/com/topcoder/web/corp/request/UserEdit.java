package com.topcoder.web.corp.request;

import com.topcoder.security.*;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.DataAccessInt;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.util.TCContext;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
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
import javax.transaction.UserTransaction;
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
        pageInContext = true;
        formPage = Constants.USEREDIT_PAGE_RETRY;
        successPage = Constants.USEREDIT_PAGE_SUCCESS;
    }

    /**
     * @see com.topcoder.web.corp.request.BaseProcessor#businessProcessing()
     */
    final void businessProcessing() throws Exception {
        secTok = new SecurityInfo(getFormFields());
        log.debug(secTok.createNew ?"user creation intiated":"user modification initiated");

        verifyAllowed();
        log.debug(secTok.createNew ?"verification passed: create" :"verification passed: edit");

        PrincipalMgrRemote mgr = secTok.man;

        if (loadUserData()) return;

        boolean formValid = verifyFormFieldsValidity();
        if (!formValid) {
            setFormFieldsDefaults();
            nextPage = formPage;
            return;
        }
        // form is valid - store it
        InitialContext icEJB = null;
        InitialContext secCtx = null;
        Transaction tx = null;
        UserTransaction secTx = null;
        try {
            mgr = Util.getPrincipalManager();

            // transaction boundary
            tx = Util.beginTransaction();

            secCtx = (InitialContext) TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);
            secTx = (UserTransaction) secCtx.lookup(ApplicationServer.TRANS_FACTORY);
            secTx.begin();

            if (secTok.createNew) {
                secTok.targetUser = createUserPrincipal();
                targetUserID = secTok.targetUser.getId();
            } else {
                mgr.editPassword(secTok.targetUser, password, secTok.requestor);
            }

            icEJB = (InitialContext)TCContext.getInitial();
            storeUserDataIntoDB(icEJB);

            tx.commit();
            secTx.commit();
        } catch (Exception exc) {
            //rollbackHelper(tx);
            try {
                tx.rollback();
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                secTx.rollback();
            } catch (Exception e) {
                e.printStackTrace();
            }
            throw exc;
        } finally {
            Util.closeIC(icEJB);
            Util.closeIC(secCtx);
        }

        pageInContext = false;
        nextPage = successPage;
    }

    /**
     * this is a total hack to get this thing working.  what we really
     * need to do is decouple more of registration and user edit.
     * registration implements a real version of this.
     * @return
     * @throws Exception
     */
    protected boolean loadUserData() throws Exception {
        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            if (!secTok.createNew) {
                PrincipalMgrRemote mgr = Util.getPrincipalManager();
                password = mgr.getPassword(targetUserID);
                password2 = password;
                userName = secTok.targetUser.getName();
                retrieveUserDataFromDB((InitialContext)TCContext.getInitial());
            }
            setFormFieldsDefaults();
            nextPage = formPage;
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
            GeneralSecurityException {
        PrincipalMgrRemote mgr = secTok.man;
        commonFieldsStore(ic, secTok.createNew);

        // associate with company
        if (secTok.createNew) {
            // find company item for user
            Contact contactTable = ((ContactHome) ic.lookup("corp:"+ContactHome.EJB_REF_NAME)).create();
            // link user with company
            contactTable.createContact(secTok.primaryUserCompanyID, targetUserID);
        }

        if (targetUserID != getAuthentication().getActiveUser().getId()) {
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
                    if (!hasRole(mgr.getUserSubject(targetUserID), role)) {
                        mgr.assignRole(secTok.targetUser, role, secTok.requestor);
                    }
                } else {
                    mgr.unAssignRole(secTok.targetUser, role, secTok.requestor);
                }
            }
        }
    }

    private boolean hasRole(TCSubject user, RolePrincipal role) {
        RolePrincipal[] roles = (RolePrincipal[])user.getPrincipals().toArray(new RolePrincipal[0]);
        for (int i=0; i<roles.length; i++) {
            if (roles[i].equals(role)) return true;
        }
        return false;
    }


    /**
     * Fetches form fields from DB.
     *
     * @param ic initial DB EJB context
     * @throws Exception
     */
    protected void retrieveUserDataFromDB(InitialContext ic) throws Exception {
        // user first, last names
        User userTable = ((UserHome) ic.lookup("corp:"+UserHome.EJB_REF_NAME)).create();
        firstName = userTable.getFirstName(targetUserID);
        lastName = userTable.getLastName(targetUserID);

        // email for user
        Email emailTable = ((EmailHome) ic.lookup("corp:"+EmailHome.EJB_REF_NAME)).create();
        long emailID = emailTable.getPrimaryEmailId(targetUserID);
        email = emailTable.getAddress(emailID);
        email2 = email;

        // phone
        Phone phoneTable = ((PhoneHome) ic.lookup(PhoneHome.EJB_REF_NAME)).create();
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
            if (getAuthentication().getUser().isAnonymous()) { // not logged in
                throw new NotAuthorizedException("You must be logged in, in order to create new users");
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
                    throw new NotAuthorizedException("You are allowed only edit of your company persons");
                }
            } else { // regular member tries to edit user
                if (targetUserID != getAuthentication().getUser().getId()) {
                    throw new NotAuthorizedException("You are not allowed to modify other users");
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
                mgr.getUser(userName);
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
        Object[] groups = secTok.man.getGroups(secTok.requestor).toArray();
        GroupPrincipal corpGroup = null;
        GroupPrincipal anonGroup = null;
        GroupPrincipal userGroup = null;
        for (int i=0; i<groups.length; i++) {
            if (((GroupPrincipal)groups[i]).getName().equals(Constants.CORP_GROUP)) {
                corpGroup = (GroupPrincipal)groups[i];
            } else if (((GroupPrincipal)groups[i]).getName().equals(Constants.CORP_ANONYMOUS_GROUP)) {
                anonGroup = (GroupPrincipal)groups[i];
            } else if (((GroupPrincipal)groups[i]).getName().equals(Constants.SOFTWARE_USER_GROUP)) {
                userGroup = (GroupPrincipal)groups[i];
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
                (UserHome) ic.lookup("corp:"+UserHome.EJB_REF_NAME)
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
                (EmailHome) ic.lookup("corp:"+EmailHome.EJB_REF_NAME)
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
            if (authToken.getActiveUser().isAnonymous()) {
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
                icEJB = (InitialContext)TCContext.getInitial();
                contactTable = ((ContactHome) icEJB.lookup("corp:"+ContactHome.EJB_REF_NAME)).create();
                loggedUserCompanyID = contactTable.getCompanyId(getAuthentication().getUser().getId());
                Company companyTable = ((CompanyHome) icEJB.lookup(CompanyHome.EJB_REF_NAME)).create();
                primaryUserID = companyTable.getPrimaryContactId(loggedUserCompanyID);

                try {
                    requestor = Util.retrieveTCSubject(getAuthentication().getUser().getId());
                } catch (Exception cause) {
                    throw new MisconfigurationException("Can't retrieve TCSubject for: " +
                            getAuthentication().getUser().getId() + cause.getMessage());
                }
                RolePrincipal[] roles = (RolePrincipal[])requestor.getPrincipals().toArray(new RolePrincipal[0]);
                for (int i=0; i<roles.length && !isAccountAdmin; i++) {
                    isAccountAdmin = (roles[i].getName().equals(Constants.CORP_ADMIN_ROLE));
                }
                if (isAccountAdmin)
                    primaryUserCompanyID = loggedUserCompanyID;
                else
                    primaryUserCompanyID = contactTable.getCompanyId(primaryUserID);

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
                        ic = (InitialContext)TCContext.getInitial();
                        contactTable = (
                                (ContactHome) ic.lookup("corp:"+ContactHome.EJB_REF_NAME)
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
        dataRequest.setProperty("puid", "" + getAuthentication().getUser().getId());

        InitialContext ic = null;
        ResultSetContainer rsc = null;
        try {
            ic = (InitialContext)TCContext.getInitial();
            DataAccessInt dai = new DataAccess((DataSource) ic.lookup(DBMS.CORP_OLTP_DATASOURCE_NAME));
            Map resultMap = dai.getData(dataRequest);
            rsc = (ResultSetContainer) resultMap.get("qry-permissions-for-user");
            request.setAttribute(KEY_USER_PERMS, rsc);

        } finally {
            Util.closeIC(ic);
        }

    }
}
