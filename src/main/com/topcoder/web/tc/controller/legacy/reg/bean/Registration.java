package com.topcoder.web.tc.controller.legacy.reg.bean;

import com.topcoder.common.web.data.*;
import com.topcoder.common.web.util.Cache;
import com.topcoder.ejb.AuthenticationServices.*;
import com.topcoder.ejb.DataCache.DataCache;
import com.topcoder.ejb.UserServices.UserServices;
import com.topcoder.ejb.UserServices.UserServicesHome;
import com.topcoder.shared.util.*;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.web.tc.view.reg.tag.Demographic;
import com.topcoder.web.tc.view.reg.tag.Notification;
import com.topcoder.web.ejb.resume.ResumeServices;
import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.StringUtils;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.NoSuchUserException;
import com.topcoder.security.TCSubject;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.UserPrincipal;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.transaction.Status;
import javax.transaction.UserTransaction;
import java.io.Serializable;
import java.math.BigInteger;
import java.util.*;


public class Registration
        extends Task
        implements Serializable {
    private static Logger log = Logger.getLogger(Registration.class);

    public static final String PROTOCOL = "http";
    public static final String HOST = ApplicationServer.SERVER_NAME;
    public static final String PATH = "/reg/";

    // steps
    public static final String STEP_0 = "0";
    public static final String STEP_1 = "1";
    public static final String STEP_2 = "2";
    public static final String STEP_3 = "3";
    public static final String STEP_4 = "4";
    public static final String DEFAULT_STEP = STEP_1;

    // pages
    public static final String PAGE_0 = PATH + "terms.jsp";
    public static final String PAGE_1 = PATH + "index.jsp";
    public static final String PAGE_2 = PATH + "demo.jsp";
    public static final String PAGE_3 = PATH + "confirm.jsp";
    public static final String PAGE_4 = PATH + "activate.jsp";
    public static final String PAGE_5A = PATH + "mail_sent.jsp";
    public static final String PAGE_5B = PROTOCOL + "://" + HOST;
    //public static final String PAGE_5 = "/";

    // step 1 attributes
    public static final String FIRST_NAME = "firstName";
    public static final String LAST_NAME = "lastName";
    public static final String ADDRESS1 = "address1";
    public static final String ADDRESS2 = "address2";
    public static final String CITY = "city";
    public static final String STATE = "state";
    public static final String ZIP = "zip";
    public static final String COUNTRY = "country";
    public static final String PHONE = "phone";
    public static final String HANDLE = "handle";
    public static final String PASSWORD = "password";
    public static final String CONFIRM_PASSWORD = "confirmPassword";
    public static final String EMAIL = "email";
    public static final String CONFIRM_EMAIL = "confirmEmail";
    //public static final String NOTIFY = "notify";
    public static final String LANGUAGE = "language";
    public static final String QUOTE = "quote";
    public static final String CODER_TYPE = "coderType";
//    public static final String SUN_CONFIRMATION = "sunConfirm";
    public static final String TERMS = "terms";

    // step 2 attributes
    public static final String REFERRAL = "referral";
    public static final String REFERRAL_SCHOOL_STATE = "referralSchoolState";
    public static final String REFERRAL_OTHER = "referralOther";
    public static final String NOTIFY_PREFIX = Notification.PREFIX;
    public static final String NOTIFY_DESC_PREFIX = Notification.DESC_PREFIX;
    public static final String DEMO_PREFIX = Demographic.PREFIX;
    public static final String DESC_PREFIX = Demographic.DESC_PREFIX;
    public static final String SCHOOL = "school";
    public static final String SCHOOL_STATE = "schoolState";
    public static final String SCHOOL_NAME = "schoolName";
    public static final String GPA = "gpa";
    public static final String GPA_SCALE = "gpaScale";
    public static final String COMP_COUNTRY = "compCountry";

    // step 3 attributes
    public static final String REGISTER = "register"; // error only

    // step 4 attributes
    public static final String CODE = "code";

    public static final String CODER = "Coder";
    public static final String CODER_TYPE_STUDENT = "1";
    public static final String CODER_TYPE_PROFESSIONAL = "2";
    public static final int PASSWORD_MIN_LENGTH = 7;
    public static final int PASSWORD_MAX_LENGTH = 15;
    public static final char MASK_CHAR = '*';
    public static final String CHECKBOX_YES = "on";
    //public static final String ACTIVATION_URL = PROTOCOL+"://"+HOST+PAGE_4;
    public static final String ACTIVATION_URL = PROTOCOL + "://" + HOST + "/tc?module=Activate&" + CODE + "=";
    public static final int DEFAULT_RATING = 0;

    // referral ids
    public static final int DECLINE_TO_ANSWER = 0;
    public static final int CAMPUS_JOB_FAIR_REFERRAL = 6;
    public static final int OTHER_REFERRAL = 10;
    public static final int NONMEMBER_REFERRAL = 20;
    public static final int NEWS_ARTICLE_REFERRAL = 30;
    public static final int NEWSLETTER_REFERRAL = 35;
    public static final int MEMBER_REFERRAL = 40;
    public static final int ANOTHER_WEBSITE_REFERRAL = 50;
    public static final int FACULTY_EMAIL_REFERRAL = 60;
    public static final int TOPCODER_EMAIL_REFERRAL = 70;
    public static final int JAVA_USER_GROUP_REFERRAL = 90;
    public static final int SEARCH_ENGINE_REFERRAL = 100;
    private final static String HANDLE_ALPHABET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
                                                "abcdefghijklmnopqrstuvwxyz"+
                                                "0123456789"+
                                                "-_.{}[]()";

    // school ids
    //public static final int OTHER_SCHOOL = 0;

    // organization ids
    //public static final int OTHER_ORGANIZATION = 0;

    // experience type ids
    public static final int WORK_EXPERIENCE = 0;
    //public static final int ORGANIZATION_EXPERIENCE = 1;

    // country codes
    public static final String USA = "840";

    // id for the sun contest
    public static final int SUN_CONTEST_ID = 4295;

    public static final int[] REFERRAL_ID = {DECLINE_TO_ANSWER, CAMPUS_JOB_FAIR_REFERRAL, OTHER_REFERRAL, NONMEMBER_REFERRAL, NEWS_ARTICLE_REFERRAL, NEWSLETTER_REFERRAL, MEMBER_REFERRAL, ANOTHER_WEBSITE_REFERRAL, FACULTY_EMAIL_REFERRAL, TOPCODER_EMAIL_REFERRAL, JAVA_USER_GROUP_REFERRAL, SEARCH_ENGINE_REFERRAL};

    private static final String DEMOGRAPHIC_QUESTION_EMPLOYER = "15";
    private static final String DEMOGRAPHIC_QUESTION_EMPLOYED = "21";
    private static final String DEMOGRAPHIC_ANSWER_EMPLOYED_YES = "141";

    protected String firstName;
    protected String lastName;
    protected String address1;
    protected String address2;
    protected String city;
    protected String state;
    protected String zip;
    protected String country;
    protected String phone;
    protected String handle;
    protected String password;
    protected String confirmPassword;
    protected String quote;
    protected String email;
    protected String confirmEmail;
    //protected String notify;
    //protected boolean notifyChecked;
    protected String language;
    protected String coderType;
//    protected String sunConfirm;
    protected String terms;
    protected String referral;
    protected boolean referralChanged;
    protected boolean referralInterfaceChanged;
    protected String referralSchoolState;
    protected boolean referralSchoolStateChanged;
    protected String referralOther;
    protected HashMap demographics;
    protected HashSet notifications;
    protected String schoolState;
    protected boolean schoolStateChanged;
    protected String school;
    protected String schoolName;
    protected String gpa;
    protected String gpaScale;
    protected String code;
    protected String compCountry;
    protected boolean hasResume;

    public Registration() {
        super();
        init();
    }

    void init() {
        log.info(" => REGISTRATION.INIT()");
        validSteps = new String[]{STEP_0, STEP_1, STEP_2, STEP_3, STEP_4};

        if (user == null || user.getUserId() == 0) {
            firstName = "";
            lastName = "";
            address1 = "";
            address2 = "";
            city = "";
            state = "";
            zip = "";
            country = "";
            phone = "";
            handle = "";
            password = "";
            confirmPassword = "";
            quote = "";
            email = "";
            confirmEmail = "";
            //notify = "";
            //notifyChecked = false;
            language = "";
            coderType = "";
//            sunConfirm = "";
            terms = "";
            referral = "";
            referralChanged = false;
            referralInterfaceChanged = false;
            referralSchoolState = "";
            referralSchoolStateChanged = false;
            referralOther = "";
            demographics = new HashMap();

            ArrayList notifyList = null;
            try {
                notifyList = Notification.getNotifications();
            } catch (Exception e) {
                notifyList = new ArrayList(0);
            }
            notifications = new HashSet(notifyList.size());
            for (int i = 0; i < notifyList.size(); i++) {
                Notify notify = (Notify) notifyList.get(i);
                notifications.add(Integer.toString(notify.getNotifyId()));
            }

            schoolState = "";
            schoolStateChanged = false;
            school = "";
            schoolName = "";
            code = "";
            gpa = "";
            gpaScale = "";
            hasResume = false;
            compCountry = "";
            resetUser();
        }
    }


    public void setStep(String step) {
        log.debug("previous step = " + getStep());
        //we're doing this because when we get the input
        //from the request, we'll only have the notifications
        //that are chosen, not the ones that are not chosen
        if (step!=null&&step.equalsIgnoreCase(STEP_1)) {
            notifications.clear();
            log.debug("notifications cleared...");
        }
        super.setStep(step);
        log.debug("super.setStep(" + step + ") called...");
    }


    public void setUser(User user) {
        super.setUser(user);
        if (userChanged) {
            userChanged = false;
            loadUser();
        }
    }

    void loadUser() {
        if (user == null || user.getUserId() == 0) return;

        log.info("loading User data");

        CoderRegistration coder = (CoderRegistration) user.getUserTypeDetails().get(CODER);
        firstName = checkNull(coder.getFirstName());
        lastName = checkNull(coder.getLastName());
        address1 = checkNull(coder.getHomeAddress1());
        address2 = checkNull(coder.getHomeAddress2());
        city = checkNull(coder.getHomeCity());
        state = checkNull(coder.getHomeState().getStateCode());
        zip = checkNull(coder.getHomeZip());
        country = checkNull(coder.getHomeCountry().getCountryCode());
        compCountry = checkNull(coder.getCompCountry().getCountryCode());
        phone = checkNull(coder.getHomePhone());
        handle = checkNull(user.getHandle());
        password = checkNull(user.getPassword());
        confirmPassword = password;
        quote = checkNull(coder.getQuote());
        email = checkNull(user.getEmail());
        confirmEmail = email;
        //notify = (checkNull(coder.getNotify()).equals("Y")?CHECKBOX_YES:"");
        //notifyChecked = false;
        language = Integer.toString(coder.getLanguage().getLanguageId());
        coderType = Integer.toString(coder.getCoderType().getCoderTypeId());
//        sunConfirm = checkNull(getSunConfirmation(coder.getCoderConfirmations()));
        terms = (checkNull(user.getTerms()).equals("Y")?CHECKBOX_YES:"");
        // referral data only used in Registration
        referral = Integer.toString(coder.getCoderReferral().getReferral().getReferralId());
        referralChanged = false;
        referralInterfaceChanged = false;
        referralSchoolState = "";
        referralSchoolStateChanged = false;
        referralOther = checkNull(coder.getCoderReferral().getOther());

        notifications.clear();
        try {
            ArrayList notificationObjects = coder.getNotifications();
            for (int i = 0; i < notificationObjects.size(); i++) {
                Notify notify = (Notify) notificationObjects.get(i);
                notifications.add(Integer.toString(notify.getNotifyId()));
            }
        } catch (Exception ignore) {
        }

        demographics = new HashMap();
        try {
            ArrayList assignments = getDemographicAssignments(coder.getCoderType().getCoderTypeId());
            for (int i = 0; i < assignments.size(); i++) {
                DemographicAssignment assignment = (DemographicAssignment) assignments.get(i);
                DemographicQuestion question = assignment.getDemographicQuestion();
                String questionId = Integer.toString(question.getDemographicQuestionId());
                ArrayList responseList = getDemographicResponses(coder.getDemographicResponses(), question.getDemographicQuestionId());
                if (responseList != null) {
                    for (int j = 0; j < responseList.size(); j++) {
                        DemographicResponse response = (DemographicResponse) responseList.get(j);
                        String answer = null;
                        if (question.getSelectable().equals("Y") || question.getSelectable().equals("M")) {
                            answer = Integer.toString(response.getDemographicAnswerId());
                        } else {
                            answer = response.getDemographicResponseText();
                        }
                        setDemographic(questionId, answer);
                    }

                } else {
                    log.info("No existing response for questionId=" + questionId);
                }
            }
        } catch (Exception ignore) {
        }


        if (!coder.getCurrentSchool().getName().equals("")) {
            schoolState = coder.getCurrentSchool().getState().getStateCode();
            schoolStateChanged = false;
            school = Integer.toString(coder.getCurrentSchool().getSchoolId());
            schoolName = coder.getCurrentSchool().getName();
            if (coder.getCurrentSchool().getGpa()!=0 && coder.getCurrentSchool().getGpaScale()!=0) {
                gpa = ""+coder.getCurrentSchool().getGpa();
                gpaScale = ""+coder.getCurrentSchool().getGpaScale();
            }
        } else {
            schoolState = "";
            schoolStateChanged = false;
            school = "";
            schoolName = "";
        }


        code = "";

        ResumeServices rServices = null;
        try {
            rServices = (ResumeServices)BaseProcessor.createEJB(TCContext.getInitial(), ResumeServices.class);
            hasResume = rServices.hasResume(user.getUserId(), DBMS.OLTP_DATASOURCE_NAME);
        } catch (Exception e) {
            log.error("could not determine if user has a resume or not");
        }
    }



    public void process()
            throws TaskException {
        log.info("Registration.process()");
        //if (isStep(STEP_0))
        //{
        //clearErrors();
        //}
        //else
        if (isStep(STEP_1)) {
            clearErrors();

            if (isEmpty(this.firstName)) addError(FIRST_NAME, "Please enter your first name.");

            if (isEmpty(this.lastName)) addError(LAST_NAME, "Please enter your last name.");

            if (isEmpty(this.country)) addError(COUNTRY, "Please choose your country.");

            if (isEmpty(this.phone)) addError(PHONE, "Please enter your phone number.");

            if (isEmpty(this.handle)) {
                addError(HANDLE, "Please enter your desired handle.");
            } else if (!isValidHandle(this.handle)) {
                addError(HANDLE, "Your handle may contain only letters, numbers, {}[]()-_.");
            } else if
            (
            // if handle has the word "guest" in it
                    this.handle.toLowerCase().indexOf("guest") >= 0
                    //  or new registration and the handle exists
                    || (isRegister() && handleExists(this.handle))
                    //  or update registration, the handle changes, and the new handle exists
                    || (!isRegister() && !this.handle.equalsIgnoreCase(user.getHandle()) && handleExists(this.handle))
            ) {
                addError(HANDLE, "Please choose another handle.");
            }

            if (isEmpty(this.password))
                addError(PASSWORD, "Please enter your password.");
            else if (this.password.length() < PASSWORD_MIN_LENGTH)
                addError(PASSWORD, "Please make sure your password is at least " + PASSWORD_MIN_LENGTH + " characters long.");
            else if (this.password.length() > PASSWORD_MAX_LENGTH)
                addError(PASSWORD, "Please make sure your password is at most " + PASSWORD_MAX_LENGTH + " characters long.");
            else if (isEmpty(this.confirmPassword))
                addError(CONFIRM_PASSWORD, "Please re-type your password.");
            else if (!this.confirmPassword.equals(this.password)) addError(CONFIRM_PASSWORD, "Your re-typed password does not match your password.");

            if (isEmpty(this.email))
                addError(EMAIL, "Please enter your email address.");
            else if (isEmpty(this.confirmEmail))
                addError(CONFIRM_EMAIL, "Please re-type your email address.");
            else if (!this.confirmEmail.equals(this.email)) addError(CONFIRM_EMAIL, "Your re-typed email does not match your email.");
            //this.notify = (notifyChecked?CHECKBOX_YES:"");
            //notifyChecked = false;

            if (!isNumber(this.language)) addError(LANGUAGE, "Please choose a default programming language.");

            if (
                    !isNumber(this.coderType)
                    || !(
                    coderType.equals(CODER_TYPE_STUDENT)
                    || coderType.equals(CODER_TYPE_PROFESSIONAL)
                    )
            )
                addError(CODER_TYPE, "Please choose one.");

            if (isRegister()) {
                this.schoolState = state;
                this.referralSchoolState = state;
                this.compCountry = country;
            } else {
                if (isEmpty(this.compCountry)) addError(COMP_COUNTRY, "Please fill in the country you would like to represen.");
            }



            if (isRegister() && isEmpty(this.terms)) addError(TERMS, "Please read and agree to terms to register.");

        } else if (isStep(STEP_2)) {
            clearErrors();

            if (isRegister()) {
                if (this.referralOther.equals(getReferralOtherPrompt()) || referralInterfaceChanged) setReferralOther("");

                if (!isNumber(this.referral)) addError(REFERRAL, "Please tell us how you learned of TopCoder.");

                if (referralInterfaceChanged) {
                    addError(REFERRAL_OTHER, ""); // hack to prevent progression to step 3
                    referralInterfaceChanged = false;
                } else {
                    if (this.referral.equals(Integer.toString(OTHER_REFERRAL)) || this.referral.equals(Integer.toString(MEMBER_REFERRAL)) || this.referral.equals(Integer.toString(ANOTHER_WEBSITE_REFERRAL))) {
                        if (isEmpty(this.referralOther))
                            addError(REFERRAL_OTHER, "Please enter the " + getReferralOtherDesc());
                        else if (this.referral.equals(Integer.toString(MEMBER_REFERRAL))) {

                            if (!handleExists(this.referralOther)) addError(REFERRAL_OTHER, "There is no member with handle \"" + this.referralOther + "\".");
                        }
                    } else if (this.referral.equals(Integer.toString(CAMPUS_JOB_FAIR_REFERRAL)) && referralSchoolStateChanged) {
                        addError(REFERRAL_OTHER, "Please select the school where the job fair was held.");
                        referralSchoolStateChanged = false;
                    }
                }
            }
            if (coderType.equals(CODER_TYPE_STUDENT)) {
                if (schoolStateChanged && !isNumber(this.school) && this.country.equals(USA)) {
                    log.debug("school State HAS changed...");
                    addError(SCHOOL, "Please select your school.");
                    schoolStateChanged = false;
                }
                if (!isNumber(this.school) && this.country.equals(USA)) {
                    log.debug("this.school is not a number =>" + this.school);
                    addError(SCHOOL, "Please select your school.");
                }
               
                if ((!isEmpty(this.gpa) && !isNumber(this.gpa, true)) ||
                       (isEmpty(this.gpa) && !isEmpty(this.gpaScale))) {
                    addError(GPA, "Please enter a valid GPA.");
                }
                if ((!isEmpty(this.gpaScale) && !isNumber(this.gpaScale, true)) ||
                       (!isEmpty(this.gpa) && isEmpty(this.gpaScale))) {
                    addError(GPA_SCALE, "Please enter a valid GPA Scale.");
                }
                if (!isEmpty(this.gpa) && isNumber(this.gpa, true) && 
                    !isEmpty(this.gpaScale) && isNumber(this.gpaScale, true) &&
                    Float.parseFloat(this.gpa) > Float.parseFloat(this.gpaScale)) {
                    addError(GPA, "GPA must be less than or equal to the GPA scale.");
                }
            }

            boolean employed = false;
            boolean employerBlank = false;
            String employerQuestionText = "";
            for (Iterator iterator = demographics.keySet().iterator(); iterator.hasNext();) {
                String strQuestionId = (String) iterator.next();
                ArrayList answerList = (ArrayList) demographics.get(strQuestionId);
                for (int i = 0; i < answerList.size(); i++) {
                    String strAnswerId = (String) answerList.get(i);
                    if (strQuestionId.equals(DEMOGRAPHIC_QUESTION_EMPLOYED) && strAnswerId.equals(DEMOGRAPHIC_ANSWER_EMPLOYED_YES)) {
                        employed = true;
                    }
                    if (strAnswerId.equals("")) {
                        ArrayList assignments = getDemographicAssignments(Integer.parseInt(this.coderType));
                        for (int j = 0; j < assignments.size(); j++) {
                            DemographicAssignment assignment = (DemographicAssignment) assignments.get(j);
                            DemographicQuestion question = assignment.getDemographicQuestion();
                            if (Integer.parseInt(strQuestionId) == question.getDemographicQuestionId()) {
                                if (!question.getSelectable().equals("N")) {
                                    addError(DEMO_PREFIX + strQuestionId, "Please select: " + question.getDemographicQuestionText());
                                } else if (strQuestionId.equals(DEMOGRAPHIC_QUESTION_EMPLOYER)) {
                                    employerBlank = true;
                                    employerQuestionText = question.getDemographicQuestionText();
                                }
                                break;
                            }
                        }
                    }
                }
            }
            if (employed && employerBlank && coderType.equals(CODER_TYPE_PROFESSIONAL)) {
                addError(DEMO_PREFIX + DEMOGRAPHIC_QUESTION_EMPLOYER, "Please select: " + employerQuestionText);
            }
        } else if (isStep(STEP_3)) {
            clearErrors();

            register();

            if (isRegister()) {
                //resetUser();
                init();
            }
        } else if (isStep(STEP_4)) {
            clearErrors();

            if (isEmpty(this.code))
                addError(CODE, "Please make sure the activation URL is complete.");
            else if (!activate())
                addError(CODE, "Unable to activate.  Please contact service@topcoder.com");
            else
                addError(CODE, "Activation complete.  Please continue to the home page to log in.");
        }
    }

    public void setProcess(String ignore) {
        try {
            process();
        } catch (TaskException e) {
        }
    }

    public static boolean isValidHandle(String handle) {
        for (int i = 0; i < handle.length(); i++) {
            if (HANDLE_ALPHABET.indexOf(handle.charAt(i)) == -1) {
                return false;
            }
        }
        return true;
    }

    public String getNextPage() {
        log.debug("Registration.getNextPage() step = : " + step);
        if (step==null) {
            return PAGE_1;
        }
        if (isStep(STEP_0)) {
            log.debug("STEP_0 REG");
            if (isValid()) {
                log.debug("STEP_0 ISVALID");
                return PAGE_1;
            } else {
                log.debug("STEP_0 INVALID");
                if (isRegister()) {
                    return PAGE_5A;
                } else {
                    return PAGE_5B;
                }
            }
        }
        if (isStep(STEP_1)) {
            if (isValid()) {
                return PAGE_2;
            } else {
                return PAGE_1;
            }
        } else if (isStep(STEP_2)) {
            if (isValid()) {
                return PAGE_3;
            } else {
                return PAGE_2;
            }
        } else if (isStep(STEP_3)) {
            if (isValid()) {
                if (isRegister()) {
                    return PAGE_5A;
                } else {
                    return PAGE_5B;
                }
            } else {
                return PAGE_3;
            }
        } else if (isStep(STEP_4)) {
            if (isValid()) {
                if (isRegister()) {
                    return PAGE_5A;
                } else {
                    return PAGE_5B;
                }
            } else {
                return PAGE_4;
            }
        }

        return PAGE_1;
    }

    public boolean setAttributes(String name, String[] valArray) {
        String value = valArray[0];
        value = (value == null?"":value.trim());
        if (!name.equals("TermDesc")) {
            log.debug("Registration.setAttribute(\"" + name + "\",\"" + value + "\")");
        }
        if (isStep(STEP_1)) {
            if (name.equalsIgnoreCase(FIRST_NAME))
                setFirstName(value);
            else if (name.equalsIgnoreCase(LAST_NAME))
                setLastName(value);
            else if (name.equalsIgnoreCase(ADDRESS1))
                setAddress1(value);
            else if (name.equalsIgnoreCase(ADDRESS2))
                setAddress2(value);
            else if (name.equalsIgnoreCase(CITY))
                setCity(value);
            else if (name.equalsIgnoreCase(STATE))
                setState(value);
            else if (name.equalsIgnoreCase(ZIP))
                setZip(value);
            else if (name.equalsIgnoreCase(COUNTRY))
                setCountry(value);
            else if (name.equalsIgnoreCase(COMP_COUNTRY))
                setCompCountry(value);
            else if (name.equalsIgnoreCase(PHONE))
                setPhone(value);
            else if (name.equalsIgnoreCase(HANDLE))
                setHandle(value);
            else if (name.equalsIgnoreCase(PASSWORD))
                setPassword(value);
            else if (name.equalsIgnoreCase(CONFIRM_PASSWORD))
                setConfirmPassword(value);
            else if (name.equalsIgnoreCase(QUOTE))
                setQuote(value);
            else if (name.equalsIgnoreCase(EMAIL))
                setEmail(value);
            else if (name.equalsIgnoreCase(CONFIRM_EMAIL))
                setConfirmEmail(value);
            //else if (name.equalsIgnoreCase(NOTIFY)) setNotify(value);
            else if (name.equalsIgnoreCase(LANGUAGE))
                setLanguage(value);
            else if (name.equalsIgnoreCase(CODER_TYPE))
                setCoderType(value);
/*
            else if (name.equalsIgnoreCase(SUN_CONFIRMATION))
                setSunConfirm(value);
*/
            else if (name.equalsIgnoreCase(TERMS))
                setTerms(value);
            else if (name.startsWith(NOTIFY_PREFIX)) {
                setNotification(name.substring(NOTIFY_PREFIX.length()), value);
                log.debug("NOTIFICATION SET: " + name.substring(NOTIFY_PREFIX.length()) + "=" + value);
            } else
                return false;
        } else if (isStep(STEP_2)) {
            if (name.equalsIgnoreCase(REFERRAL))
                setReferral(value);
            else if (name.equalsIgnoreCase(REFERRAL_SCHOOL_STATE))
                setReferralSchoolState(value);
            else if (name.equalsIgnoreCase(REFERRAL_OTHER))
                setReferralOther(value);
            else if (name.equalsIgnoreCase(SCHOOL_STATE))
                setSchoolState(value);
            else if (name.equalsIgnoreCase(SCHOOL))
                setSchool(value);
            else if (name.equalsIgnoreCase(GPA))
                setGpa(value);
            else if (name.equalsIgnoreCase(GPA_SCALE))
                setGpaScale(value);
            else if (name.startsWith(DEMO_PREFIX))
                setDemographics(name.substring(DEMO_PREFIX.length()), valArray);
            else
                return false;
        } else if (isStep(STEP_3)) {
        } else if (isStep(STEP_4)) {
            if (name.equalsIgnoreCase(CODE)) setCode(value);
        }
        return true;
    }



    public void setFirstName(String value) {
        this.firstName = checkNull(value);
    }

    public void setLastName(String value) {
        this.lastName = checkNull(value);
    }

    public void setAddress1(String value) {
        this.address1 = checkNull(value);
    }

    public void setAddress2(String value) {
        this.address2 = checkNull(value);
    }

    public void setCity(String value) {
        this.city = checkNull(value);
    }

    public void setState(String value) {
        this.state = checkNull(value);
    }

    public void setZip(String value) {
        this.zip = checkNull(value);
    }

    public void setCountry(String value) {
        this.country = checkNull(value);
    }

    public void setPhone(String value) {
        this.phone = checkNull(value);
    }

    public void setHandle(String value) {
        this.handle = checkNull(value);
    }

    public void setPassword(String value) {
        this.password = checkNull(value);
    }

    public void setQuote(String value) {
        this.quote = checkNull(value);
    }

    public void setConfirmPassword(String value) {
        this.confirmPassword = checkNull(value);
    }

    public void setEmail(String value) {
        this.email = checkNull(value);
    }

    public void setConfirmEmail(String value) {
        this.confirmEmail = checkNull(value);
    }

    //public void setNotify(String value)
    //{
    //notifyChecked = true;
    //this.notify = checkNull(value);
    //}

    public void setLanguage(String value) {
        this.language = checkNull(value);
    }

    public void setCoderType(String value) {
        this.coderType = checkNull(value);
    }
/*
    public void setSunConfirm(String value) {
        this.sunConfirm = checkNull(value);
    }
*/
    public void setTerms(String value) {
        this.terms = checkNull(value);
    }

    public void setReferral(String value) {
        referralChanged = !this.referral.equals(checkNull(value));
        referralInterfaceChanged = referralChanged && (this.referral.equals(Integer.toString(CAMPUS_JOB_FAIR_REFERRAL)) || checkNull(value).equals(Integer.toString(CAMPUS_JOB_FAIR_REFERRAL)));
        this.referral = checkNull(value);
    }

    public void setReferralSchoolState(String value) {
        referralSchoolStateChanged = !this.referralSchoolState.equals(checkNull(value));
        this.referralSchoolState = checkNull(value);
    }

    public void setReferralOther(String value) {
        this.referralOther = checkNull(value);
    }

    public void setSchoolState(String value) {
        log.debug("setSchoolState(" + value + ") called: schoolStateChanged=" + schoolStateChanged);
        log.debug("this.schoolState = " + this.schoolState);
        schoolStateChanged = !this.schoolState.equals(checkNull(value));
        this.schoolState = checkNull(value);
        log.debug("this.schoolState=" + this.schoolState + ": schoolStateChanged=" + schoolStateChanged);

    }

    public void setSchool(String value) {
        log.debug("setSchool(" + value + ") called");
        this.school = checkNull(value);
    }

    public void setSchoolName(String value) {
        log.debug("setSchoolName(" + value + ") called");
        this.schoolName = checkNull(value);
    }


    public void setGpa(String value) {
        log.debug("setGpa(" + value + ") called");
        this.gpa = checkNull(value);
    }

    public void setGpaScale(String value) {
        log.debug("setGpaScale(" + value + ") called");
        this.gpaScale = checkNull(value);
    }

    public void setNotification(String notifyId, String value) {
        try {
            Integer.parseInt(notifyId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        this.notifications.add(notifyId);
    }


    public void setDemographics(String questionId, String[] value) {
        if (this.demographics.containsKey(questionId)) {
            this.demographics.remove(questionId);
            log.debug("setDemographic: questionId removed from demographics hash: " + questionId);
        }

        for (int i = 0; i < value.length; i++) {
            setDemographic(questionId, value[i]);
        }

    }

// LEFT OFF
    public void setDemographic(String questionId, String value) {
        try {
            Integer.parseInt(questionId);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        ArrayList answers = null;
        if (this.demographics.containsKey(questionId)) {
            answers = (ArrayList) this.demographics.get(questionId);
            log.debug("setDemographic: demographics hash: found QId for: " + questionId);
        } else {
            answers = new ArrayList();
            this.demographics.put(questionId, answers);
            log.debug("setDemographic: demographics hash: did not find QId for: " + questionId);
        }

        int pos = answers.indexOf(value);
        log.debug("setDemographic: found in answer list: " + value + " at " + pos);

        if (pos > -1) {
            answers.remove(pos);
            log.debug("setDemographic: answer list removed: " + pos);
        }

        //if ( !isEmpty(value) ) {
        answers.add(value);
        log.debug("setDemographic: answer list added: " + value);
        //}

        if (answers.size() == 0) {
            this.demographics.remove(questionId);
            log.debug("setDemographic: questionId removed from demographics hash: " + questionId);
        }

    }

    public void setCode(String value) {
        this.code = checkNull(value);
    }

    public void setHasResume(boolean hasResume) {
        this.hasResume = hasResume;
    }

    public String getCompCountry() {
        return compCountry;
    }

    public void setCompCountry(String compCountry) {
        this.compCountry = compCountry;
    }


    String checkNull(String s) {
        return (s == null ? "" : s);
    }

    public String getDemographicError(String id) {
        return getError(DEMO_PREFIX + id);
    }


    public String getFirstName() {
        return this.firstName;
    }

    public String getFirstNameError() {
        return getError(FIRST_NAME);
    }


    public String getLastName() {
        return this.lastName;
    }

    public String getLastNameError() {
        return getError(LAST_NAME);
    }

    public String getAddress1() {
        return this.address1;
    }

    public String getAddress1Error() {
        return getError(ADDRESS1);
    }

    public String getAddress2() {
        return this.address2;
    }

    public String getAddress2Error() {
        return getError(ADDRESS2);
    }

    public String getCity() {
        return this.city;
    }

    public String getCityError() {
        return getError(CITY);
    }

    public String getState() {
        return this.state;
    }

    public String getStateError() {
        return getError(STATE);
    }

    public String getZip() {
        return this.zip;
    }

    public String getZipError() {
        return getError(ZIP);
    }

    public String getCountry() {
        return this.country;
    }

    public String getCountryError() {
        return getError(COUNTRY);
    }

    public String getPhone() {
        return this.phone;
    }

    public String getPhoneError() {
        return getError(PHONE);
    }

    public String getHandle() {
        return this.handle;
    }

    public String getHandleError() {
        return getError(HANDLE);
    }

    public String getPassword() {
        return this.password;
    }

    public String getQuote() {
        return this.quote;
    }

    public String getMaskedPassword() {
        if (this.password == null) return "";
        StringBuffer maskedPassword = new StringBuffer(this.password.length());
        for (int i = 0; i < this.password.length(); i++) {
            maskedPassword.append(MASK_CHAR);
        }
        return maskedPassword.toString();
    }

    public String getPasswordError() {
        return getError(PASSWORD);
    }

    public String getQuoteError() {
        return getError(QUOTE);
    }

    public String getConfirmPassword() {
        return this.confirmPassword;
    }

    public String getConfirmPasswordError() {
        return getError(CONFIRM_PASSWORD);
    }

    public String getEmail() {
        return this.email;
    }

    public String getEmailError() {
        return getError(EMAIL);
    }

    public String getConfirmEmail() {
        return this.confirmEmail;
    }

    public String getConfirmEmailError() {
        return getError(CONFIRM_EMAIL);
    }

    //public String getNotify()
    //{
    //return this.notify;
    //}

    //public String getNotifyError()
    //{
    //return getError(NOTIFY);
    //}

    public String getLanguage() {
        return this.language;
    }

    public String getLanguageError() {
        return getError(LANGUAGE);
    }

    public String getCompCountrError() {
        return getError(COMP_COUNTRY);
    }

    public String getCoderType() {
        return this.coderType;
    }
/*
    public String getSunConfirm() {
        return this.sunConfirm;
    }
*/

    public String getCoderTypeError() {
        return getError(CODER_TYPE);
    }

    public String getTerms() {
        return this.terms;
    }

    public String getTermsError() {
        return getError(TERMS);
    }

    public String getReferral() {
        return this.referral;
    }

    public int getReferralInt() {
        int FAIL = -1;
        try {
            return Integer.parseInt(this.referral);
        } catch (Exception e) {
        }
        return FAIL;
    }

    public String getReferralError() {
        return getError(REFERRAL);
    }

    public String getReferralSchoolState() {
        return this.referralSchoolState;
    }

    public String getReferralSchoolStateError() {
        return getError(REFERRAL_SCHOOL_STATE);
    }

    public String getReferralOther() {
        return isEmpty(this.referralOther)?getReferralOtherPrompt():this.referralOther;
    }

    public String getReferralOtherPrompt() {
        return getReferralOtherPrompt(getReferralInt());
    }

    public String getReferralOtherPrompt(int referralId) {
        return isEmpty(getReferralOtherDesc(referralId))?"":"(" + getReferralOtherDesc(referralId) + ")";
    }

    public String getReferralOtherDesc() {
        return getReferralOtherDesc(getReferralInt());
    }

    public String getReferralOtherDesc(int referralId) {
        switch (referralId) {
            case DECLINE_TO_ANSWER:
                return "no details required";
            case CAMPUS_JOB_FAIR_REFERRAL:
                return "job fair location";
            case OTHER_REFERRAL:
                return "description of other - required";
            case NONMEMBER_REFERRAL:
                return "non-member name";
            case NEWS_ARTICLE_REFERRAL:
                return "news article";
            case NEWSLETTER_REFERRAL:
                return "newsletter";
            case MEMBER_REFERRAL:
                return "member handle - required";
            case ANOTHER_WEBSITE_REFERRAL:
                return "website URL - required";
            case FACULTY_EMAIL_REFERRAL:
                return "faculty member name";
            case TOPCODER_EMAIL_REFERRAL:
                return "TopCoder email";
            case JAVA_USER_GROUP_REFERRAL:
                return "Java user group name";
            case SEARCH_ENGINE_REFERRAL:
                return "search engine";
        }
        return "";
    }

    public String getReferralOtherError() {
        return getError(REFERRAL_OTHER);
    }

    public String getSchoolState() {
        return this.schoolState;
    }

    public String getSchoolStateError() {
        return getError(SCHOOL_STATE);
    }

    public String getSchool() {
        return this.school;
    }

    public String getSchoolName() {
        return this.schoolName;
    }

    public String getGpa() {
        return this.gpa;
    }

    public String getGpaScale() {
        return this.gpaScale;
    }

    public String getSchoolError() {
        return getError(SCHOOL);
    }

    public String getSchoolNameError() {
        return getError(SCHOOL_NAME);
    }

    public String getGpaError() {
        return getError(GPA);
    }

    public String getGpaScaleError() {
        return getError(GPA_SCALE);
    }


    /*   this stuff all handled by demographics

    public String getMajor()
    {
        return this.major;
    }
    public String getMajorError()
    {
        return getError(MAJOR);
    }
    public String getDegree()
    {
        return this.degree;
    }
    public String getDegreeError()
    {
        return getError(DEGREE);
    }
    public String getGraduationYear()
    {
        return this.graduationYear;
    }
    public String getGraduationYearError()
    {
        return getError(GRADUATION_YEAR);
    }
    */




/*
    public String getOrganization()
    {
        return this.organization;
    }
    public String getOrganizationError()
    {
        return getError(ORGANIZATION);
    }
    public String getOrganizationOther()
    {
        return isEmpty(this.organizationOther)?getOrganizationOtherPrompt():this.organizationOther;
    }

    public String getOrganizationOtherPrompt()
    {
        return "club / organization name";
    }
    public String getOrganizationOtherError()
    {
        return getError(ORGANIZATION_OTHER);
    }
*/

    public ArrayList getDemographic(String questionId) {
        ArrayList result = null;
        if (demographics.containsKey(questionId)) {
            result = (ArrayList) this.demographics.get(questionId);
        }
        return result;
    }

    public Set getNotifications() {
        return notifications;
    }

    public Map getDemographics() {
        return demographics;
    }

    public String getCode() {
        return this.code;
    }


    public String getCodeError() {
        return getError(CODE);
    }

    public String getRegisterError() {
        return getError(REGISTER);
    }

    protected boolean handleExists(String handle)
            throws TaskException {
        Request r = new Request();
        r.setContentHandle("user exists");
        r.setProperty("hn", handle);

        ResultSetContainer rsc = null;
        try {
            rsc = (ResultSetContainer)new DataAccess(DBMS.OLTP_DATASOURCE_NAME).getData(r).get("user exists");
        } catch (Exception e) {
            throw new TaskException("failed trying to check if user exists: " + e.getMessage());
        }
        return !rsc.isEmpty();
    }

    protected User getUser(String handle)
            throws TaskException {
        InitialContext context = null;
        Map users = null;
        try {
            context = TCContext.getInitial();
            AuthenticationServices authenticationServices = (AuthenticationServices)BaseProcessor.createEJB(context, AuthenticationServices.class);
            users = authenticationServices.getLikeUsers(handle);
        } catch (Exception e) {
            log.error(e.toString());
            throw new TaskException(e);
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        if (users != null) {
            Map.Entry me = null;
            for (Iterator i = users.entrySet().iterator(); i.hasNext();) {
                me = (Map.Entry) i.next();
                if (((String) me.getValue()).equalsIgnoreCase(handle)) {
                    User user = new User();
                    user.setHandle((String) me.getValue());
                    user.setUserId(((Integer) me.getKey()).intValue());
                    return user;
                }
            }
        }
        return null;
    }


    public static String getStateName(String stateCode)
            throws TaskException {
        String result = "";
        try {
            DataCache cache = Cache.get();
            ArrayList states = cache.getStates();
            for (int i = 0; i < states.size(); i++) {
                State stateObj = (State) states.get(i);
                if (stateObj.getStateCode().equals(stateCode)) {
                    return stateObj.getStateName();
                }
            }
        } catch (Exception e) {
            log.error(e.toString());
            throw new TaskException(e);
        }
        return result;
    }


    public static String getSchoolName(int schoolName)
            throws TaskException {
        String result = "";
        try {
            DataCache cache = Cache.get();
            ArrayList schools = cache.getSchools();
            for (int i = 0; i < schools.size(); i++) {
                School schoolObj = (School) schools.get(i);
                if (schoolObj.getSchoolId() == schoolName) {
                    return schoolObj.getName();
                }
            }
        } catch (Exception e) {
            log.error(e.toString());
            throw new TaskException(e);
        }
        return result;
    }

    public boolean getDemographicDecline()
            throws TaskException {
        try {
            DataCache cache = Cache.get();
            ArrayList states = cache.getStates();
            for (int i = 0; i < states.size(); i++) {
                State stateObj = (State) states.get(i);
                if (stateObj.getStateCode().equals(state)) {
                    if (stateObj.getDemographicDecline() == State.YES) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            log.error(e.toString());
            throw new TaskException(e);
        }
        return false;
    }


    ArrayList getDemographicAssignments(int coderType)
            throws TaskException {
        ArrayList demographicAssignments = new ArrayList();
        Context context = null;
        try {
            DataCache cache = Cache.get();
            demographicAssignments.addAll(cache.getDemographicAssignments(coderType));
        } catch (Exception e) {
            log.error(e.toString());
            throw new TaskException(e);
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }
        return demographicAssignments;
    }

    DemographicAnswer getDemographicAnswer(ArrayList answers, int answerId) {
        for (int i = 0; i < answers.size(); i++) {
            DemographicAnswer answer = (DemographicAnswer) answers.get(i);
            if (answer.getDemographicAnswerId() == answerId) {
                return answer;
            }
        }
        return null;
    }


    ArrayList getDemographicResponses(ArrayList responses, int questionId) {
        ArrayList result = null;
        for (int i = 0; i < responses.size(); i++) {
            DemographicResponse response = (DemographicResponse) responses.get(i);
            if (response.getDemographicQuestionId() == questionId) {
                if (result == null) {
                    result = new ArrayList(responses.size());
                }
                result.add(response);
            }
        }
        if (result != null) {
            result.trimToSize();
        }
        return result;
    }

    public boolean hasResume() {
        return hasResume;
    }

    public boolean isEdit() {
        return this.user != null && this.user.getUserId() > 0;
    }

    public boolean isRegister() {
        return this.user == null || this.user.getUserId() == 0;
    }


    protected void register()
            throws TaskException {
        log.info(" <= REGISTRATION.REGISTER()");
        User user;
        CoderRegistration coder;
        if (isEdit()) {
            user = this.user;
            user.setModified("U");
            coder = (CoderRegistration) user.getUserTypeDetails().get(CODER);
            coder.setModified("U");
        } else {
            user = new User();
            user.setModified("A");
            user.setLoggedIn("N");
            GroupUser groupUser = new GroupUser();
            groupUser.setModified("A");
            groupUser.setUserId(user.getUserId());
            groupUser.getGroup().setGroupId(10);
            groupUser.getGroup().setGroupDesc("Coders");
            user.getGroups().add(groupUser);
            coder = new CoderRegistration();
            coder.setModified("A");
            user.getUserTypeDetails().put(CODER, coder);
            user.setStatus("U");
            user.getDefaultUserType().setUserTypeId(1);
            user.getDefaultUserType().setUserTypeDesc(CODER);
            coder.getRating().setModified("A");
            coder.getRating().setRating(DEFAULT_RATING);
        }

        coder.setFirstName(firstName);
        coder.setLastName(lastName);
        coder.setHomeAddress1(address1);
        coder.setHomeAddress2(address2);
        coder.setHomeCity(city);
        State state = new State();
        state.setStateCode(this.state);
        coder.setHomeState(state);
        coder.setHomeZip(zip);
        Country country = new Country();
        country.setCountryCode(this.country);
        coder.setHomeCountry(country);
        coder.setHomePhone(phone);
        //only set the handle if they're creating an account, or their old handle is invalid.
        //we don't allow handle updates otherwise
        if (isRegister() || !isValidHandle(user.getHandle()))
            user.setHandle(handle);
        user.setPassword(password);
        user.setEmail(email);
        coder.setQuote(quote);
        //coder.setNotify((notify.equalsIgnoreCase(CHECKBOX_YES)?"Y":"N"));

        ArrayList cachedNotify = null;
        try {
            DataCache cache = Cache.get();
            cachedNotify = cache.getNotifications();
        } catch (Exception e) {
            cachedNotify = new ArrayList();
        }
        HashMap cachedLookup = new HashMap(cachedNotify.size());
        for (int i = 0; i < cachedNotify.size(); i++) {
            Notify notify = (Notify) cachedNotify.get(i);
            cachedLookup.put(Integer.toString(notify.getNotifyId()), notify);
        }
        ArrayList coderNotify = coder.getNotifications();
        coderNotify.clear();
        for (Iterator i = notifications.iterator(); i.hasNext();) {
            coderNotify.add(cachedLookup.get(i.next()));
        }

        Country compCountry = new Country();
        compCountry.setCountryCode(this.compCountry);
        coder.setCompCountry(compCountry);

        Editor editor = new Editor();
        editor.setEditorId(0); //standard editor
        coder.setEditor(editor);
        Language language = new Language();
        language.setLanguageId(Integer.parseInt(this.language));
        coder.setLanguage(language);
        CoderType coderType = new CoderType();
        coderType.setCoderTypeId(Integer.parseInt(this.coderType));
        coder.setCoderType(coderType);
        if (isRegister()) {
            user.setTerms((terms.equalsIgnoreCase(CHECKBOX_YES)?"Y":"N"));
        }

        if (isRegister()) {
            coder.getCoderReferral().setModified("A");
            coder.getCoderReferral().getReferral().setReferralId(Integer.parseInt(this.referral));
            coder.getCoderReferral().setOther(this.referralOther);
            if (this.referral.equals(Integer.toString(CAMPUS_JOB_FAIR_REFERRAL)) && !isEmpty(this.referralOther)) {
                if (isNumber(this.referralOther)) {
                    coder.getCoderReferral().setReferenceId(Integer.parseInt(this.referralOther));
                }
            }
            if (this.referral.equals(Integer.toString(MEMBER_REFERRAL)) && !isEmpty(this.referralOther)) {
                User referralUser = getUser(this.referralOther);
                if (referralUser != null) {
                    coder.getCoderReferral().setReferenceId(referralUser.getUserId());
                }
            }
        }


        ArrayList assignments = getDemographicAssignments(Integer.parseInt(this.coderType));
        for (int i = 0; i < assignments.size(); i++) {
            DemographicAssignment assignment = (DemographicAssignment) assignments.get(i);
            DemographicQuestion question = assignment.getDemographicQuestion();
            int questionId = question.getDemographicQuestionId();
            ArrayList beanResponseList = getDemographic(Integer.toString(questionId));
            ArrayList responseList = getDemographicResponses(coder.getDemographicResponses(), questionId);
            HashMap responseHash = null;
            if (responseList != null) {
                for (int j = 0; j < responseList.size(); j++) {
                    DemographicResponse response = (DemographicResponse) responseList.get(j);
                    if (responseHash == null) responseHash = new HashMap(responseList.size());
                    responseHash.put(Integer.toString(response.getDemographicAnswerId()), response);
                }
            } else {
                responseHash = new HashMap(0);
            }
            if (beanResponseList != null) {
                String selectable = question.getSelectable();
                for (int j = 0; j < beanResponseList.size(); j++) {
                    String answerStr = (String) beanResponseList.get(j);
                    int answerId = 0;
                    if (selectable.equals("Y") || selectable.equals("M")) {
                        answerId = Integer.parseInt(answerStr);
                    }
                    DemographicResponse response = null;
                    if (responseHash.containsKey(Integer.toString(answerId))) {
                        log.debug("setting modified to 'U' for " + Integer.toString(answerId));
                        response = (DemographicResponse) responseHash.get(Integer.toString(answerId));
                        response.setModified("U");
                        responseHash.remove(answerStr);
                    } else {
                        log.debug("setting modified to 'A' for " + answerStr);
                        response = new DemographicResponse();
                        response.setModified("A");
                        coder.getDemographicResponses().add(response);
                    }
                    response.setCoderId(coder.getCoderId());
                    response.setDemographicQuestionId(questionId);
                    response.setDemographicAnswerId(answerId);
                    if (selectable.equals("Y") || selectable.equals("M")) {
                        DemographicAnswer answer = getDemographicAnswer(question.getDemographicAnswers(), answerId);
                        if (answer != null) {
                            response.setDemographicResponseText(answer.getDemographicAnswerText());
                        }
                    } else {
                        response.setDemographicResponseText(answerStr);
                    }
                }
                if (responseHash != null && !responseHash.isEmpty() && (selectable.equals("Y") || selectable.equals("M"))) {
                    for (Iterator iterator = responseHash.values().iterator(); iterator.hasNext();) {
                        DemographicResponse removeResponse = (DemographicResponse) iterator.next();
                        log.debug("setting modified to 'D' for question: "
                                + removeResponse.getDemographicQuestionId()
                                + " answer "
                                + removeResponse.getDemographicAnswerId()
                        );
                        removeResponse.setModified("D");
                    }
                }
            } else {
                log.debug("No answer for questionId=" + questionId);
            }
        }

        if (this.coderType.equals(CODER_TYPE_STUDENT)) {
            School currentSchool = coder.getCurrentSchool();
            // SB -- added country.equals(USA) to fix problem with foreign student changing their school
            if (currentSchool.getName().equals("") && this.country.equals(USA))  //&& isRegister() )
            {
                currentSchool.setModified("A");
            } else {
                currentSchool.setModified("U");
            }
            int schoolId = 0;
            if (isNumber(school)) schoolId = Integer.parseInt(school);
            currentSchool.setUserId(coder.getCoderId());
            currentSchool.setSchoolId(schoolId);
            currentSchool.setName(getSchoolName(schoolId));
            if (!this.gpa.equals("")) {
                currentSchool.setGpa(Float.parseFloat(this.gpa));
            }
            if (!this.gpaScale.equals("")) {
                currentSchool.setGpaScale(Float.parseFloat(this.gpaScale));
            }
        }

/*
        ArrayList a = coder.getCoderConfirmations();
        boolean found = false;
        for (int i = 0; i < a.size(); i++) {
            CoderConfirmation c = (CoderConfirmation) a.get(i);
            if (c.getContestId() == SUN_CONTEST_ID) {
                c.setModified("U");
                c.setCode(getSunConfirm());
                found = true;
            }
        }
        if (!found) {
            CoderConfirmation c = new CoderConfirmation();
            c.setCoderId(coder.getCoderId());
            c.setCode(getSunConfirm());
            c.setContestId(SUN_CONTEST_ID);
            c.setModified("A");
            try {
            } catch (Exception e) {
                e.printStackTrace();
            }
            a.add(c);
        }
*/

        Context context = null;
        String activationCode = "";
        UserTransaction transaction = null;
        try {
            context = TCContext.getInitial();
            UserServicesHome userServicesHome = (UserServicesHome) context.lookup(ApplicationServer.USER_SERVICES);
            transaction = Transaction.get();
            if (Transaction.begin(transaction)) {
                UserServices userServices;
                if (isEdit()) {
                    userServices = userServicesHome.findByPrimaryKey(new Integer(user.getUserId()));
                } else {
                    userServices = userServicesHome.create(user);
                    activationCode = StringUtils.getActivationCode(coder.getCoderId());
                    coder.setActivationCode(activationCode);
                    coder.setModified("U");
                }
                userServices.setUser(user);
            }
            if (!Transaction.commit(transaction)) {
                throw new TaskException("Unable to commit transaction");
            }

            if (isRegister()) {
                Context ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
                PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome)ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
                PrincipalMgrRemote pmr = pmrh.create();
                TCSubject tcs = new TCSubject(132456);
                Collection groups = pmr.getGroups(tcs);
                GroupPrincipal anonGroup = null;
                GroupPrincipal userGroup = null;
                for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                    anonGroup = (GroupPrincipal) iterator.next();
                    if (anonGroup.getName().equals("Anonymous")) {
                        break;
                    }
                }
                for (Iterator iterator = groups.iterator(); iterator.hasNext();) {
                    userGroup = (GroupPrincipal) iterator.next();
                    if (userGroup.getName().equals("Users")) {
                        break;
                    }
                }

                //we're in a transaction on the security user table, so we can't select out the user principal object.
                UserPrincipal up = new UserPrincipal("", user.getUserId());
                pmr.addUserToGroup(anonGroup, up, tcs);
                pmr.addUserToGroup(userGroup, up, tcs);
            }

            user.setModified("S");
            coder.setAllModifiedStable();
        } catch (Exception e) {
            try {
                if (!Transaction.rollback(transaction)) {
                    throw new TaskException("Unable to commit or rollback transaction");
                }
            } catch (Exception ee) {
                throw new TaskException(ee);
            }
            log.debug(e.toString());
            throw new TaskException(e);
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }
            }
        }

        if (isRegister()) {
            try {


                TCSEmailMessage mail = new TCSEmailMessage();
                mail.setSubject("TopCoder Activation");
                StringBuffer msgText = new StringBuffer(3000);


                msgText.append("TOPCODER ACCOUNT ACTIVATION INFORMATION\n\n");
                msgText.append("Your TopCoder activation code is " + activationCode + "\n\n");
                msgText.append("To activate your account, navigate to the following WWW URL:\n");
                msgText.append(ACTIVATION_URL);
                msgText.append(activationCode);
                msgText.append("\n");
                msgText.append("If you cannot click on the web address above, please copy");
                msgText.append(" the address into your web browser to continue.  If the ");
                msgText.append("address spans two lines, please make sure you copy and paste");
                msgText.append(" both sections without any spaces between them.\n\n");
                msgText.append("You may utilize your activated TopCoder handle and password ");
                msgText.append("in order to access your member home page on TopCoder�s web site ");
                msgText.append("(<http://www.topcoder.com>).  Your handle and");
                msgText.append(" password will also provide you with access to the TopCoder ");
                msgText.append("Competition Arena, where you can practice, chat, and compete ");
                msgText.append("in rated events.\n\n\n");
                msgText.append("TOPCODER RATED EVENTS\n\n");
                msgText.append("Establishing a TopCoder rating will provide you with a number ");
                msgText.append("of benefits, including possible invitations to major tournaments ");
                msgText.append("with large cash prizes, TopCoder employment services, and the ");
                msgText.append("ability to apply for participation in TopCoder compensated ");
                msgText.append("software development projects.\n\n");
                msgText.append("Participating in TopCoder rated events (held weekly) will allow ");
                msgText.append("you to establish a TopCoder rating.  Competing in a single rated");
                msgText.append(" event is all it takes to become a rated member, however most ");
                msgText.append("major tournaments will require that you have participated in ");
                msgText.append("at least three rated events.  You can view a schedule of TopCoder ");
                msgText.append("events here:\n");
                msgText.append("<http://www.topcoder.com/?&t=schedule&c=index>\n\n");
                msgText.append("You may view all current development projects here: ");
                msgText.append("<http://www.topcoder.com/?&t=development&c=index> (you must login ");
                msgText.append("with your TopCoder handle and password).\n\n\n");
                msgText.append("PRACTICING TOPCODER\n\n");
                msgText.append("TopCoder provides a number of practice rooms that will allow ");
                msgText.append("you to become acclimated with our competition environment before ");
                msgText.append("you participate in your first rated event.  Each practice room has ");
                msgText.append("a problem set that was actually used in a previous rated event.  ");
                msgText.append("In addition, participating in a practice room is a very similar ");
                msgText.append("experience to competing in an actual rated event.  The practice ");
                msgText.append("rooms are always available.\n\n");
                msgText.append("You can download and run the TopCoder Competition Arena Applet from here:\n");
                msgText.append("http://www.topcoder.com/?&t=schedule&c=practice_room\n\n");
                msgText.append("We also suggest that you read up on the rules and competition process ");
                msgText.append("from the FAQs and links that are available here:\n");
                msgText.append("http://www.topcoder.com/?&t=support&c=index\n\n");
                msgText.append("If you have any questions about how to participate, feel free ");
                msgText.append("to email them to service@topcoder.com.\n\n");
                msgText.append("Thank you for registering with TopCoder and we look forward ");
                msgText.append("to seeing you in the arena!");
                mail.setBody(msgText.toString());
                mail.addToAddress(email, TCSEmailMessage.TO);
                mail.setFromAddress("service@topcoder.com");
                EmailEngine.send(mail);
            } catch (Exception e) {
                log.info(e.toString());
                //throw new TaskException(e);
                addError(REGISTER, "There was a problem sending the activation email. Please contact service@topcoder.com");
            }
        }
    }

    public static int getCoderId(String activationCode) {
        try {
            String idhash = new BigInteger(activationCode, 36).toString();
            if (idhash.length() % 2 != 0) return 0;
            String id = idhash.substring(0, idhash.length() / 2);
            String hash = idhash.substring(idhash.length() / 2);
            if (new BigInteger(new BigInteger(id).bitLength(), new Random(Long.parseLong(id))).add(new BigInteger("TopCoder", 36)).toString().endsWith(hash)) {
                return Integer.parseInt(id);
            } else {
                return 0;
            }

        } catch (Exception e) {
            log.info(e.toString());
            return 0;
        }
    }


    boolean activate()
            throws TaskException {
        int coderId = StringUtils.getCoderId(this.code);
        if (coderId == 0) return false;
        InitialContext context = null;
        try {
            context = TCContext.getInitial();
            AuthenticationServices authenticationServices = (AuthenticationServices)BaseProcessor.createEJB(context, AuthenticationServices.class);
            Authentication authentication = authenticationServices.getActivation(coderId);
            if (authentication.getUserId().intValue() == coderId && authentication.getActivationCode().equalsIgnoreCase(this.code)) {
                if (authentication.getStatus().equals("U")) {
                    UserServicesHome userServicesHome = (UserServicesHome) context.lookup(ApplicationServer.USER_SERVICES);
                    UserServices userServices = userServicesHome.findByPrimaryKey(authentication.getUserId());
                    User user = userServices.getUser();
                    user.setStatus("A");
                    user.setModified("U");
                    userServices.setUser(user);
                }
            }
        } catch (Exception e) {
            log.error(e.toString());
            return false;
            //throw new TaskException(e);
        } finally {
            if (context != null) {
                try {
                    context.close();
                } catch (Exception e) {
                }

            }
        }
        return true;
    }

/*
    private static String getSunConfirmation(ArrayList confirmList) {
        CoderConfirmation temp = null;
        boolean found = false;
        for (int i = 0; i < confirmList.size() && !found; i++) {
            temp = (CoderConfirmation) confirmList.get(i);
            if (temp.getContestId() == SUN_CONTEST_ID) {
                found = true;
            }
        }
        if (found)
            return temp.getCode();
        else
            return null;
    }
 */
}
