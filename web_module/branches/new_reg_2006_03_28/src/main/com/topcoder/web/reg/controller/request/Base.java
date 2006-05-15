package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.controller.ExtendedThreadLocalSessionContext;
import com.topcoder.web.reg.dao.DAOFactory;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.reg.model.*;
import com.topcoder.web.reg.validation.*;
import org.hibernate.Session;
import org.hibernate.StaleObjectStateException;

import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends BaseProcessor {

    public static final String HIBERNATE_SESSION_KEY = "hibernate_session";
    public static final String END_OF_CONVERSATION_FLAG = "end_of_conversation";
    private User user = null;
    private DAOFactory factory = null;

    protected void businessProcessing() throws Exception {

        Session hibernateSession =
                (Session) getRequest().getSession().getAttribute(HIBERNATE_SESSION_KEY);

        try {

            if (hibernateSession != null) {
                log.debug("< Continuing conversation");
                ExtendedThreadLocalSessionContext.bind(hibernateSession);
            } else {
                log.debug(">>> New conversation");
            }

            log.debug("Starting a database transaction");
            HibernateUtils.begin();

            // Do the work...
            registrationProcessing();

            // End or continue the long-running conversation?
            if (getRequest().getAttribute(END_OF_CONVERSATION_FLAG) != null) {

                log.debug("Flushing Session");
                HibernateUtils.getSession().flush();

                log.debug("Committing the database transaction");
                HibernateUtils.commit();

                log.debug("Closing and unbinding Session from thread");
                HibernateUtils.getSession().close(); // Unbind is automatic here

                log.debug("Removing Session from HttpSession");
                //we're creating a new session to handle the case that the request processing invalidated the session
                //there's no way to check, so this is what we're doing.
                HttpSession s =getRequest().getSession(true);
                if (!s.isNew()) {
                    s.setAttribute(HIBERNATE_SESSION_KEY, null);
                }

                log.debug("<<< End of conversation");

            } else {

                log.debug("Committing database transaction");
                HibernateUtils.commit();

                log.debug("Unbinding Session from thread");
                hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());

                log.debug("Storing Session in the HttpSession");
                getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);

                log.debug("> Returning to user in conversation");
            }

        } catch (StaleObjectStateException staleEx) {
            log.error("This interceptor does not implement optimistic concurrency control!");
            log.error("Your application will not work until you add compensation actions!");
            // Rollback, close everything, possibly compensate for any permanent changes
            // during the conversation, and finally restart business conversation. Maybe
            // give the user of the application a chance to merge some of his work with
            // fresh data... what you do here depends on your applications design.
            throw staleEx;
        } catch (Exception e) {
            log.debug("printing the stack from base");
            e.printStackTrace();
            handleException(e);
            throw e;
        } catch (Throwable ex) {
            handleException(ex);
            throw new Exception(ex);
        }

    }

    protected DAOFactory getFactory() {
        if (factory == null) {
            factory = Util.getFactory();
        }
        return factory;
    }

    private void handleException(Throwable e) {
        try {
            if (HibernateUtils.getSession().getTransaction().isActive()) {
                log.debug("Trying to rollback database transaction after exception");
                HibernateUtils.rollback();
            }
        } catch (Throwable rbEx) {
            log.error("Could not rollback transaction after exception! " + rbEx.getMessage());
        } finally {
            log.error("Cleanup after exception!");

            // Cleanup
            log.debug("Closing and unbinding Session from thread");
            HibernateUtils.closeSession(); // Unbind is automatic here

            log.debug("Removing Session from HttpSession");
            getRequest().getSession().setAttribute(HIBERNATE_SESSION_KEY, null);

        }

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
            if (userLoggedIn()) {
                user = (User) getRequest().getSession().getAttribute(Constants.USER);
                if (user == null) {
                    user = new UserDAOHibernate().find(new Long(getUser().getId()));
                    if (user != null) {
                        getRequest().getSession().setAttribute(Constants.USER, user);
                        log.debug("get user from the dao");
                    }
                } else {
                    log.debug("got user from session");
                }
            }
        } else {
            log.debug("got user from processor");
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
        log.debug("setting user");
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
        return (Set) getRequest().getSession().getAttribute(Constants.REG_TYPES);
    }

    /**
     * Set the registration types that the current user is attempting to register for
     * so that they can be retrieved by <code>getRequestedTypes</code>
     *
     * @param requestedTypes
     */
    protected void setRequestedTypes(Set requestedTypes) {
        getRequest().getSession().setAttribute(Constants.REG_TYPES, requestedTypes);
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
        ret.put(Constants.HANDLE, getTrimmedParameter(Constants.HANDLE));
        ret.put(Constants.COMPANY_NAME, getTrimmedParameter(Constants.COMPANY_NAME));
        ret.put(Constants.QUOTE, getTrimmedParameter(Constants.QUOTE));
        ret.put(Constants.TITLE, getTrimmedParameter(Constants.TITLE));
        ret.put(Constants.PHONE_NUMBER, getTrimmedParameter(Constants.PHONE_NUMBER));
        ret.put(Constants.COMP_COUNTRY_CODE, getTrimmedParameter(Constants.COMP_COUNTRY_CODE));
        ret.put(Constants.CODER_TYPE, getTrimmedParameter(Constants.CODER_TYPE));
        ret.put(Constants.TIMEZONE, getTrimmedParameter(Constants.TIMEZONE));

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
        simpleValidation(CompanyNameValidator.class, fields, params, Constants.COMPANY_NAME);
        simpleValidation(EmailValidator.class, fields, params, Constants.EMAIL);
        simpleValidation(GivenNameValidator.class, fields, params, Constants.GIVEN_NAME);
        simpleValidation(MiddleNameValidator.class, fields, params, Constants.MIDDLE_NAME);
        simpleValidation(PasswordValidator.class, fields, params, Constants.PASSWORD);
        simpleValidation(PostalCodeValidator.class, fields, params, Constants.POSTAL_CODE);
        simpleValidation(ProvinceValidator.class, fields, params, Constants.PROVINCE);
        simpleValidation(QuoteValidator.class, fields, params, Constants.QUOTE);
        simpleValidation(SurnameValidator.class, fields, params, Constants.SURNAME);
        simpleValidation(TitleValidator.class, fields, params, Constants.TITLE);
        simpleValidation(CountryValidator.class, fields, params, Constants.COUNTRY_CODE);
        simpleValidation(CountryValidator.class, fields, params, Constants.COMP_COUNTRY_CODE);
        simpleValidation(CoderTypeValidator.class, fields, params, Constants.CODER_TYPE);
        simpleValidation(TimeZoneValidator.class, fields, params, Constants.TIMEZONE);

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

        if (fields.contains(Constants.HANDLE)) {
            ValidationResult userNameResult = new UserNameValidator(getRegUser()).validate(
                    new StringInput((String) params.get(Constants.HANDLE)));
            if (!userNameResult.isValid()) {
                addError(Constants.HANDLE, userNameResult.getMessage());
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
        setDefault(Constants.HANDLE, u.getHandle());
        if (u.getContact() != null) {
            if (u.getContact().getCompany() != null) {
                setDefault(Constants.COMPANY_NAME, u.getContact().getCompany().getName());
            }
            setDefault(Constants.TITLE, u.getContact().getTitle());
        }
        setDefault(Constants.QUOTE, u.getCoder().getQuote());
        if (u.getPrimaryPhoneNumber() != null) {
            setDefault(Constants.PHONE_NUMBER, u.getPrimaryPhoneNumber().getNumber());
        }
        if (u.getCoder() != null) {
            setDefault(Constants.COMP_COUNTRY_CODE, u.getCoder().getCompCountry().getCode());
            if (u.getCoder().getCoderType() != null) {
                setDefault(Constants.CODER_TYPE, u.getCoder().getCoderType().getId());
            }
        }
        if (u.getTimeZone() != null) {
            setDefault(Constants.TIMEZONE, u.getTimeZone().getId());
        }
        for (Iterator it = u.getNotifications().iterator(); it.hasNext();) {
            setDefault(Constants.NOTIFICATION + ((Notification) it.next()).getId(), String.valueOf(true));
        }

    }

    protected Map getSecondaryUserInput() {
        HashMap ret = new HashMap();

        DemographicQuestion dq;
        String key;
        for (Iterator it = getFactory().getDemographicQuestionDAO().getQuestions().iterator(); it.hasNext();) {
            dq = (DemographicQuestion) it.next();
            key = Constants.DEMOG_PREFIX + dq.getId();
            log.debug("in get we got : " + getTrimmedParameter(key));
            if (dq.isMultipleSelect()) {
                List a = getRequest().getParameterValues(key)==null?
                        Collections.EMPTY_LIST:Arrays.asList(getRequest().getParameterValues(key));
                ret.put(key, a);
            } else {
                ret.put(key, getTrimmedParameter(key));
            }
        }
        //todo school,gpa, gpascale etc.

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
                log.debug("in check we got : " + params.get(key));
                //validate the response we got
                if (da.getQuestion().isFreeForm()) {
                    //validate free form
                    ValidationResult freeResult = new DemogFreeFormValidator(getRegUser()).validate(
                            new StringInput((String)params.get(key)));
                    if (!freeResult.isValid()) {
                        addError(key, freeResult.getMessage());
                    }
                } else if (da.getQuestion().isMultipleSelect()) {
                    //validate answers
                    ValidationResult multiResult = new DemogMultiSelectValidator(da.getQuestion()).validate(
                            new ListInput((List) params.get(key)));
                    if (!multiResult.isValid()) {
                        addError(key, multiResult.getMessage());
                    }
                } else if (da.getQuestion().isSingleSelect()) {
                    ValidationResult singleResult = new DemogSingleSelectValidator(da.getQuestion()).validate(
                            new StringInput((String)params.get(key)));
                    if (!singleResult.isValid()) {
                        addError(key, singleResult.getMessage());
                    }
                }
            }
        }
        //todo school,gpa, gpascale etc.
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


    protected void setDemographicDefaults(User u) {
        Set responses = u.getDemographicResponses();
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
    }

    protected List getAssignments(User u) {
        //if they dont' have a coder type, we'll just make them be pros.  the assignments have to be
        //made to both a coder type as well as a reg type

        State s = null;
        if (u.getHomeAddress() != null) {
            s = u.getHomeAddress().getState();
        }

        if (u.getCoder() == null || u.getCoder().getCoderType() == null) {
            return
                    getFactory().getDemographicAssignmentDAO().getAssignments(
                            getFactory().getCoderTypeDAO().find(CoderType.PROFESSIONAL), s, getRequestedTypes());
        } else {
            return
                    getFactory().getDemographicAssignmentDAO().getAssignments(
                            u.getCoder().getCoderType(), s, getRequestedTypes());
        }
    }


    /**
     * Should be implemented by child classes to handle all the actual processing
     *
     * @throws Exception
     */
    abstract protected void registrationProcessing() throws Exception;
}
