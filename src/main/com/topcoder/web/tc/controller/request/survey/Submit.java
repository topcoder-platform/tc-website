package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.TCWebException;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.view.tag.AnswerInput;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.tc.model.SurveyResponse;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.shared.util.logging.Logger;

import javax.naming.InitialContext;
import java.util.*;

public class Submit extends View {
    protected static Logger log = Logger.getLogger(Submit.class);

    protected void surveyProcessing() throws TCWebException {

        try {
            String paramName = null;
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String) params.nextElement();
                log.debug("param: " + paramName);
                if (paramName.startsWith(AnswerInput.PREFIX)) {
                    List responses = validateAnswer(paramName, questionInfo);
                    if (hasErrors()) {
                        setNextPage(Constants.SURVEY_VIEW);
                        setIsNextPageInContext(true);
                    } else {
                        SurveyResponse resp = null;
                        Response response = (Response) createEJB(new InitialContext(), Response.class);
                        boolean hasAllFreeForm = true;
                        for (Iterator it = responses.iterator(); it.hasNext();) {
                            resp = (SurveyResponse) it.next();
                            hasAllFreeForm &= resp.isFreeForm();
                            if (resp.isFreeForm()) {
                                response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getAnswerId());
                            } else {
                                response.createResponse(resp.getUserId(), resp.getQuestionId());
                                response.setResponseText(resp.getUserId(), resp.getQuestionId(), resp.getText());
                            }
                        }
                        if (hasAllFreeForm) {
                            setNextPage(Constants.SURVEY_THANKS);
                            setIsNextPageInContext(true);
                        } else {
                            setNextPage("?" + Constants.MODULE_KEY + "=SurveyResults&" + Constants.SURVEY_ID + "=" + survey.getId());
                            setIsNextPageInContext(false);
                        }
                    }
                }
            }
        } catch (Exception e) {
            throw new TCWebException(e);
        }
    }

    private List validateAnswer(String paramName, List questions) {

        Question question = null;
        String[] answers = getRequest().getParameterValues(paramName);
        List ret = null;
        if (answers != null) ret = new ArrayList(answers.length);
        for (int i = 0; i < answers.length; i++) {
            long questionId = -1;
            long answerId = -1;
            StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()), ",");
            if (st.hasMoreTokens()) {
                questionId = Long.parseLong(st.nextToken());
            }
            if (question == null) {
                question = findQuestion(questionId, questions);
                if (question == null) {
                    addError(paramName, "Question doesn't exist");
                    return null;  //quit now
                }
            }
            if (st.hasMoreTokens()) {
                //this must be a multiple choice question
                answerId = Long.parseLong(st.nextToken());
                if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                    log.debug("param has answerid but it's not multiple choice");
                    addError(paramName, "Invalid answer.");
                } else if (findAnswer(answerId, question) == null) {
                    log.debug("can't find multiple choice answer");
                    addError(paramName, "Invalid answer.");
                }
            } else {
                //only when it's a multiple choice question should there be multiple answers
                if (answers.length > 1) {
                    log.debug("not multiple choice, but there are multiple answers");
                    addError(paramName, "Invalid answer.");
                }
                if (question.getStyleId() == Question.SINGLE_CHOICE) {
                    try {
                        answerId = Long.parseLong(answers[i]);
                    } catch (NumberFormatException e) {
                        log.debug("numberformat trying to get answer for single choice");
                        addError(paramName, "Invalid answer.");
                    }
                    if (findAnswer(answerId, question) == null) {
                        log.debug("can't find single choice answer");
                        addError(paramName, "Invalid answer.");
                    }
                }
            }
            if (!hasErrors()) {
                SurveyResponse response = new SurveyResponse();
                response.setQuestionId(question.getId());
                response.setUserId(getUser().getId());
                if (question.getStyleId() == Question.SINGLE_CHOICE || question.getStyleId() == Question.MULTIPLE_CHOICE) {
                    response.setAnswerId(answerId);
                    response.setFreeForm(false);
                } else {
                    response.setText(StringUtils.checkNull(answers[i]));
                    response.setFreeForm(true);
                }
                ret.add(response);
            }
        }
        return ret;
    }

    private Question findQuestion(long questionId, List questions) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questions.iterator(); it.hasNext() && !found;) {
            q = (Question) it.next();
            found = (q.getId() == questionId);
        }
        return found ? q : null;
    }

    private Answer findAnswer(long answerId, Question question) {
        Answer a = null;
        boolean found = false;
        for (Iterator it = question.getAnswerInfo().iterator(); it.hasNext() && !found;) {
            a = (Answer) it.next();
            found = (a.getId() == answerId);
        }
        return found ? a : null;
    }
}


