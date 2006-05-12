package com.topcoder.web.reg.controller.request;

import com.topcoder.web.common.BaseProcessor;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.common.validation.Validator;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.HibernateUtils;
import com.topcoder.web.reg.RegFieldHelper;
import com.topcoder.web.reg.controller.ExtendedThreadLocalSessionContext;
import com.topcoder.web.reg.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.reg.model.User;
import com.topcoder.web.reg.validation.*;
import org.hibernate.Session;
import org.hibernate.StaleObjectStateException;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
abstract class Base extends BaseProcessor {

    public static final String HIBERNATE_SESSION_KEY = "hibernate_session";
    public static final String END_OF_CONVERSATION_FLAG = "end_of_conversation";
    private User user = null;

    protected void businessProcessing() throws Exception {

        HttpSession httpSession =
                getRequest().getSession();
        Session hibernateSession =
                (Session) httpSession.getAttribute(HIBERNATE_SESSION_KEY);

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
                httpSession.setAttribute(HIBERNATE_SESSION_KEY, null);

                log.debug("<<< End of conversation");

            } else {

                log.debug("Committing database transaction");
                HibernateUtils.commit();

                log.debug("Unbinding Session from thread");
                hibernateSession = ExtendedThreadLocalSessionContext.unbind(HibernateUtils.getFactory());

                log.debug("Storing Session in the HttpSession");
                httpSession.setAttribute(HIBERNATE_SESSION_KEY, hibernateSession);

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
            e.printStackTrace();
            handleException(e);
            throw e;
        } catch (Throwable ex) {
            ex.printStackTrace();
            handleException(ex);
            throw new Exception(ex);
        }

    }

    private void handleException(Throwable e) {
        try {
            if (HibernateUtils.getSession().getTransaction().isActive()) {
                log.debug("Trying to rollback database transaction after exception");
                HibernateUtils.rollback();
            }
        } catch (Throwable rbEx) {
            log.error("Could not rollback transaction after exception!", rbEx);
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
            Validator v = null;
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

    /**
     * Should be implemented by child classes to handle all the actual processing
     *
     * @throws Exception
     */
    abstract protected void registrationProcessing() throws Exception;
}
