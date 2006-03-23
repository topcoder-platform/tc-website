package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.model.DemographicResponse;
import com.topcoder.web.common.model.DemographicQuestion;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegBase;
import com.topcoder.web.privatelabel.controller.request.SimpleRegBase;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;
import com.topcoder.web.privatelabel.model.FullRegInfo;

import java.util.*;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2006
 */
public class Reg extends FullRegBase {

    protected static Logger log = Logger.getLogger(SimpleRegBase.class);

    protected void registrationProcessing() throws TCWebException {
        try {
            List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), getLocale());
            Collections.sort(l);
            getRequest().setAttribute("questionList", l);
            setNextPage();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        setNextPage(Constants.VERISIGN_06_REG_PAGE);
        setIsNextPageInContext(true);
    }


    protected void setDefaults(SimpleRegInfo info) {
        log.debug("setting defaults");
        setDefault(Constants.HANDLE, info.getHandle());
        setDefault(Constants.PASSWORD, info.getPassword());
        setDefault(Constants.PASSWORD_CONFIRM, info.getPasswordConfirm());
        setDefault(Constants.EMAIL, info.getEmail());
        setDefault(Constants.EMAIL_CONFIRM, info.getEmailConfirm());
        setDefault(Constants.FIRST_NAME, info.getFirstName());
        setDefault(Constants.LAST_NAME, info.getLastName());
        setDefault(Constants.LOCALE, getLocale().getLanguage());

        setDefault(Constants.CODER_TYPE, String.valueOf(((FullRegInfo) info).getCoderType()));
        List responses = ((FullRegInfo) info).getResponses();
        DemographicResponse response = null;
        DemographicQuestion question = null;

        HashMap multiAnswerMap = new HashMap();
        for (Iterator it = responses.iterator(); it.hasNext();) {
            response = (DemographicResponse) it.next();
            if (questions == null) {
                log.debug("GETTING QUESTIONS");
                try {
                    questions = getQuestions(transDb, ((FullRegInfo) info).getCoderType(), Integer.parseInt(getRequestParameter(Constants.COMPANY_ID)), getLocale());
                } catch (Exception e) {
                    log.error("COULD NOT GET QUESTIONS", e);
                }
            }
            question = findQuestion(response.getQuestionId(), questions);
            if (question != null) {
                if (question.getAnswerType() == DemographicQuestion.SINGLE_SELECT) {
                    setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), String.valueOf(response.getAnswerId()));
                } else if (question.getAnswerType() == DemographicQuestion.FREE_FORM) {
                    setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), response.getText());
                } else if (question.getAnswerType() == DemographicQuestion.MULTIPLE_SELECT) {
                    //todo handle multiple select
                    ArrayList al = new ArrayList();
                    if (multiAnswerMap.containsKey(new Long(response.getQuestionId()))) {
                        al = (ArrayList) multiAnswerMap.get(new Long(response.getQuestionId()));
                    }
                    al.add(String.valueOf(response.getAnswerId()));
                    multiAnswerMap.put(new Long(response.getQuestionId()), al);
                    //setDefault(Constants.DEMOG_PREFIX + response.getQuestionId(), String.valueOf(response.getAnswerId()));
                } else {
                    //todo something is wrong, we don't recognize that kind of question
                }
            }
        }
        for (Iterator it = multiAnswerMap.keySet().iterator(); it.hasNext();) {
            String s = String.valueOf(((Long) it.next()).longValue());
            log.debug("ADDING MULTIANSWER " + s);
            setDefault(Constants.DEMOG_PREFIX + s, multiAnswerMap.get(new Long(s)));
        }



    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo info = getRegInfoFromPersistor();
        if (info == null) {
            log.debug("didn't find info in persistor, proceding with info from request");
            info = new FullRegInfo();
        } else {
            log.debug("found info in persistor, proceding with that");
            log.debug("company: " + info.getCompanyId() + " event: " + info.getEventId());
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
        if (hasRequestParameter(Constants.FIRST_NAME))
            info.setFirstName(StringUtils.checkNull(getRequestParameter(Constants.FIRST_NAME)));
        if (hasRequestParameter(Constants.LAST_NAME))
            info.setLastName(StringUtils.checkNull(getRequestParameter(Constants.LAST_NAME)));
        if (hasRequestParameter(Constants.COMPANY_ID))
            info.setCompanyId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.COMPANY_ID))));
        if (hasRequestParameter(Constants.EVENT_ID))
            info.setEventId(Long.parseLong(StringUtils.checkNull(getRequestParameter(Constants.EVENT_ID))));
        ((FullRegInfo)info).setCoderType(Constants.PROFESSIONAL);
        return info;
    }

}


