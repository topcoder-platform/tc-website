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
import com.topcoder.shared.util.Transaction;

import javax.naming.InitialContext;
import javax.transaction.UserTransaction;
import java.util.*;

public class Submit extends View {
    protected static Logger log = Logger.getLogger(Submit.class);

    protected void surveyProcessing() throws TCWebException {

        InitialContext ctx = null;
        UserTransaction tx = null;
        try {
            String paramName = null;
            List responses = new ArrayList(10);
            //we need the full list in this case, include free for questions
            List questionInfo = getQuestionInfo(survey.getId(), true);
            for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                paramName = (String) params.nextElement();
                log.debug("param: " + paramName);
                if (paramName.startsWith(AnswerInput.PREFIX)) {
                    List l = validateAnswer(paramName, questionInfo);
                    if (l != null)
                        responses.addAll(l);
                }
            }
            boolean hasAllFreeForm = true;
            if (!hasErrors()) {
                ctx = new InitialContext();
                Response response = (Response) createEJB(ctx, Response.class);

                tx = Transaction.get();
                Transaction.begin(tx);

                SurveyResponse resp = null;
                for (Iterator it = responses.iterator(); it.hasNext();) {
                    resp = (SurveyResponse) it.next();
                    hasAllFreeForm &= resp.isFreeForm();
                    if (resp.isFreeForm()) {
                        response.createResponse(resp.getUserId(), resp.getQuestionId());
                        response.setResponseText(resp.getUserId(), resp.getQuestionId(), resp.getText());
                    } else {
                        response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getAnswerId());
                    }
                }
                Transaction.commit(tx);
            }

            if (hasErrors()) {
                //set the defaults
                setNextPage(Constants.SURVEY_VIEW);
                setIsNextPageInContext(true);
            } else if (hasAllFreeForm) {
                setNextPage(Constants.SURVEY_THANKS);
                setIsNextPageInContext(true);
            } else {
                setNextPage("?" + Constants.MODULE_KEY + "=SurveyResults&" + Constants.SURVEY_ID + "=" + survey.getId());
                setIsNextPageInContext(false);
            }

        } catch (Exception e) {
            if (tx != null) {
                Transaction.rollback(tx);
            }
            throw new TCWebException(e);
        } finally {
            close(ctx);
        }
    }

    private List validateAnswer(String paramName, List questions) {

        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        List ret = null;
        if (values != null) ret = new ArrayList(values.length);
        for (int i = 0; i < values.length; i++) {
            log.debug("param: " + paramName + " value: " + values[i]);
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
                if (values.length > 1) {
                    log.debug("not multiple choice, but there are multiple answers");
                    addError(paramName, "Invalid answer.");
                }
                if (question.getStyleId() == Question.SINGLE_CHOICE) {
                    try {
                        answerId = Long.parseLong(values[i]);
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
                if (isFreeForm(question.getStyleId())) {
                    response.setText(StringUtils.checkNull(values[i]));
                    response.setFreeForm(true);
                } else {
                    response.setAnswerId(answerId);
                    response.setFreeForm(false);
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


