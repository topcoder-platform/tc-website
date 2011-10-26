package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;

/**
 * @author dok
 * @version $Revision: 50428 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2006
 */
public class Confirm extends FullRegConfirm {

    protected static Logger log = Logger.getLogger(Confirm.class);

    protected void registrationProcessing() throws TCWebException {
        checkRegInfo(regInfo);

        if (hasErrors()) {
            try {
                List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), getLocale());
                Collections.sort(l);
                getRequest().setAttribute("questionList", l);
            } catch (Exception e) {
                throw new TCWebException(e);
            }
        } else {
            getRequest().setAttribute("responseList", ((FullRegInfo) regInfo).getResponses());
            getRequest().setAttribute("questionMap", getQuestions());
        }

        setDefaults(regInfo);
        setNextPage();
    }

    protected void setNextPage() {
        if (hasErrors()) {
            setNextPage(Constants.VERISIGN_06_REG_PAGE);
        } else {
            setNextPage(Constants.VERISIGN_06_REG_CONFIRM_PAGE);
        }
        setIsNextPageInContext(true);
    }


    protected void checkRegInfo(SimpleRegInfo info) throws TCWebException {
        log.debug("called checkRegInfo");
        //check the demographic information
        super.checkRegInfo(info);

        //check handle
        if (info.getHandle().length() > Constants.MAX_HANDLE_LENGTH ||
                info.getHandle().length() < Constants.MIN_HANDLE_LENGTH) {
            addError(Constants.HANDLE, getBundle().getProperty("error_handle_length"));
        }
        if (!StringUtils.containsOnly(info.getHandle(), Constants.HANDLE_ALPHABET, false)) {
            addError(Constants.HANDLE, getBundle().getProperty("error_handle_chars"));
        }
        try {
            if (info.isNew() && !info.isAccountConversion() && userExists(info.getHandle())) {
                addError(Constants.HANDLE,
                        "The handle (" + info.getHandle() + ") that you have chosen is already in use.  If this is your TopCoder VeriSign Sponsor Track handle, you are already registered and you may use it to log in.  Otherwise, you will need to choose a different handle.");
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }

        //check password
        if (info.getPassword().length() > Constants.MAX_PASSWORD_LENGTH ||
                info.getPassword().length() < Constants.MIN_PASSWORD_LENGTH) {
            addError(Constants.PASSWORD, getBundle().getProperty("error_password_length"));
        }
        if (!info.getPassword().equals(info.getPasswordConfirm())) {
            addError(Constants.PASSWORD_CONFIRM, getBundle().getProperty("error_password_mismatch"));
        }

        //check email
        if (info.getEmail().length() > Constants.MAX_EMAIL_LENGTH) {
            addError(Constants.EMAIL, getBundle().getProperty("error_email_length"));
        }
        StringTokenizer st = new StringTokenizer(info.getEmail(), "@.");
        if (st.countTokens() < 3
                || !StringUtils.contains(info.getEmail(), '@')
                || !StringUtils.contains(info.getEmail(), '.')) {
            addError(Constants.EMAIL, getBundle().getProperty("error_invalid_email"));
        }
        if (!info.getEmail().equals(info.getEmailConfirm())) {
            addError(Constants.EMAIL_CONFIRM, getBundle().getProperty("error_email_mismatch"));
        }

/*        try {
            Request r = new Request();
            r.setContentHandle("user_info_using_email");
            r.setProperty("email", info.getEmail());
            Map m = getDataAccess(db).getData(r);
            ResultSetContainer rsc = (ResultSetContainer) m.get("user_info_using_email");
            if (!rsc.isEmpty()) {
                addError(Constants.EMAIL, "Email address in use, you may only register one account.");
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }*/

        //check first name
        if (info.getFirstName().length() < 1) {
            addError(Constants.GIVEN_NAME, getBundle().getProperty("error_enter_first_name"));
        }

        //nothing for middle name

        //check last name
        if (info.getLastName().length() < 1) {
            addError(Constants.SURNAME, getBundle().getProperty("error_enter_last_name"));
        }

    }


    /**
     * the difference between this and the parents makeRegInfo() is that
     * this one does not require there to be reg info in the sesssion already.
     *
     * @return
     * @throws Exception
     */
    protected SimpleRegInfo makeRegInfo() throws Exception {

        FullRegInfo info = (FullRegInfo) getRegInfoFromPersistor();
        if (info == null) {
            log.debug("didn't find info in persistor, proceding with info from request");
            info = new FullRegInfo();
        } else {
            log.debug("found info in persistor, proceding with that");
            log.debug("company: " + info.getCompanyId() + " event: " + info.getEventId());
            log.debug("info: " + info.getFirstName() + " " + info.getLastName() + " " + info.getHandle());
        }
        if (hasRequestParameter(Constants.HANDLE))
            info.setHandle(StringUtils.checkNull(getRequestParameter(Constants.HANDLE)));
        if (hasRequestParameter(Constants.PASSWORD))
            info.setPassword(StringUtils.checkNull(getRequestParameter(Constants.PASSWORD)));
        if (hasRequestParameter(Constants.PASSWORD_CONFIRM))
            info.setPasswordConfirm(StringUtils.checkNull(getRequestParameter(Constants.PASSWORD_CONFIRM)));
        if (hasRequestParameter(Constants.EMAIL))
            info.setEmail(StringUtils.checkNull(getRequestParameter(Constants.EMAIL)));
        if (hasRequestParameter(Constants.EMAIL_CONFIRM))
            info.setEmailConfirm(StringUtils.checkNull(getRequestParameter(Constants.EMAIL_CONFIRM)));
        if (hasRequestParameter(Constants.GIVEN_NAME))
            info.setFirstName(StringUtils.checkNull(getRequestParameter(Constants.GIVEN_NAME)));
        if (hasRequestParameter(Constants.SURNAME))
            info.setLastName(StringUtils.checkNull(getRequestParameter(Constants.SURNAME)));
        if (hasRequestParameter(Constants.COMPANY_ID))
            info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        if (hasRequestParameter(Constants.EVENT_ID))
            info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));

        //get the demographic responses
        DemographicQuestion q = null;
        String[] values = null;
        DemographicResponse r = null;
        String key = null;
        List questionList = getQuestionList(info.getCoderType(), getLocale());
        //loop through all the questions
        info.clearResponses();
        for (Iterator it = questionList.iterator(); it.hasNext();) {
            q = (DemographicQuestion) it.next();
            key = Constants.DEMOG_PREFIX + q.getId();
            values = getRequest().getParameterValues(key);
            if (q.isRequired() && !hasRequestParameter(key) && !info.hasResponse(q.getId())) {
                //this is cheating, cuz really it should be done in the data checking method.
                addError(key, getBundle().getProperty("error_required_answer"));
            } else if (values != null) {
                //if they've responded in this request, replace whatever was there in persitor with this new stuff
                if (values.length > 0) {
                    info.removeResponses(q.getId());
                }
                String value = null;
                //loop through all the responses in the request
                for (int i = 0; i < values.length; i++) {
                    value = StringUtils.checkNull(values[i]).trim();
                    if (value.length() > 0) {
                        r = new DemographicResponse();
                        r.setQuestionId(q.getId());
                        if (q.getAnswerType() == DemographicQuestion.FREE_FORM) {
                            r.setText(values[i]);
                            r.setSort(q.getSort());
                            info.addResponse(r);
                        } else if (q.getAnswerType() == DemographicQuestion.SINGLE_SELECT ||
                                q.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                            try {
                                r.setAnswerId(Long.parseLong(values[i]));
                                r.setSort(q.getSort());
                                info.addResponse(r);
                            } catch (NumberFormatException e) {
                                //skip it, it's invalid, checking will have to pick it up later
                            }
                        } else {
                            throw new Exception("invalid answer type found: " + q.getAnswerType() + " for question " + q.getId());
                        }
                    } else if (q.isRequired()) {
                        /* at this point, we know that the parameter was included in the request, but the value
                        * was empty.  we'll complain to them and ask them to fill in the question
                        */
                        addError(key, getBundle().getProperty("error_required_answer"));
                    }
                }
            }

        }

        log.debug("later info: " + info.getFirstName() + " " + info.getLastName() + " " + info.getHandle());

        return info;
    }


}