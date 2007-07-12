package com.topcoder.web.reg.controller.request;

import java.io.IOException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.ejb.CreateException;
import javax.naming.Context;

import com.topcoder.security.GeneralSecurityException;
import com.topcoder.security.GroupPrincipal;
import com.topcoder.security.TCSubject;
import com.topcoder.security.UserPrincipal;
import com.topcoder.security.admin.PrincipalMgrRemote;
import com.topcoder.security.admin.PrincipalMgrRemoteHome;
import com.topcoder.servlet.request.FileDoesNotExistException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.UploadedFile;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.TCContext;
import com.topcoder.web.common.LongHibernateProcessor;
import com.topcoder.web.common.MultipartRequest;
import com.topcoder.web.common.SecurityHelper;
import com.topcoder.web.common.dao.DAOFactory;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.common.model.Address;
import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.model.DemographicAssignment;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.common.model.Event;
import com.topcoder.web.common.model.EventRegistration;
import com.topcoder.web.common.model.Notification;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.Resume;
import com.topcoder.web.common.model.School;
import com.topcoder.web.common.model.Season;
import com.topcoder.web.common.model.State;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.validation.Address1Validator;
import com.topcoder.web.reg.validation.Address2Validator;
import com.topcoder.web.reg.validation.Address3Validator;
import com.topcoder.web.reg.validation.AgeValidator;
import com.topcoder.web.reg.validation.AttendingHSValidator;
import com.topcoder.web.reg.validation.CityValidator;
import com.topcoder.web.reg.validation.CoderTypeValidator;
import com.topcoder.web.reg.validation.CompanyNameValidator;
import com.topcoder.web.reg.validation.CountryValidator;
import com.topcoder.web.reg.validation.DemogFreeFormValidator;
import com.topcoder.web.reg.validation.DemogMultiSelectValidator;
import com.topcoder.web.reg.validation.DemogSingleSelectValidator;
import com.topcoder.web.reg.validation.EmailConfirmValidator;
import com.topcoder.web.reg.validation.EmailValidator;
import com.topcoder.web.reg.validation.GPAScaleValidator;
import com.topcoder.web.reg.validation.GPAValidator;
import com.topcoder.web.reg.validation.GivenNameValidator;
import com.topcoder.web.reg.validation.MiddleNameValidator;
import com.topcoder.web.reg.validation.NotificationValidator;
import com.topcoder.web.reg.validation.PasswordConfirmValidator;
import com.topcoder.web.reg.validation.PasswordValidator;
import com.topcoder.web.reg.validation.PostalCodeValidator;
import com.topcoder.web.reg.validation.ProvinceValidator;
import com.topcoder.web.reg.validation.QuoteValidator;
import com.topcoder.web.reg.validation.ReferralValidator;
import com.topcoder.web.reg.validation.ResumeValidator;
import com.topcoder.web.reg.validation.SchoolIdValidator;
import com.topcoder.web.reg.validation.SchoolNameValidator;
import com.topcoder.web.reg.validation.SchoolTypeValidator;
import com.topcoder.web.reg.validation.SecretQuestionResponseValidator;
import com.topcoder.web.reg.validation.SecretQuestionValidator;
import com.topcoder.web.reg.validation.StateValidator;
import com.topcoder.web.reg.validation.SurnameValidator;
import com.topcoder.web.reg.validation.TermsOfUseValidator;
import com.topcoder.web.reg.validation.TimeZoneValidator;
import com.topcoder.web.reg.validation.TitleValidator;
import com.topcoder.web.reg.validation.UserNameValidator;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends LongHibernateProcessor {

    private User user = null;
    private DAOFactory factory = null;

    protected void dbProcessing() throws Exception {
        registrationProcessing();
    }


    /**
     * Retrieve the user that is involved in the current registration process.
     * First see if it's cached in this request processor, then try the session
     * and finally load it from the db.
     *
     * @return the user, we'll return null if the user does not currently have an
     *         account or if <code>setRegUser</code> has not yet been called.
     */
    protected User getRegUser() {
        if (user == null) {
            user = (User) getRequest().getSession().getAttribute(Constants.USER);
            if (user == null) {
                if (userLoggedIn()) {
                    log.debug("get user from the dao");
                    user = new UserDAOHibernate().find(new Long(getUser().getId()));
                    if (user != null) {
                        setRegUser(user);
                    } else {
                        throw new RuntimeException("Couldn't find user " + getUser().getId() + " in the database");
                    }
                } else {
                    log.debug("not logged in and user is null");
                }
            } else {
                if (log.isDebugEnabled()) {
                    log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from session");
                }
            }
        } else {
            if (log.isDebugEnabled()) {
                log.debug("got id: " + user.getId() + " handle: " + user.getHandle() + " user from processor");
            }
        }
        return user;
    }

    protected void clearSession() {
        getRequest().getSession().setAttribute(Constants.USER, null);
        getRequest().getSession().setAttribute(Constants.REG_TYPES, null);
    }

    /**
     * Set the reg user in the current request processor.  This is generally
     * only necessary if it's a new user registering.  Existing users can be loaded
     * by <code>getRegUser</code>
     *
     * @param u
     */
    protected void setRegUser(User u) {
        this.user = u;
        getRequest().getSession().setAttribute(Constants.USER, user);
    }

    /**
     * Get the registrationTypes the current user is attempting to register for.
     * <code>setRequestedTypes</code> must have been called prior to calls to this method.
     *
     * @return the types
     */
    protected Set getRequestedTypes() {
        Set regTypes = (Set) getRequest().getSession().getAttribute(Constants.REG_TYPES);
/*
        if (log.isDebugEnabled()) {
            for (Iterator it = regTypes.iterator(); it.hasNext();) {
                log.debug("getter: " + ((RegistrationType) it.next()).getName());
            }
        }
*/
        return regTypes;
    }

    /**
     * Set the registration types that the current user is attempting to register for
     * so that they can be retrieved by <code>getRequestedTypes</code>
     *
     * @param requestedTypes
     */
    protected void setRequestedTypes(Set requestedTypes) {
/*
        if (log.isDebugEnabled()) {
            for (Iterator it = requestedTypes.iterator(); it.hasNext();) {
                log.debug("settter: " + ((RegistrationType) it.next()).getName());
            }
        }
*/
        getRequest().getSession().setAttribute(Constants.REG_TYPES, requestedTypes);
    }

    /**
     * Return whether the user has requested to register in the specified type.
     * 
     * @param type the type to check
     * @return
     */
    protected boolean hasRequestedType(int type) {       
        for (RegistrationType rt : (Set<RegistrationType>) getRequestedTypes()) {
            if (rt.getId() == type) {
                return true;
            }
        }
        return false;
    }
    
    
    /**
     * Return whether the user is currently registered for the specified type.
     * 
     * @param u
     * @param type
     * @return
     */    
    protected boolean isCurrentlyRegistered(User u, int type) {
        for (RegistrationType rt : (Set<RegistrationType>) u.getRegistrationTypes()) {
            if (rt.getId() == type) {
                return true;
            }
        }
        return false;        
    }
    
    /**
     * Get all the data from the request relevent to the main page of registration
     * and load it into a map.
     *
     * @return all the user input
     */
    protected Map getMainUserInput() {
        HashMap ret = new HashMap();

        ret.put(Constants.ADDRESS1, getTrimmedParameter(Constants.ADDRESS1));
        ret.put(Constants.ADDRESS2, getTrimmedParameter(Constants.ADDRESS2));
        ret.put(Constants.ADDRESS3, getTrimmedParameter(Constants.ADDRESS3));
        ret.put(Constants.CITY, getTrimmedParameter(Constants.CITY));
        ret.put(Constants.COUNTRY_CODE, getTrimmedParameter(Constants.COUNTRY_CODE));
        ret.put(Constants.STATE_CODE, getTrimmedParameter(Constants.STATE_CODE));
        ret.put(Constants.POSTAL_CODE, getTrimmedParameter(Constants.POSTAL_CODE));
        ret.put(Constants.PROVINCE, getTrimmedParameter(Constants.PROVINCE));
        ret.put(Constants.EMAIL, getTrimmedParameter(Constants.EMAIL));
        ret.put(Constants.EMAIL_CONFIRM, getTrimmedParameter(Constants.EMAIL_CONFIRM));
        ret.put(Constants.GIVEN_NAME, getTrimmedParameter(Constants.GIVEN_NAME));
        ret.put(Constants.MIDDLE_NAME, getTrimmedParameter(Constants.MIDDLE_NAME));
        ret.put(Constants.SURNAME, getTrimmedParameter(Constants.SURNAME));
        ret.put(Constants.PASSWORD, getTrimmedParameter(Constants.PASSWORD));
        ret.put(Constants.PASSWORD_CONFIRM, getTrimmedParameter(Constants.PASSWORD_CONFIRM));
        ret.put(Constants.SECRET_QUESTION, getTrimmedParameter(Constants.SECRET_QUESTION));
        ret.put(Constants.SECRET_QUESTION_RESPONSE, getTrimmedParameter(Constants.SECRET_QUESTION_RESPONSE));
        ret.put(Constants.HANDLE, getTrimmedParameter(Constants.HANDLE));
        ret.put(Constants.QUOTE, getTrimmedParameter(Constants.QUOTE));
        ret.put(Constants.TITLE, getTrimmedParameter(Constants.TITLE));
        ret.put(Constants.COMPANY_NAME, getTrimmedParameter(Constants.COMPANY_NAME));
        ret.put(Constants.PHONE_NUMBER, getTrimmedParameter(Constants.PHONE_NUMBER));
        ret.put(Constants.COMP_COUNTRY_CODE, getTrimmedParameter(Constants.COMP_COUNTRY_CODE));
        ret.put(Constants.CODER_TYPE, getTrimmedParameter(Constants.CODER_TYPE));
        ret.put(Constants.TIMEZONE, getTrimmedParameter(Constants.TIMEZONE));
        ret.put(Constants.MEMBER_CONTACT, getTrimmedParameter(Constants.MEMBER_CONTACT));
        ret.put(Constants.TERMS_OF_USE_ID, getTrimmedParameter(Constants.TERMS_OF_USE_ID));
        ret.put(Constants.AGE, getTrimmedParameter(Constants.AGE));
        ret.put(Constants.AGE_END_SEASON, getTrimmedParameter(Constants.AGE_END_SEASON));
        ret.put(Constants.ATTENDING_HS, getTrimmedParameter(Constants.ATTENDING_HS));
        
        //iterate through the notifications, we're essentially validating here
        //since we're only looking for valid notifications.
        List notifications = getFactory().getNotificationDAO().getNotifications(getRequestedTypes());
        int size = notifications.size();
        ArrayList nSelections = new ArrayList(size);
        Notification n;
        for (int i = 0; i < size; i++) {
            n = (Notification) notifications.get(i);
            String val = getTrimmedParameter(Constants.NOTIFICATION + n.getId());
            if (val != null && !"".equals(val)) {
                nSelections.add(n);
            }
        }
        ret.put(Constants.NOTIFICATION, nSelections);

        return ret;

    }


    /**
     * Validate all the user input for the main page of registration.  When there is a problem
     * a error will be added to the request via the normal RequestProcessor error reporting
     * mechanism.
     *
     * @param params
     */
    protected void checkMainFields(Map params) {

        Set fields = RegFieldHelper.getMainFieldSet(getRequestedTypes(), getRegUser());

        simpleValidation(Address1Validator.class, fields, params, Constants.ADDRESS1);
        simpleValidation(Address2Validator.class, fields, params, Constants.ADDRESS2);
        simpleValidation(Address3Validator.class, fields, params, Constants.ADDRESS3);
        simpleValidation(CityValidator.class, fields, params, Constants.CITY);
        simpleValidation(EmailValidator.class, fields, params, Constants.EMAIL);
        simpleValidation(GivenNameValidator.class, fields, params, Constants.GIVEN_NAME);
        simpleValidation(MiddleNameValidator.class, fields, params, Constants.MIDDLE_NAME);
        simpleValidation(PasswordValidator.class, fields, params, Constants.PASSWORD);
        simpleValidation(SecretQuestionValidator.class, fields, params, Constants.SECRET_QUESTION);
        simpleValidation(SecretQuestionResponseValidator.class, fields, params, Constants.SECRET_QUESTION_RESPONSE);
        simpleValidation(PostalCodeValidator.class, fields, params, Constants.POSTAL_CODE);
        simpleValidation(ProvinceValidator.class, fields, params, Constants.PROVINCE);
        simpleValidation(QuoteValidator.class, fields, params, Constants.QUOTE);
        simpleValidation(SurnameValidator.class, fields, params, Constants.SURNAME);
        simpleValidation(TitleValidator.class, fields, params, Constants.TITLE);
        simpleValidation(CompanyNameValidator.class, fields, params, Constants.COMPANY_NAME);
        simpleValidation(CountryValidator.class, fields, params, Constants.COUNTRY_CODE);
        simpleValidation(CountryValidator.class, fields, params, Constants.COMP_COUNTRY_CODE);
        simpleValidation(CoderTypeValidator.class, fields, params, Constants.CODER_TYPE);
        simpleValidation(TimeZoneValidator.class, fields, params, Constants.TIMEZONE);
        simpleValidation(AgeValidator.class, fields, params, Constants.AGE);
        simpleValidation(AgeValidator.class, fields, params, Constants.AGE_END_SEASON);
        simpleValidation(AttendingHSValidator.class, fields, params, Constants.ATTENDING_HS);
        
        if (!hasError(Constants.AGE) && !hasError(Constants.AGE_END_SEASON)) {
            int age = Integer.parseInt((String) params.get(Constants.AGE));
            int ageEndSeason = Integer.parseInt((String) params.get(Constants.AGE_END_SEASON));
            int dif = ageEndSeason - age;
           
            if (dif != 0 && dif != 1) {
                addError(Constants.AGE, "Please check the age.");
                addError(Constants.AGE_END_SEASON, "Please check the age.");
            }
            
        }
        
        ValidationResult termsResults = new TermsOfUseValidator(getRegUser()).validate(
                new StringInput((String) params.get(Constants.TERMS_OF_USE_ID)));
        if (!termsResults.isValid()) {
            addError(Constants.TERMS_OF_USE_ID, termsResults.getMessage());
        }

        if (fields.contains(Constants.EMAIL_CONFIRM)) {
            ValidationResult emailConfirmResult = new EmailConfirmValidator(
                    new StringInput((String) params.get(Constants.EMAIL))).validate(
                    new StringInput((String) params.get(Constants.EMAIL_CONFIRM)));
            if (!emailConfirmResult.isValid()) {
                addError(Constants.EMAIL_CONFIRM, emailConfirmResult.getMessage());
            }
        }

        if (fields.contains(Constants.PASSWORD_CONFIRM)) {
            ValidationResult passwordConfirmResult = new PasswordConfirmValidator(
                    new StringInput((String) params.get(Constants.PASSWORD))).validate(
                    new StringInput((String) params.get(Constants.PASSWORD_CONFIRM)));
            if (!passwordConfirmResult.isValid()) {
                addError(Constants.PASSWORD_CONFIRM, passwordConfirmResult.getMessage());
            }
        }

        //grandfather in existing accounts
        if (getRegUser().isNew()) {
            if (fields.contains(Constants.HANDLE)) {
                ValidationResult userNameResult = new UserNameValidator(getRegUser()).validate(
                        new StringInput((String) params.get(Constants.HANDLE)));
                if (!userNameResult.isValid()) {
                    addError(Constants.HANDLE, userNameResult.getMessage());
                }
            }
        }

        if (!hasError(Constants.COUNTRY_CODE)) {
            if (fields.contains(Constants.STATE_CODE)) {
                ValidationResult stateResult = new StateValidator(getFactory().getCountryDAO().find(
                        (String) params.get(Constants.COUNTRY_CODE))).validate(
                        new StringInput((String) params.get(Constants.STATE_CODE)));
                if (!stateResult.isValid()) {
                    addError(Constants.STATE_CODE, stateResult.getMessage());
                }
            }
        }
        if (fields.contains(Constants.NOTIFICATION)) {
            ValidationResult notificationResult =
                    new NotificationValidator().validate(new ListInput((List) params.get(Constants.NOTIFICATION)));
            if (!notificationResult.isValid()) {
                addError(Constants.NOTIFICATION, notificationResult.getMessage());
            }
        }
    }


    protected void setMainDefaults(User u) {
        if (u.getHomeAddress() != null) {
            setDefault(Constants.ADDRESS1, u.getHomeAddress().getAddress1());
            setDefault(Constants.ADDRESS2, u.getHomeAddress().getAddress2());
            setDefault(Constants.ADDRESS3, u.getHomeAddress().getAddress3());
            setDefault(Constants.CITY, u.getHomeAddress().getCity());
            if (u.getHomeAddress().getCountry() != null) {
                setDefault(Constants.COUNTRY_CODE, u.getHomeAddress().getCountry().getCode());
            }
            if (u.getHomeAddress().getState() != null) {
                setDefault(Constants.STATE_CODE, u.getHomeAddress().getState().getCode());
            }
            setDefault(Constants.POSTAL_CODE, u.getHomeAddress().getPostalCode());
            setDefault(Constants.PROVINCE, u.getHomeAddress().getProvince());
        }
        if (u.getPrimaryEmailAddress() != null) {
            setDefault(Constants.EMAIL, u.getPrimaryEmailAddress().getAddress());
            setDefault(Constants.EMAIL_CONFIRM, u.getPrimaryEmailAddress().getAddress());
        }
        setDefault(Constants.MIDDLE_NAME, u.getMiddleName());
        setDefault(Constants.SURNAME, u.getLastName());
        setDefault(Constants.GIVEN_NAME, u.getFirstName());
        setDefault(Constants.PASSWORD, u.getPassword());
        setDefault(Constants.PASSWORD_CONFIRM, u.getPassword());

        if (u.getSecretQuestion() != null) {
            setDefault(Constants.SECRET_QUESTION, u.getSecretQuestion().getQuestion());
            setDefault(Constants.SECRET_QUESTION_RESPONSE, u.getSecretQuestion().getResponse());
        }

        setDefault(Constants.HANDLE, u.getHandle());
        if (u.getContact() != null) {
            if (u.getContact().getCompany() != null) {
                setDefault(Constants.COMPANY_NAME, u.getContact().getCompany().getName());
            }
            setDefault(Constants.TITLE, u.getContact().getTitle());
        }
        if (u.getCoder() != null) {
            setDefault(Constants.QUOTE, u.getCoder().getQuote());
        }
        if (u.getPrimaryPhoneNumber() != null) {
            setDefault(Constants.PHONE_NUMBER, u.getPrimaryPhoneNumber().getNumber());
        }
        if (u.getCoder() != null && u.getCoder().getCompCountry() != null) {
            setDefault(Constants.COMP_COUNTRY_CODE, u.getCoder().getCompCountry().getCode());
        }
        if (u.getCoder() != null && u.getCoder().getCoderType() != null) {
            setDefault(Constants.CODER_TYPE, u.getCoder().getCoderType().getId());
        }

        if (u.getTimeZone() != null) {
            setDefault(Constants.TIMEZONE, u.getTimeZone().getId());
        }
        for (Iterator it = u.getNotifications().iterator(); it.hasNext();) {
            setDefault(Constants.NOTIFICATION + ((Notification) it.next()).getId(), String.valueOf(true));
        }

        setDefault(Constants.MEMBER_CONTACT, String.valueOf(u.isMemberContactEnabled()));

        if (u.getContact() != null) {
            setDefault(Constants.TITLE, u.getContact().getTitle());
            if (u.getContact().getCompany() != null) {
                setDefault(Constants.COMPANY_NAME, u.getContact().getCompany().getName());
            }
        }

    }

    protected Map getSecondaryUserInput() {
        HashMap ret = new HashMap();

        DemographicQuestion dq;
        String key;
        for (Iterator it = getFactory().getDemographicQuestionDAO().getQuestions().iterator(); it.hasNext();) {
            dq = (DemographicQuestion) it.next();
            key = Constants.DEMOG_PREFIX + dq.getId();
            if (dq.isMultipleSelect()) {
                List a = getRequest().getParameterValues(key) == null ?
                        Collections.EMPTY_LIST : Arrays.asList(getRequest().getParameterValues(key));
                ret.put(key, a);
            } else {
                ret.put(key, getTrimmedParameter(key));
            }
        }

        ret.put(Constants.SCHOOL_ID, getTrimmedParameter(Constants.SCHOOL_ID));
        ret.put(Constants.SCHOOL_CITY, getTrimmedParameter(Constants.SCHOOL_CITY));
        ret.put(Constants.SCHOOL_STATE, getTrimmedParameter(Constants.SCHOOL_STATE));
        ret.put(Constants.SCHOOL_COUNTRY, getTrimmedParameter(Constants.SCHOOL_COUNTRY));
        ret.put(Constants.SCHOOL_PROVINCE, getTrimmedParameter(Constants.SCHOOL_PROVINCE));
        ret.put(Constants.SCHOOL_NAME, getTrimmedParameter(Constants.SCHOOL_NAME));
        ret.put(Constants.SCHOOL_TYPE, getTrimmedParameter(Constants.SCHOOL_TYPE));
        ret.put(Constants.VISIBLE_SCHOOL, getTrimmedParameter(Constants.VISIBLE_SCHOOL));
        ret.put(Constants.GPA_SCALE, getTrimmedParameter(Constants.GPA_SCALE));
        ret.put(Constants.GPA, getTrimmedParameter(Constants.GPA));
        ret.put(Constants.TITLE, getTrimmedParameter(Constants.TITLE));
        ret.put(Constants.COMPANY_NAME, getTrimmedParameter(Constants.COMPANY_NAME));


        if (getRequest() instanceof MultipartRequest) {
            MultipartRequest req = (MultipartRequest) getRequest();
            UploadedFile file = req.getUploadedFile(Constants.RESUME);

            if (file != null && file.getContentType() != null) {
                log.debug("FOUND RESUME");
                try {
                    byte[] fileBytes = new byte[(int) file.getSize()];
                    file.getInputStream().read(fileBytes);
                    ret.put(Constants.FILE, fileBytes);
                    ret.put(Constants.FILE_TYPE, file.getContentType());
                    ret.put(Constants.FILE_NAME, file.getRemoteFileName());
                } catch (IOException e) {
                    throw new RuntimeException("Problem while reading file from user " + getRegUser().getId());
                } catch (PersistenceException e) {
                    throw new RuntimeException("Problem while reading file from user " + getRegUser().getId());
                } catch (FileDoesNotExistException e) {
                    throw new RuntimeException("Problem while reading file from user " + getRegUser().getId());
                }


            }
        }

        ret.put(Constants.REFERRAL, getTrimmedParameter(Constants.REFERRAL));
        ret.put(Constants.REFERRAL_CODER, getTrimmedParameter(Constants.REFERRAL_CODER));
        ret.put(Constants.REFERRAL_OTHER, getTrimmedParameter(Constants.REFERRAL_OTHER));

        return ret;

    }

    protected void checkSecondaryFields(Map params) {

        Set fields = RegFieldHelper.getSecondaryFieldSet(getRequestedTypes(), getRegUser());

        if (fields.contains(Constants.DEMOG_PREFIX)) {
            DemographicAssignment da;
            String key;
            for (Iterator it = getAssignments(getRegUser()).iterator(); it.hasNext();) {
                da = (DemographicAssignment) it.next();
                key = Constants.DEMOG_PREFIX + da.getQuestion().getId();
                //validate the response we got
                if (da.getQuestion().isFreeForm()) {
                    //validate free form
                    ValidationResult freeResult = new DemogFreeFormValidator(getRegUser(), da.isRequired()).validate(
                            new StringInput((String) params.get(key)));
                    if (!freeResult.isValid()) {
                        addError(key, freeResult.getMessage());
                    }
                } else if (da.getQuestion().isMultipleSelect()) {
                    //validate answers
                    ValidationResult multiResult = new DemogMultiSelectValidator(da.getQuestion(), da.isRequired()).validate(
                            new ListInput((List) params.get(key)));
                    if (!multiResult.isValid()) {
                        addError(key, multiResult.getMessage());
                    }
                } else if (da.getQuestion().isSingleSelect()) {
                    ValidationResult singleResult = new DemogSingleSelectValidator(da.getQuestion(), da.isRequired()).validate(
                            new StringInput((String) params.get(key)));
                    if (!singleResult.isValid()) {
                        addError(key, singleResult.getMessage());
                    }
                }
            }
        }

        //we'll use school id as an indicator for all of school
        if (fields.contains(Constants.SCHOOL_ID)) {
            String id = (String) params.get(Constants.SCHOOL_ID);
            if (id != null && !"".equals(id)) {
                //if it's an existing school
                simpleValidation(SchoolIdValidator.class, fields, params, Constants.SCHOOL_ID);
            } else {
                //if they're adding a school
                simpleValidation(CityValidator.class, fields, params, Constants.SCHOOL_CITY);
                simpleValidation(ProvinceValidator.class, fields, params, Constants.SCHOOL_PROVINCE);
                simpleValidation(CountryValidator.class, fields, params, Constants.SCHOOL_COUNTRY);

                if (!hasError(Constants.SCHOOL_COUNTRY)) {
                    if (fields.contains(Constants.SCHOOL_STATE)) {
                        ValidationResult stateResult = new StateValidator(getFactory().getCountryDAO().find(
                                (String) params.get(Constants.SCHOOL_COUNTRY))).validate(
                                new StringInput((String) params.get(Constants.SCHOOL_STATE)));
                        if (!stateResult.isValid()) {
                            addError(Constants.SCHOOL_STATE, stateResult.getMessage());
                        }
                    }
                }
                if (fields.contains(Constants.SCHOOL_TYPE)) {
                    ValidationResult typeResult = new SchoolTypeValidator(getRequestedTypes()).validate(
                            new StringInput((String) params.get(Constants.SCHOOL_TYPE)));
                    if (!typeResult.isValid()) {
                        addError(Constants.SCHOOL_TYPE, typeResult.getMessage());
                    }
                }

                if (fields.contains(Constants.SCHOOL_NAME)) {
                    simpleValidation(SchoolNameValidator.class, fields, params, Constants.SCHOOL_NAME);
                }
            }
        }

        if (fields.contains(Constants.GPA) &&
                fields.contains(Constants.GPA_SCALE) &&
                hasParameter(params, Constants.GPA) &&
                hasParameter(params, Constants.GPA_SCALE)) {
            simpleValidation(GPAScaleValidator.class, fields, params, Constants.GPA_SCALE);
            if (!hasError(Constants.GPA_SCALE)) {
                if (fields.contains(Constants.GPA)) {
                    ValidationResult gpaResult = new GPAValidator((String) params.get(Constants.GPA_SCALE)).validate(
                            new StringInput((String) params.get(Constants.GPA)));
                    if (!gpaResult.isValid()) {
                        addError(Constants.GPA, gpaResult.getMessage());
                    }
                }
            }

        }

        if (fields.contains(Constants.RESUME)) {
            ArrayList l = new ArrayList(3);
            l.add(params.get(Constants.FILE));
            l.add(params.get(Constants.FILE_TYPE));
            l.add(params.get(Constants.FILE_NAME));
            ValidationResult resumeResult = new ResumeValidator().validate(new ListInput(l));
            if (!resumeResult.isValid()) {
                addError(Constants.RESUME, resumeResult.getMessage());
            }
        }

        if (fields.contains(Constants.REFERRAL)) {
            ValidationResult referralResult =
                    new ReferralValidator((String) params.get(Constants.REFERRAL_CODER),
                            (String) params.get(Constants.REFERRAL_OTHER)).validate(new StringInput((String) params.get(Constants.REFERRAL)));
            if (!referralResult.isValid()) {
                addError(Constants.REFERRAL, referralResult.getMessage());
            }
        }

        if (fields.contains(Constants.COMPANY_NAME)) {
            simpleValidation(CompanyNameValidator.class, fields, params, Constants.COMPANY_NAME);
        }
        if (fields.contains(Constants.TITLE)) {
            simpleValidation(TitleValidator.class, fields, params, Constants.TITLE);
        }
    }


    /**
     * @param validationClass
     * @param params          a map containing the what the user entered
     * @param fields          the fields relevant to the current registration process
     * @param field           the field we're currently attempting to validate
     * @throws RuntimeException if there is a problem attempting to instantiate the validation class
     */
    private void simpleValidation(Class validationClass, Set fields, Map params, String field) throws RuntimeException {

        if (fields.contains(field)) {
            Validator v;
            try {
                v = (Validator) Class.forName(validationClass.getName()).newInstance();
            } catch (InstantiationException e) {
                throw new RuntimeException(e);
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            ValidationResult result = v.validate(new StringInput((String) params.get(field)));
            if (!result.isValid()) {
                addError(field, result.getMessage());
            }
        }
    }


    protected void setSecondaryDefaults(User u) {
        Collection responses;

        if (u.getTransientResponses().isEmpty()) {
            responses = u.getDemographicResponses();
        } else {
            responses = u.getTransientResponses();
        }

        DemographicResponse r;
        HashMap multiAnswerMap = new HashMap();
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (DemographicResponse) it.next();
            if (r.getQuestion().isSingleSelect()) {
                setDefault(Constants.DEMOG_PREFIX + r.getQuestion().getId(), String.valueOf(r.getAnswer().getId()));
            } else if (r.getQuestion().isFreeForm()) {
                setDefault(Constants.DEMOG_PREFIX + r.getQuestion().getId(), r.getResponse());
            } else if (r.getQuestion().isMultipleSelect()) {
                ArrayList al = new ArrayList();
                if (multiAnswerMap.containsKey(r.getQuestion().getId())) {
                    al = (ArrayList) multiAnswerMap.get(r.getQuestion().getId());
                }
                al.add(String.valueOf(r.getAnswer().getId()));
                multiAnswerMap.put(r.getQuestion().getId(), al);
            }
        }
        for (Iterator it = multiAnswerMap.keySet().iterator(); it.hasNext();) {
            Long questionId = (Long) it.next();
            setDefault(Constants.DEMOG_PREFIX + questionId, multiAnswerMap.get(questionId));
        }
        School s = null;
        if (u.getCoder() != null &&
                u.getCoder().getCurrentSchool() != null &&
                u.getCoder().getCurrentSchool().getSchool() != null) {
            s = u.getCoder().getCurrentSchool().getSchool();
        }

        if (s != null) {
            if (s.getId() != null) {
                setDefault(Constants.SCHOOL_ID, s.getId().toString());
            }
            setDefault(Constants.SCHOOL_NAME, s.getName());
            if (s.getType() != null) {
                setDefault(Constants.SCHOOL_TYPE, s.getType().getId());
            }
            if (u.getCoder().getCurrentSchool().getViewable() != null) {
                setDefault(Constants.VISIBLE_SCHOOL, u.getCoder().getCurrentSchool().getViewable().toString());
            }
            if (u.getCoder().getCurrentSchool().getGPA() != null) {
                setDefault(Constants.GPA, u.getCoder().getCurrentSchool().getGPA().toString());
            }
            Float gpaScale = u.getCoder().getCurrentSchool().getGPAScale();
            if (gpaScale != null) {
                for (int i = 0; i < Constants.GPA_SCALES.size(); i++) {
                    if (gpaScale.equals(new Float((String) Constants.GPA_SCALES.get(i)))) {
                        setDefault(Constants.GPA_SCALE, Constants.GPA_SCALES.get(i));
                    }
                }
            }

            Address a = s.getAddress();
            if (a != null) {
                setDefault(Constants.SCHOOL_CITY, a.getCity());
                State state = a.getState();
                if (state != null) {
                    setDefault(Constants.SCHOOL_STATE, state.getCode());
                }
                setDefault(Constants.SCHOOL_PROVINCE, a.getProvince());
                if (a.getCountry() != null) {
                    setDefault(Constants.SCHOOL_COUNTRY, a.getCountry().getCode());
                }
            }
        } else {
            setDefault(Constants.VISIBLE_SCHOOL, String.valueOf(true));
        }

        if (u.getCoder() != null && !u.getCoder().getResumes().isEmpty()) {
            Iterator it = u.getCoder().getResumes().iterator();
            setDefault(Constants.FILE_NAME, ((Resume) it.next()).getFileName());
        }

        if (u.isNew() && u.getCoder() != null &&
                u.getCoder().getCoderReferral() != null &&
                u.getCoder().getCoderReferral().getReferral() != null) {
            setDefault(Constants.REFERRAL, u.getCoder().getCoderReferral().getReferral().getId());
            if (u.getCoder().getCoderReferral().getReferenceCoder() != null) {
                setDefault(Constants.REFERRAL_CODER,
                        getFactory().getUserDAO().find(u.getCoder().getCoderReferral().getReferenceCoder().getId()).getHandle());
            }
            setDefault(Constants.REFERRAL_OTHER, u.getCoder().getCoderReferral().getOther());
        }
        if (u.getContact() != null) {
            setDefault(Constants.TITLE, u.getContact().getTitle());
            if (u.getContact().getCompany() != null) {
                setDefault(Constants.COMPANY_NAME, u.getContact().getCompany().getName());
            }
        }


    }
    
    /**
     * Reloads the main page, setting the default values and loading drop downs.
     * 
     * @param params
     * @param u
     * @param fields
     */
    protected void reloadMain(Map params, User u, Set fields) {
        Map.Entry me;
        for (Iterator it = params.entrySet().iterator(); it.hasNext();) {
            me = (Map.Entry) it.next();
            if (me.getKey().equals(Constants.NOTIFICATION)) {
                List a = (List) me.getValue();
                for (Iterator it1 = a.iterator(); it1.hasNext();) {
                    setDefault(Constants.NOTIFICATION + ((Notification) it1.next()).getId(), String.valueOf(true));
                }
            } else {
                setDefault((String) me.getKey(), me.getValue());
            }
        }

        setDefault(Constants.MEMBER_CONTACT, String.valueOf(params.get(Constants.MEMBER_CONTACT) != null));
        setDefault(Constants.AGE, params.get(Constants.AGE));
        setDefault(Constants.AGE_END_SEASON, params.get(Constants.AGE_END_SEASON));
        setDefault(Constants.ATTENDING_HS, params.get(Constants.ATTENDING_HS));
        
        if (!u.isNew()) {
            setDefault(Constants.HANDLE, u.getHandle());
        }
        List nots = getFactory().getNotificationDAO().getNotifications(getRequestedTypes());
        if (nots != null) {
            getRequest().setAttribute("notifications", nots);
        }
        getRequest().setAttribute(Constants.FIELDS, fields);
        getRequest().setAttribute(Constants.REQUIRED_FIELDS,
                RegFieldHelper.getMainRequiredFieldSet(getRequestedTypes(), u));
        getRequest().setAttribute("countries", getFactory().getCountryDAO().getCountries());
        getRequest().setAttribute("coderTypes", getFactory().getCoderTypeDAO().getCoderTypes());
        getRequest().setAttribute("timeZones", getFactory().getTimeZoneDAO().getTimeZones());
        getRequest().setAttribute("regTerms", getFactory().getTermsOfUse().find(new Integer(Constants.REG_TERMS_ID)));
        getRequest().setAttribute("season", getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON));

        setNextPage("/main.jsp");
        setIsNextPageInContext(true);

    }

    protected List getAssignments(User u) {
        //if they dont' have a coder type, we'll just make them be pros.  the assignments have to be
        //made to both a coder type as well as a reg type

        State s = null;
        if (u.getHomeAddress() != null) {
            s = u.getHomeAddress().getState();
        }

        if (u.getCoder() == null || u.getCoder().getCoderType() == null) {
            log.debug("loading up professional assignments for " + s);
            return
                    getFactory().getDemographicAssignmentDAO().getAssignments(
                            getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL), s, getRequestedTypes());
        } else {
            log.debug("loading up " + u.getCoder().getCoderType().getDescription() + " assignments for " + (s == null ? "nostate" : s.getCode()));
            return
                    getFactory().getDemographicAssignmentDAO().getAssignments(
                            u.getCoder().getCoderType(), s, getRequestedTypes());
        }
    }

    protected boolean hasParameter(Map params, String key) {
        return params.get(key) != null && params.get(key).toString().trim().length() > 0;
    }

    protected List getReferrals(User u) {
        State s = null;
        if (u.getHomeAddress() != null) {
            s = u.getHomeAddress().getState();
        }

        return getFactory().getReferralDAO().getReferrals(s);
    }

    protected DAOFactory getFactory() {
        if (factory == null) {
            factory = DAOUtil.getFactory();
        }
        return factory;
    }

    protected void inactivateHsUser(User u) throws Exception, RemoteException, CreateException, GeneralSecurityException {
        log.debug("Inactivating user " + u.getId() + " for HS.");
        Context ctx = null;
        try {
            ctx = TCContext.getContext(ApplicationServer.SECURITY_CONTEXT_FACTORY, ApplicationServer.SECURITY_PROVIDER_URL);
            TCSubject tcs = new TCSubject(132456);
            PrincipalMgrRemoteHome pmrh = (PrincipalMgrRemoteHome) ctx.lookup(PrincipalMgrRemoteHome.EJB_REF_NAME);
            PrincipalMgrRemote pmr = pmrh.create();
            
            UserPrincipal user = new UserPrincipal("", u.getId().longValue());
            GroupPrincipal group = new GroupPrincipal("", 12); // HS group
            
            // Add the user to the HS group; if the user already belongs it will throw an exception
            try {
                pmr.addUserToGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);
            } catch(Exception e) {}
            
            pmr.removeUserFromGroup(group, user, tcs, DBMS.JTS_OLTP_DATASOURCE_NAME);

            //refresh the cached object
            SecurityHelper.getUserSubject(u.getId().longValue(), true, DBMS.JTS_OLTP_DATASOURCE_NAME);
            
        } finally {
            close(ctx);
        }

        // Mark in event_registration table that the user tried to register but was not eligible.
        UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
        Event event = DAOUtil.getFactory().getSeasonDAO().findCurrent(Season.HS_SEASON).getEvent();
        
        log.debug("Mark as not eligible in event id: " + event.getId());
        
        if (event != null) {            
            EventRegistration er = u.getEventRegistration(event);
            
            if (er == null) {                
                er = new EventRegistration();
                er.setId(new EventRegistration.Identifier(u,event));
                u.addEventRegistration(er);
            }
            er.setEligible(false);
            
            userDAO.saveOrUpdate(u);
            markForCommit();
        }
    }

    /**
     * Should be implemented by child classes to handle all the actual processing
     *
     * @throws Exception
     */
    abstract protected void registrationProcessing() throws Exception;
}