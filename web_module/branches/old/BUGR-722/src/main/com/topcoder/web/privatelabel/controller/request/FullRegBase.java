package com.topcoder.web.privatelabel.controller.request;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.privatelabel.Constants;
import com.topcoder.web.privatelabel.model.DemographicQuestion;
import com.topcoder.web.privatelabel.model.DemographicResponse;
import com.topcoder.web.privatelabel.model.FullRegInfo;
import com.topcoder.web.privatelabel.model.SimpleRegInfo;

import java.util.*;


/**
 * Provides some basic functionality for the different processors
 * involved in a registration process.
 *
 * @author gpaul 06.26.2003
 */
public abstract class FullRegBase extends SimpleRegBase {

    protected static Logger log = Logger.getLogger(FullRegBase.class);

    public FullRegBase() {
    }

    protected void setDefaults(SimpleRegInfo info) {
        super.setDefaults(info);
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

    protected static DemographicQuestion findQuestion(long questionId, Map questions) {
        DemographicQuestion ret = null;
        Long id = new Long(questionId);
        if (questions.containsKey(id)) {
            ret = (DemographicQuestion) ((DemographicQuestion) questions.get(id)).clone();
        }
        return ret;
    }

    protected String getRequestParameter(String name) throws Exception {
        String ret = null;
        ret = getRequest().getParameter(name);
        return ret;
    }

    protected SimpleRegInfo makeRegInfo() throws Exception {
        SimpleRegInfo ret = super.makeRegInfo();
        if (!(ret instanceof FullRegInfo)) {
            ret = new FullRegInfo(ret);
        }

        if (hasRequestParameter(Constants.CODER_TYPE))
            ((FullRegInfo) ret).setCoderType(Integer.parseInt(StringUtils.checkNull(getRequestParameter(Constants.CODER_TYPE))));
        return ret;
    }


}
