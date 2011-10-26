package com.topcoder.web.privatelabel.controller.request.verisign06;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.TCWebException;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.controller.request.FullRegBase;
import com.topcoder.web.privatelabel.controller.request.SimpleRegBase;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.Collections;
import java.util.List;

/**
 * @author dok
 * @version $Revision: 45943 $ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2006
 */
public class Reg extends FullRegBase {

    protected static Logger log = Logger.getLogger(SimpleRegBase.class);

    protected void registrationProcessing() throws TCWebException {
        try {
            List l = getQuestionList(((FullRegInfo) regInfo).getCoderType(), getLocale());
            Collections.sort(l);
            getRequest().setAttribute("questionList", l);
            setDefaults(regInfo);
            setNextPage();
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    protected void setNextPage() {
        setNextPage(Constants.VERISIGN_06_REG_PAGE);
        setIsNextPageInContext(true);
    }


/*    protected void setDefaults(SimpleRegInfo info) {
        log.debug("setting defaults");
        setDefault(Constants.HANDLE, info.getHandle());
        setDefault(Constants.PASSWORD, info.getPassword());
        setDefault(Constants.PASSWORD_CONFIRM, info.getPasswordConfirm());
        setDefault(Constants.EMAIL, info.getEmail());
        setDefault(Constants.EMAIL_CONFIRM, info.getEmailConfirm());
        setDefault(Constants.GIVEN_NAME, info.getFirstName());
        setDefault(Constants.SURNAME, info.getLastName());
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

    }*/

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        ((FullRegInfo)ret).setCoderType(Constants.PROFESSIONAL);
        return ret;
    }

}


