package com.topcoder.web.hs.common;

import com.topcoder.security.*;
import com.topcoder.security.admin.*;
import com.topcoder.shared.dataAccess.*;
import com.topcoder.shared.dataAccess.resultSet.*;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.ejb.user.*;
import com.topcoder.web.ejb.email.*;
import com.topcoder.web.ejb.termsofuse.*;
import com.topcoder.web.ejb.rating.*;
import com.topcoder.web.ejb.coder.Coder;
import com.topcoder.web.hs.model.*;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.TCRequest;

import java.rmi.*;
import java.util.*;
import javax.ejb.*;
import javax.naming.*;
import javax.transaction.UserTransaction;


/**
 * This class contains commonly used registration methods
 *
 * @author Nathan Egge
 * @version 1.0 2003/01/15
 */
public class RegistrationHelper {

    private final static Logger log = Logger.getLogger(RegistrationHelper.class);

    private final static String STATE_INPUT_CODE = "st";

    private final static String USER_ID_INPUT_CODE = "ui";

    private final static String SCHOOL_ID_INPUT_CODE = "si";

    private final static long TERMS_OF_USE_ID = 1;

    private final static long EMAIL_TYPE_ID_DEFAULT = 1;

    private final static char NEW_USER_TYPE = 'A';

    private final static String STUDENT_GROUP_NAME = "Student";

    private final static String COACH_GROUP_NAME = "Coach";

    private final static String ANONYMOUS_GROUP_NAME = "Anonymous";

    private final static String INCORRECT_GROUP = "Cannot processes request " +
            "because of wrong group";

    private final static String NO_USER_FOUND = "Could not find user information " +
            "in our systems";

    private final static String BAD_COACH_COUNT = "Could not get coach count for " +
            "given school_id";

    private final static String FIRST_NAME_NOT_EMPTY = "Ensure that the first " +
            "name field is not empty";

    private final static int MAX_FIRST_NAME_LENGTH = 64;

    private final static String FIRST_NAME_TOO_LONG = "The first name field must " +
            "be less than 64 characters " +
            "long";

    private final static String LAST_NAME_NOT_EMPTY = "Ensure that the last name " +
            "field is not empty";

    private final static int MAX_LAST_NAME_LENGTH = 64;

    private final static String LAST_NAME_TOO_LONG = "The last name field must be " +
            "less than 64 characters " +
            "long";

    private final static String INVALID_STATE_CODE = "Please select a state";

    private final static String INVALID_SCHOOL_ID = "Please select a school";

    private final static String HANDLE_NOT_EMPTY = "Ensure that the handle field " +
            "is not empty";

    private final static String HANDLE_ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" +
            "abcdefghijklmnopqrstuvwxyz" +
            "0123456789" +
            "-_.";

    private final static String INVALID_HANDLE = "The handle field must contain " +
            "only alpha numeric symbols";

    private final static String HANDLE_TAKEN = "This handle is already in use by " +
            "another user";

    private final static String TECHNICAL_PROBLEMS = "Technical problems are " +
            "preventing further " +
            "processing, try again later";

    private final static String PASSWORD_NOT_EMPTY = "Ensure that the password " +
            "field is not empty";

    private final static String PASSWORD_WRONG_LENGTH = "The password field must " +
            "be 7 to 15 characters " +
            "long";

    private final static String PASSWORD_NO_MATCH = "The password field does not " +
            "match the re-typed password";

    private final static String EMAIL_NOT_EMPTY = "Ensure that the email field " +
            "is not empty";

    private final static String INVALID_EMAIL = "The email field must contain a " +
            "valid email address";

    private final static String EMAIL_NO_MATCH = "The email field does not match " +
            "the re-typed email";

    private final static String INVALID_EDITOR_ID = "Please select an editor";

    private final static String INVALID_LANGUAGE_ID = "Please select a language";

    private final static String MUST_AGREE_TERMS = "You must agree to the terms " +
            "and conditions to register";

    private RegistrationHelper() {
        /* do nothing */
    }

    public static void populateStudentWithDefaults(StudentRegistrationBean srb) {
        srb.setUserId(null);
        srb.setFirstName("");
        srb.setLastName("");
        srb.setStateCode("");
        srb.setSchoolId(new Long(-1));
        srb.setHandle("");
        srb.setChangePassword(false);
        srb.setPassword("");
        srb.setConfirmPassword("");
        srb.setEmail("");
        srb.setConfirmEmail("");
        srb.setEditorId(new Integer(-1));
        srb.setLanguageId(new Integer(-1));
        srb.setAgreeTerms(false);
    }

    public static void populateStudentFromRequest(TCRequest request,
                                                  StudentRegistrationBean srb)
            throws Exception {

        srb.setFirstName(getParameter(request, "first_name", srb.getFirstName()));
        srb.setLastName(getParameter(request, "last_name", srb.getLastName()));
        srb.setStateCode(getParameter(request, "state_code", srb.getStateCode()));
        srb.setSchoolId(getParameterLong(request, "school_id", srb.getSchoolId()));
        srb.setHandle(getParameter(request, "handle", srb.getHandle()));
        srb.setChangePassword("true".equals(getParameter(request,
                "change_password",
                "false")));
        srb.setPassword(getParameter(request, "password", srb.getPassword()));
        srb.setConfirmPassword(getParameter(request, "confirm_password",
                srb.getConfirmPassword()));
        srb.setEmail(getParameter(request, "email", srb.getEmail()));
        srb.setConfirmEmail(getParameter(request, "confirm_email",
                srb.getConfirmEmail()));
        srb.setEditorId(getParameterInteger(request, "editor_id",
                srb.getEditorId()));
        srb.setLanguageId(getParameterInteger(request, "language_id",
                srb.getLanguageId()));
        srb.setAgreeTerms("true".equals(getParameter(request, "terms", "false")));

    }

    public static void populateStudentFromSession(SessionInfoBean sib,
                                                  StudentRegistrationBean srb)
            throws Exception {

        if (!sib.isStudent()) {
            throw(new Exception(INCORRECT_GROUP));
        }

        DataAccessInt dai = new DataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);
        Map map = new HashMap();

        map.put(DataAccessConstants.COMMAND, "student_data");
        map.put(USER_ID_INPUT_CODE, "" + sib.getUserId());
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;
        ResultSetContainer.ResultSetRow rsr;

        rsc = (ResultSetContainer) data.get("student_data");
        Iterator iterator = rsc.iterator();
        if (!iterator.hasNext()) {
            throw(new Exception(NO_USER_FOUND));
        }
        rsr = (ResultSetContainer.ResultSetRow) iterator.next();

        srb.setUserId(new Long(sib.getUserId()));
        srb.setHandle(sib.getHandle());

        srb.setFirstName((String) rsr.getItem("first_name").getResultData());
        srb.setLastName((String) rsr.getItem("last_name").getResultData());
        srb.setStateCode((String) rsr.getItem("state_code").getResultData());
        srb.setSchoolId((Long) rsr.getItem("school_id").getResultData());
        srb.setEmail((String) rsr.getItem("address").getResultData());
        srb.setConfirmEmail((String) rsr.getItem("address").getResultData());
        srb.setEditorId((Integer) rsr.getItem("editor_id").getResultData());
        srb.setLanguageId((Integer) rsr.getItem("language_id").getResultData());
    }

    public static void populateStudentStaticContent(StudentRegistrationBean srb)
            throws Exception {

        Context ctx = TCContext.getInitial();
        DataAccessInt dai = new CachedDataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);
        Map map = new HashMap();

        map.put(DataAccessConstants.COMMAND, "student_form");
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;
        ResultSetContainer.ResultSetRow rsr;

        rsc = (ResultSetContainer) data.get("state_list");
        List state_list = new ArrayList();
        state_list.add(new ListPairBean(null, "Pick a state"));
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            String state_code = (String) rsr.getItem("state_code").getResultData();
            String state_name = (String) rsr.getItem("state_name").getResultData();
            state_list.add(new ListPairBean(state_code, state_name));
        }

        srb.setStateList(state_list);

        rsc = (ResultSetContainer) data.get("editor_list");
        List editor_list = new ArrayList();
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            Integer editor_id = (Integer) rsr.getItem("editor_id").getResultData();
            String editor_desc = (String) rsr.getItem("editor_desc").getResultData();
            editor_list.add(new ListPairBean(editor_id, editor_desc));
        }

        srb.setEditorList(editor_list);

        rsc = (ResultSetContainer) data.get("language_list");
        List language_list = new ArrayList();
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            Integer language_id = (Integer) rsr.getItem("language_id").getResultData();
            String language_name = (String) rsr.getItem("language_name").getResultData();
            language_list.add(new ListPairBean(language_id, language_name));
        }

        srb.setLanguageList(language_list);

        List school_list = new ArrayList();
        school_list.add(new ListPairBean(null, "Pick a school"));
        if (isValidListValue(srb.getStateCode(), srb.getStateList())) {
            map.put(DataAccessConstants.COMMAND, "state_schools");
            map.put(STATE_INPUT_CODE, srb.getStateCode());
            req = new Request(map);
            Map schools = dai.getData(req);

            rsc = (ResultSetContainer) schools.get("state_schools");
            for (Iterator i = rsc.iterator(); i.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) i.next();
                Long school_id = (Long) rsr.getItem("school_id").getResultData();
                String full_name = (String) rsr.getItem("full_name").getResultData();
                school_list.add(new ListPairBean(school_id, full_name));
            }

        }
        srb.setSchoolList(school_list);

        TermsOfUseHome touh = (TermsOfUseHome) ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
        TermsOfUse tou = touh.create();
        srb.setTermsOfUse(tou.getText(TERMS_OF_USE_ID, DBMS.HS_JTS_OLTP_DATASOURCE_NAME));
    }

    public static void populateSchoolCoachCount(StudentRegistrationBean srb)
            throws Exception {

        DataAccessInt dai = new DataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);
        Map map = new HashMap();

        map.put(DataAccessConstants.COMMAND, "school_coach_count");
        map.put(SCHOOL_ID_INPUT_CODE, "" + srb.getSchoolId());
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;
        ResultSetContainer.ResultSetRow rsr;

        rsc = (ResultSetContainer) data.get("school_coach_count");

        Iterator iterator = rsc.iterator();
        if (!iterator.hasNext()) {
            throw(new Exception(BAD_COACH_COUNT));
        }
        rsr = (ResultSetContainer.ResultSetRow) iterator.next();
        srb.setSchoolCoachCount((Long) rsr.getItem("coach_count").getResultData());
    }

    public static boolean isValidStudent(Map errors,
                                         StudentRegistrationBean srb)
            throws Exception {
        boolean valid = true;
        valid &= checkValidFirstName(errors, srb.getFirstName());
        valid &= checkValidLastName(errors, srb.getLastName());
        valid &= (checkValidState(errors, srb.getStateCode(), srb.getStateList()) &&
                checkValidSchool(errors, srb.getSchoolId(), srb.getSchoolList()));
        valid &= (srb.getUserId() != null || checkValidHandle(errors, srb.getHandle()));
        valid &= (!srb.getChangePassword() ||
                checkValidPassword(errors, srb.getPassword(), srb.getConfirmPassword()));
        valid &= checkValidEmail(errors, srb.getEmail(), srb.getConfirmEmail());
        valid &= checkValidEditor(errors, srb.getEditorId(),
                srb.getEditorList());
        valid &= checkValidLanguage(errors, srb.getLanguageId(),
                srb.getLanguageList());
        valid &= (srb.getUserId() != null ||
                checkAgreeTerms(errors, srb.getAgreeTerms()));
        return (valid);
    }

    public static void createStudent(StudentRegistrationBean srb)
            throws Exception {
        /* !!This is bad!! Because the persisting is done in a web container, or
        * servlet, its not possible to use EJBContext.getUserTransaction(). Instead
        * we simply get a UserTransaction object for each database we are accessing.
        * The problem is that both commits cannot happen atomically. Hence errors in
        * one database will not force a rollback in another. This should be fixed!
        */
        UserTransaction utx = null;

        Context secCtx = null;
        PrincipalMgrRemote pmr = null;
        UserPrincipal newUser = null;
        TCSubject createUser = new TCSubject(0);
        try {
            /*utx=EJBContext.getUserTransaction();
            utx.begin();*/

            secCtx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);

            /* this doesn't work because the JBoss ctx doesn't support transactions */
            /*utx_common=(UserTransaction)
                                      ctx.lookup("javax.transaction.UserTransaction");
            utx_common.begin();*/

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)
                    secCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            pmr = pmrh.create();

            newUser = pmr.createUser(srb.getHandle(), srb.getPassword(), createUser);
            long user_id = newUser.getId();

            Collection groups = pmr.getGroups(createUser);
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                GroupPrincipal gp = (GroupPrincipal) iterator.next();
                if (gp.getName().equals(STUDENT_GROUP_NAME)) {
                    pmr.addUserToGroup(gp, newUser, createUser);
                } else if (gp.getName().equals(ANONYMOUS_GROUP_NAME)) {
                    pmr.addUserToGroup(gp, newUser, createUser);
                }
            }

            InitialContext ctx = new InitialContext();

            utx = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
            utx.begin();

            UserHome uh = (UserHome) ctx.lookup(UserHome.EJB_REF_NAME);
            User user = uh.create();
            user.createUser(user_id, srb.getHandle(), NEW_USER_TYPE, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setFirstName(user_id, srb.getFirstName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setLastName(user_id, srb.getLastName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserSchoolHome ush = (UserSchoolHome)
                    ctx.lookup(UserSchoolHome.EJB_REF_NAME);
            UserSchool user_school = ush.create();
            user_school.createUserSchool(user_id, srb.getSchoolId().longValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user_school.setCurrentUserSchoolId(user_id,
                    srb.getSchoolId().longValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            EmailHome eh = (EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME);
            Email email = eh.create();
            long email_id = email.createEmail(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME, DBMS.HS_OLTP_DATASOURCE_NAME);
            email.setPrimaryEmailId(user_id, email_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setAddress(email_id, srb.getEmail(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setEmailTypeId(email_id, EMAIL_TYPE_ID_DEFAULT, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            Coder coder = (Coder)BaseProcessor.createEJB(ctx, Coder.class);
            coder.createCoder(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setMemberSince(user_id, new java.sql.Date(new Date().getTime()), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setEditorId(user_id, srb.getEditorId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setLanguageId(user_id, srb.getLanguageId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserTermsOfUseHome utouh = (UserTermsOfUseHome)
                    ctx.lookup(UserTermsOfUseHome.EJB_REF_NAME);
            UserTermsOfUse user_terms_of_use = utouh.create();
            user_terms_of_use.createUserTermsOfUse(user_id, TERMS_OF_USE_ID, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            RatingHome rh = (RatingHome) ctx.lookup(RatingHome.EJB_REF_NAME);
            Rating rating = rh.create();
            rating.createRating(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            utx.commit();
        } catch (Exception _e) {
            _e.printStackTrace();
            if (utx != null) {
                try {
                    utx.rollback();
                } catch (Exception _ex) {
                    log.error("error rolling back transaction");
                    _ex.printStackTrace();
                }
                //since we don't have a real transaction, we'll just try and remove what we created.
                pmr.removeUser(newUser, createUser);
            }
            throw(_e);
        }
    }

    public static void updateStudent(StudentRegistrationBean srb)
            throws Exception {

        /* This is bad, please see above comment */
        UserTransaction utx = null;
        PrincipalMgrRemote pmr = null;
        UserPrincipal existingUser = null;
        TCSubject createUser = new TCSubject(0);
        Context secCtx = null;
        String oldPass = null;
        try {
            /*utx=EJBContext.getUserTransaction();
            utx.begin();*/

            if (srb.getChangePassword()) {
                secCtx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);

                PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)
                        secCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                pmr = pmrh.create();

                existingUser = pmr.getUser(srb.getHandle());
                oldPass = pmr.getPassword(existingUser.getId());
                pmr.editPassword(existingUser, srb.getPassword(), createUser);
            }

            InitialContext ctx = new InitialContext();

            utx = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
            utx.begin();

            UserHome uh = (UserHome) ctx.lookup(UserHome.EJB_REF_NAME);
            User user = uh.create();
            long userId = srb.getUserId().longValue();
            user.setFirstName(userId, srb.getFirstName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setLastName(userId, srb.getLastName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserSchoolHome ush = (UserSchoolHome)
                    ctx.lookup(UserSchoolHome.EJB_REF_NAME);
            UserSchool user_school = ush.create();
            long schoolId = srb.getSchoolId().longValue();
            if (user_school.exists(userId, schoolId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME)) {
                user_school.setCurrentUserSchoolId(userId, schoolId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            } else {
                user_school.createUserSchool(userId, schoolId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
                user_school.setCurrentUserSchoolId(userId, schoolId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            }

            EmailHome eh = (EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME);
            Email email = eh.create();
            long emailId = email.getPrimaryEmailId(userId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setAddress(emailId, srb.getEmail(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setEmailTypeId(emailId, EMAIL_TYPE_ID_DEFAULT, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            Coder coder = (Coder)BaseProcessor.createEJB(ctx, Coder.class);
            coder.setEditorId(userId, srb.getEditorId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setLanguageId(userId, srb.getLanguageId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            utx.commit();
        } catch (Exception _e) {
            _e.printStackTrace();
            if (utx != null) {
                try {
                    utx.rollback();
                } catch (Exception _ex) {
                    log.error("error rolling back transaction");
                    _ex.printStackTrace();
                }
                //set their password back
                if (srb.getChangePassword()) {
                    pmr.editPassword(existingUser, oldPass, createUser);
                }
            }
            throw(_e);
        }
    }

    public static void populateCoachWithDefaults(CoachRegistrationBean crb) {
        crb.setUserId(null);
        crb.setFirstName("");
        crb.setLastName("");
        crb.setStateCode("");
        crb.setSchoolId(new Long(-1));
        crb.setHandle("");
        crb.setChangePassword(false);
        crb.setPassword("");
        crb.setConfirmPassword("");
        crb.setEmail("");
        crb.setConfirmEmail("");
        crb.setEditorId(new Integer(-1));
        crb.setLanguageId(new Integer(-1));
        crb.setAgreeTerms(false);
    }

    public static void populateCoachFromRequest(TCRequest request,
                                                CoachRegistrationBean crb)
            throws Exception {

        crb.setFirstName(getParameter(request, "first_name", crb.getFirstName()));
        crb.setLastName(getParameter(request, "last_name", crb.getLastName()));
        crb.setStateCode(getParameter(request, "state_code", crb.getStateCode()));
        crb.setSchoolId(getParameterLong(request, "school_id", crb.getSchoolId()));
        crb.setHandle(getParameter(request, "handle", crb.getHandle()));
        crb.setChangePassword("true".equals(getParameter(request,
                "change_password",
                "false")));
        crb.setPassword(getParameter(request, "password", crb.getPassword()));
        crb.setConfirmPassword(getParameter(request, "confirm_password",
                crb.getConfirmPassword()));
        crb.setEmail(getParameter(request, "email", crb.getEmail()));
        crb.setConfirmEmail(getParameter(request, "confirm_email",
                crb.getConfirmEmail()));
        crb.setEditorId(getParameterInteger(request, "editor_id",
                crb.getEditorId()));
        crb.setLanguageId(getParameterInteger(request, "language_id",
                crb.getLanguageId()));
        crb.setAgreeTerms("true".equals(getParameter(request, "terms", "false")));

    }

    public static void populateCoachFromSession(SessionInfoBean sib,
                                                CoachRegistrationBean crb)
            throws Exception {

        if (!sib.isCoach()) {
            throw(new Exception(INCORRECT_GROUP));
        }

        DataAccessInt dai = new DataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);
        Map map = new HashMap();

        map.put(DataAccessConstants.COMMAND, "coach_data");
        map.put(USER_ID_INPUT_CODE, "" + sib.getUserId());
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;
        ResultSetContainer.ResultSetRow rsr;

        rsc = (ResultSetContainer) data.get("coach_data");
        Iterator iterator = rsc.iterator();
        if (!iterator.hasNext()) {
            throw(new Exception(NO_USER_FOUND));
        }
        rsr = (ResultSetContainer.ResultSetRow) iterator.next();

        crb.setUserId(new Long(sib.getUserId()));
        crb.setHandle(sib.getHandle());

        crb.setFirstName((String) rsr.getItem("first_name").getResultData());
        crb.setLastName((String) rsr.getItem("last_name").getResultData());
        crb.setStateCode((String) rsr.getItem("state_code").getResultData());
        crb.setSchoolId((Long) rsr.getItem("school_id").getResultData());
        crb.setEmail((String) rsr.getItem("address").getResultData());
        crb.setConfirmEmail((String) rsr.getItem("address").getResultData());
        crb.setEditorId((Integer) rsr.getItem("editor_id").getResultData());
        crb.setLanguageId((Integer) rsr.getItem("language_id").getResultData());
    }

    public static void populateCoachStaticContent(CoachRegistrationBean crb)
            throws Exception {

        Context ctx = TCContext.getInitial();
        DataAccessInt dai = new CachedDataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);
        Map map = new HashMap();

        map.put(DataAccessConstants.COMMAND, "coach_form");
        Request req = new Request(map);
        Map data = dai.getData(req);

        ResultSetContainer rsc;
        ResultSetContainer.ResultSetRow rsr;

        rsc = (ResultSetContainer) data.get("state_list");
        List state_list = new ArrayList();
        state_list.add(new ListPairBean(null, "Pick a state"));
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            String state_code = (String) rsr.getItem("state_code").getResultData();
            String state_name = (String) rsr.getItem("state_name").getResultData();
            state_list.add(new ListPairBean(state_code, state_name));
        }

        crb.setStateList(state_list);

        rsc = (ResultSetContainer) data.get("editor_list");
        List editor_list = new ArrayList();
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            Integer editor_id = (Integer) rsr.getItem("editor_id").getResultData();
            String editor_desc = (String) rsr.getItem("editor_desc").getResultData();
            editor_list.add(new ListPairBean(editor_id, editor_desc));
        }

        crb.setEditorList(editor_list);

        rsc = (ResultSetContainer) data.get("language_list");
        List language_list = new ArrayList();
        for (Iterator i = rsc.iterator(); i.hasNext();) {
            rsr = (ResultSetContainer.ResultSetRow) i.next();
            Integer language_id = (Integer) rsr.getItem("language_id").getResultData();
            String language_name = (String) rsr.getItem("language_name").getResultData();
            language_list.add(new ListPairBean(language_id, language_name));
        }

        crb.setLanguageList(language_list);

        List school_list = new ArrayList();
        school_list.add(new ListPairBean(null, "Pick a school"));
        if (isValidListValue(crb.getStateCode(), crb.getStateList())) {
            map.put(DataAccessConstants.COMMAND, "state_schools");
            map.put(STATE_INPUT_CODE, crb.getStateCode());
            req = new Request(map);
            Map schools = dai.getData(req);

            rsc = (ResultSetContainer) schools.get("state_schools");
            for (Iterator i = rsc.iterator(); i.hasNext();) {
                rsr = (ResultSetContainer.ResultSetRow) i.next();
                Long school_id = (Long) rsr.getItem("school_id").getResultData();
                String full_name = (String) rsr.getItem("full_name").getResultData();
                school_list.add(new ListPairBean(school_id, full_name));
            }

        }
        crb.setSchoolList(school_list);

        TermsOfUseHome touh = (TermsOfUseHome) ctx.lookup(TermsOfUseHome.EJB_REF_NAME);
        TermsOfUse tou = touh.create();
        crb.setTermsOfUse(tou.getText(TERMS_OF_USE_ID, DBMS.HS_JTS_OLTP_DATASOURCE_NAME));
    }

    public static boolean isValidCoach(Map errors,
                                       CoachRegistrationBean crb)
            throws Exception {
        boolean valid = true;
        valid &= checkValidFirstName(errors, crb.getFirstName());
        valid &= checkValidLastName(errors, crb.getLastName());
        valid &= (checkValidState(errors, crb.getStateCode(), crb.getStateList()) &&
                checkValidSchool(errors, crb.getSchoolId(), crb.getSchoolList()));
        valid &= (crb.getUserId() != null || checkValidHandle(errors, crb.getHandle()));
        valid &= (!crb.getChangePassword() ||
                checkValidPassword(errors, crb.getPassword(), crb.getConfirmPassword()));
        valid &= checkValidEmail(errors, crb.getEmail(), crb.getConfirmEmail());
        valid &= checkValidEditor(errors, crb.getEditorId(),
                crb.getEditorList());
        valid &= checkValidLanguage(errors, crb.getLanguageId(),
                crb.getLanguageList());
        valid &= (crb.getUserId() != null ||
                checkAgreeTerms(errors, crb.getAgreeTerms()));
        return (valid);
    }

    public static void createCoach(CoachRegistrationBean crb)
            throws Exception {
        /* !!This is a hack!! Because the persisting is done in a web container, or
        * servlet, its not possible to use EJBContext.getUserTransaction(). Instead
        * we simply get a UserTransaction object for each database we are accessing.
        * The problem is that both commits cannot happen atomically. Hence errors in
        * one database will not force a rollback in another. This should be fixed!
        */
        UserTransaction utx_tchs = null;

        Context secCtx = null;
        InitialContext ctx = null;
        PrincipalMgrRemote pmr = null;
        UserPrincipal newUser = null;
        TCSubject createUser = new TCSubject(0);


        try {
            /*utx=EJBContext.getUserTransaction();
            utx.begin();*/

            secCtx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                    ApplicationServer.SECURITY_PROVIDER_URL);

            // this doesn't work because the JBoss context doesn't support
            // transactions
            /*utx_common=(UserTransaction)
                                      ctx.lookup("javax.transaction.UserTransaction");
            utx_common.begin();*/

            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)
                    secCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            pmr = pmrh.create();

            newUser = pmr.createUser(crb.getHandle(), crb.getPassword(), createUser);
            long user_id = newUser.getId();

            Collection groups = pmr.getGroups(createUser);
            for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                GroupPrincipal gp = (GroupPrincipal) iterator.next();
                if (gp.getName().equals(COACH_GROUP_NAME)) {
                    pmr.addUserToGroup(gp, newUser, createUser);
                } else if (gp.getName().equals(ANONYMOUS_GROUP_NAME)) {
                    pmr.addUserToGroup(gp, newUser, createUser);
                }
            }

            ctx = new InitialContext();

            utx_tchs = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
            utx_tchs.begin();

            UserHome uh = (UserHome) ctx.lookup(UserHome.EJB_REF_NAME);
            User user = uh.create();
            user.createUser(user_id, crb.getHandle(), NEW_USER_TYPE, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setFirstName(user_id, crb.getFirstName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setLastName(user_id, crb.getLastName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserSchoolHome ush = (UserSchoolHome)
                    ctx.lookup(UserSchoolHome.EJB_REF_NAME);
            UserSchool user_school = ush.create();
            user_school.createUserSchool(user_id, crb.getSchoolId().longValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user_school.setCurrentUserSchoolId(user_id,
                    crb.getSchoolId().longValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            EmailHome eh = (EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME);
            Email email = eh.create();
            long email_id = email.createEmail(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME, DBMS.HS_OLTP_DATASOURCE_NAME);
            email.setPrimaryEmailId(user_id, email_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setAddress(email_id, crb.getEmail(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setEmailTypeId(email_id, EMAIL_TYPE_ID_DEFAULT, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            Coder coder = (Coder)BaseProcessor.createEJB(ctx, Coder.class);
            coder.createCoder(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setMemberSince(user_id, new java.sql.Date(new Date().getTime()), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setEditorId(user_id, crb.getEditorId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setLanguageId(user_id, crb.getLanguageId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserTermsOfUseHome utouh = (UserTermsOfUseHome)
                    ctx.lookup(UserTermsOfUseHome.EJB_REF_NAME);
            UserTermsOfUse user_terms_of_use = utouh.create();
            user_terms_of_use.createUserTermsOfUse(user_id, TERMS_OF_USE_ID, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            RatingHome rh = (RatingHome) ctx.lookup(RatingHome.EJB_REF_NAME);
            Rating rating = rh.create();
            rating.createRating(user_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            /*utx.commit();*/

            /*utx_common.commit();*/
            utx_tchs.commit();
        } catch (Exception _e) {
            _e.printStackTrace();
            if (utx_tchs != null) {
                try {
                    utx_tchs.rollback();
                } catch (Exception _ex) {
                    log.error("error rolling back transaction");
                    _ex.printStackTrace();
                }
                //since we don't have a real transaction, we'll just try and remove what we created.
                pmr.removeUser(newUser, createUser);
            }
            throw(_e);
        }
    }

    public static void updateCoach(CoachRegistrationBean crb) throws Exception {

        /* This is bad, please see above comment */
        UserTransaction utx = null;
        PrincipalMgrRemote pmr = null;
        UserPrincipal existingUser = null;
        TCSubject createUser = new TCSubject(0);
        Context secCtx = null;
        String oldPass = null;
        try {
            /*utx=EJBContext.getUserTransaction();
            utx.begin();*/

            InitialContext ctx;

            if (crb.getChangePassword()) {
                secCtx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY,
                        ApplicationServer.SECURITY_PROVIDER_URL);

                PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)
                        secCtx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                pmr = pmrh.create();

                existingUser = pmr.getUser(crb.getHandle());
                oldPass = pmr.getPassword(existingUser.getId());
                pmr.editPassword(existingUser, crb.getPassword(), createUser);
            }

            ctx = new InitialContext();

            utx = (UserTransaction) ctx.lookup("javax.transaction.UserTransaction");
            utx.begin();

            UserHome uh = (UserHome) ctx.lookup(UserHome.EJB_REF_NAME);
            User user = uh.create();
            long userId = crb.getUserId().longValue();
            user.setFirstName(userId, crb.getFirstName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            user.setLastName(userId, crb.getLastName(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            UserSchoolHome ush = (UserSchoolHome)
                    ctx.lookup(UserSchoolHome.EJB_REF_NAME);
            UserSchool user_school = ush.create();
            long school_id = crb.getSchoolId().longValue();
            if (user_school.exists(userId, school_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME)) {
                user_school.setCurrentUserSchoolId(userId, school_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            } else {
                user_school.createUserSchool(userId, school_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
                user_school.setCurrentUserSchoolId(userId, school_id, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            }

            EmailHome eh = (EmailHome) ctx.lookup(EmailHome.EJB_REF_NAME);
            Email email = eh.create();
            long emailId = email.getPrimaryEmailId(userId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setPrimaryEmailId(userId, emailId, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setAddress(emailId, crb.getEmail(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            email.setEmailTypeId(emailId, EMAIL_TYPE_ID_DEFAULT, DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            Coder coder = (Coder)BaseProcessor.createEJB(ctx, Coder.class);
            coder.setEditorId(userId, crb.getEditorId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);
            coder.setLanguageId(userId, crb.getLanguageId().intValue(), DBMS.HS_JTS_OLTP_DATASOURCE_NAME);

            utx.commit();
        } catch (Exception _e) {
            _e.printStackTrace();
            if (utx != null) {
                try {
                    utx.rollback();
                } catch (Exception _ex) {
                    log.error("error rolling back transaction");
                    _ex.printStackTrace();
                }
            }
            //set their password back
            if (crb.getChangePassword()) {
                pmr.editPassword(existingUser, oldPass, createUser);
            }
            throw(_e);
        }
    }

    private static String getParameter(TCRequest request, String param,
                                       String defaultVal) {
        String value = request.getParameter(param);
        return (value == null || value.trim().length() == 0 ? defaultVal : value.trim());
    }

    private static Long getParameterLong(TCRequest request, String param,
                                         Long defaultVal) {
        Long value = defaultVal;
        try {
            value = new Long(request.getParameter(param));
        } catch (NumberFormatException _nfe) {
            /* do nothing */
        }
        return (value);
    }

    private static Integer getParameterInteger(TCRequest request,
                                               String param, Integer defaultVal) {
        Integer value = defaultVal;
        try {
            value = new Integer(request.getParameter(param));
        } catch (NumberFormatException _nfe) {
            /* do nothing */
        }
        return (value);
    }

    private static boolean isValidListValue(Object value, List list) {
        if (value == null) {
            return (false);
        }
        for (Iterator iterator = list.iterator(); iterator.hasNext();) {
            ListPairBean lpb = (ListPairBean) iterator.next();
            if (value.equals(lpb.getValue())) {
                return (true);
            }
        }
        return (false);
    }


    /**
     * Check for a valid first name
     */
    private static boolean checkValidFirstName(Map errors, String firstName) {
        if (firstName == null || firstName.length() == 0) {
            addErrorMessage(errors, "FirstName", FIRST_NAME_NOT_EMPTY);
            return (false);
        } else {
            if (firstName.length() >= MAX_FIRST_NAME_LENGTH) {
                addErrorMessage(errors, "FirstName", FIRST_NAME_TOO_LONG);
                return (false);
            }
        }
        return (true);
    }

    /**
     * Check for a valid last name
     */
    private static boolean checkValidLastName(Map errors, String lastName) {
        if (lastName == null || lastName.length() == 0) {
            addErrorMessage(errors, "LastName", LAST_NAME_NOT_EMPTY);
            return (false);
        } else {
            if (lastName.length() >= MAX_LAST_NAME_LENGTH) {
                addErrorMessage(errors, "LastName", LAST_NAME_TOO_LONG);
                return (false);
            }
        }
        return (true);
    }

    /**
     * Check for valid state code
     */
    private static boolean checkValidState(Map errors, String stateCode,
                                           List list) {
        if (!isValidListValue(stateCode, list)) {
            addErrorMessage(errors, "StateCode", INVALID_STATE_CODE);
            return (false);
        }
        return (true);
    }

    private static void addErrorMessage(Map errors, String key, String message) {
        List msgs = (List) errors.get(key);
        if (msgs == null) {
            msgs = new ArrayList();
            errors.put(key, msgs);
        }
        msgs.add(message);
    }

    /**
     * Check for valid school
     */
    private static boolean checkValidSchool(Map errors, Long schoolId,
                                            List list) {
        if (!isValidListValue(schoolId, list)) {
            addErrorMessage(errors, "SchoolId", INVALID_SCHOOL_ID);
            return (false);
        }
        return (true);
    }

    /**
     * Check for valid handle
     */
    private static boolean checkValidHandle(Map errors, String handle)
            throws Exception {
        if (handle == null || handle.length() == 0) {
            addErrorMessage(errors, "Handle", HANDLE_NOT_EMPTY);
            return (false);
        } else {
            for (int i = 0; i < handle.length(); i++) {
                if (HANDLE_ALPHABET.indexOf(handle.charAt(i)) == -1) {
                    addErrorMessage(errors, "Handle", INVALID_HANDLE);
                    return (false);
                }
            }
            boolean technical_problems = false;
            try {
                if (userExists(handle)) {
                    addErrorMessage(errors, "Handle", HANDLE_TAKEN);
                    return (false);
                }
            } catch (RemoteException _re) {
                _re.printStackTrace();
                technical_problems = true;
            } catch (CreateException _ce) {
                _ce.printStackTrace();
                technical_problems = true;
            } catch (NamingException _ne) {
                _ne.printStackTrace();
                technical_problems = true;
            } catch (GeneralSecurityException _gse) {
                _gse.printStackTrace();
                technical_problems = true;
            }
            if (technical_problems) {
                throw(new Exception(TECHNICAL_PROBLEMS));
            }
        }
        return (true);
    }

    protected static boolean userExists(String handle) throws Exception {
        Request r = new Request();
        r.setContentHandle("user exists");
        r.setProperty("hn", handle);

        DataAccessInt dai = new DataAccess(DBMS.HS_OLTP_DATASOURCE_NAME);

        ResultSetContainer rsc = (ResultSetContainer)dai.getData(r).get("user exists");
        return !rsc.isEmpty();

    }

    /**
     * Check for a valid password
     */
    private static boolean checkValidPassword(Map errors, String password,
                                              String confirmPassword) {
        if (password == null || password.length() == 0) {
            addErrorMessage(errors, "Password", PASSWORD_NOT_EMPTY);
            return (false);
        } else {
            if (password.length() < 7 || password.length() > 15) {
                addErrorMessage(errors, "Password", PASSWORD_WRONG_LENGTH);
                return (false);
            } else {
                if (!password.equals(confirmPassword)) {
                    addErrorMessage(errors, "Password", PASSWORD_NO_MATCH);
                    return (false);
                }
            }
        }
        return (true);
    }


    /**
     * Check for valid email address
     */
    private static boolean checkValidEmail(Map errors, String email,
                                           String confirmEmail) {
        if (email == null || email.length() == 0) {
            addErrorMessage(errors, "Email", EMAIL_NOT_EMPTY);
            return (false);
        } else {
            if (email.length() < 5 || email.indexOf("@") < 0 || email.indexOf(".") < 0) {
                addErrorMessage(errors, "Email", INVALID_EMAIL);
                return (false);
            } else {
                if (!email.equals(confirmEmail)) {
                    addErrorMessage(errors, "Email", EMAIL_NO_MATCH);
                    return (false);
                }
            }
        }
        return (true);
    }

    /**
     * Check for valid editor id
     */
    private static boolean checkValidEditor(Map errors, Integer editorId,
                                            List editorList) {
        if (!isValidListValue(editorId, editorList)) {
            addErrorMessage(errors, "EditorId", INVALID_EDITOR_ID);
            return (false);
        }
        return (true);
    }

    /**
     * Check for valid language id
     */
    private static boolean checkValidLanguage(Map errors, Integer languageId,
                                              List languageList) {
        if (!isValidListValue(languageId, languageList)) {
            addErrorMessage(errors, "LanguageId", INVALID_LANGUAGE_ID);
            return (false);
        }
        return (true);
    }

    /**
     * Check to make sure they agreed to the terms and conditions
     */
    private static boolean checkAgreeTerms(Map errors, boolean agreeTerms) {
        if (!agreeTerms) {
            addErrorMessage(errors, "AgreeTerms", MUST_AGREE_TERMS);
        }
        return (agreeTerms);
    }

}

;
