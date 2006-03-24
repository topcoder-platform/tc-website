package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegConfirm;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
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
                addError(Constants.HANDLE, getBundle().getProperty("error_dup_handle"));
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
        if (!StringUtils.containsOnly(info.getHandle(), Constants.HANDLE_ALPHABET, false)) {
            addError(Constants.PASSWORD, getBundle().getProperty("error_password_chars"));
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

        //check first name
        if (info.getFirstName().length() < 1) {
            addError(Constants.FIRST_NAME, getBundle().getProperty("error_enter_first_name"));
        }

        //nothing for middle name

        //check last name
        if (info.getLastName().length() < 1) {
            addError(Constants.LAST_NAME, getBundle().getProperty("error_enter_last_name"));
        }
  
    }


}
