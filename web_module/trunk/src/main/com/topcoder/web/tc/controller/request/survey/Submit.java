package com.topcoder.web.tc.controller.request.survey;

import com.topcoder.web.common.*;
import com.topcoder.web.tc.Constants;
import com.topcoder.web.tc.view.tag.AnswerInput;
import com.topcoder.web.tc.model.Question;
import com.topcoder.web.tc.model.Answer;
import com.topcoder.web.tc.model.SurveyResponse;
import com.topcoder.web.ejb.survey.Response;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.shared.util.Transaction;
import com.topcoder.shared.security.ClassResource;

import javax.naming.InitialContext;
import javax.transaction.UserTransaction;
import java.util.*;

public class Submit extends View {
    protected static Logger log = Logger.getLogger(Submit.class);

    protected void surveyProcessing() throws TCWebException {

        InitialContext ctx = null;
        UserTransaction tx = null;
        try {
            if (getUser().isAnonymous())
                throw new PermissionException(getUser(), new ClassResource(this.getClass()));
            if (alreadyResponded()) {
                throw new NavigationException("Sorry, you may only respond to a survey once.");
            } else {
                String paramName = null;
                List responses = new ArrayList(10);
                for (Enumeration params = getRequest().getParameterNames(); params.hasMoreElements();) {
                    paramName = (String) params.nextElement();
                    log.debug("param: " + paramName);
                    if (paramName.startsWith(AnswerInput.PREFIX)) {
                        List l = validateAnswer(paramName);
                        if (l != null)
                            responses.addAll(l);
                    }
                }
                boolean hasAllFreeForm = true;
                if (!hasErrors()) {
                    ctx = new InitialContext();

                    tx = Transaction.get();
                    Transaction.begin(tx);

                    SurveyResponse resp = null;
                    Response response = (Response) createEJB(ctx, Response.class);
                    for (Iterator it = responses.iterator(); it.hasNext();) {
                        resp = (SurveyResponse) it.next();
                        hasAllFreeForm &= resp.isFreeForm();
                        if (resp.isFreeForm()) {
                            response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getText());
                        } else {
                            response.createResponse(resp.getUserId(), resp.getQuestionId(), resp.getAnswerId());
                        }
                    }
                    Transaction.commit(tx);
                }
                if (hasErrors()) {
                    setDefaults(responses);
                    setNextPage(Constants.SURVEY_VIEW);
                    setIsNextPageInContext(true);
                } else if (hasAllFreeForm&&!responses.isEmpty()) {
                    setNextPage(Constants.SURVEY_THANKS);
                    setIsNextPageInContext(true);
                } else {
                    SessionInfo info = (SessionInfo)getRequest().getAttribute(BaseServlet.SESSION_INFO_KEY);
                    setNextPage(info.getServletPath() + "?" + Constants.MODULE_KEY + "=SurveyResults&" + Constants.SURVEY_ID + "=" + survey.getId());
                    setIsNextPageInContext(false);
                }
            }

        } catch (TCWebException e) {
            throw e;
        } catch (Exception e) {
            if (tx != null) {
                Transaction.rollback(tx);
            }
            throw new TCWebException(e);
        } finally {
            close(ctx);
        }
    }

    private List validateAnswer(String paramName) {

        Question question = null;
        String[] values = getRequest().getParameterValues(paramName);
        List ret = null;
        String errorKey = null;
        if (values == null) {
            ret = new ArrayList(0);
        } else {
            ret = new ArrayList(values.length);
            long questionId = -1;
            long answerId = -1;
            for (int i = 0; i < values.length; i++) {
                log.debug("param: " + paramName + " value: " + values[i]);
                StringTokenizer st = new StringTokenizer(paramName.substring(AnswerInput.PREFIX.length()), ",");
                if (st.hasMoreTokens()) {
                    questionId = Long.parseLong(st.nextToken());
                }
                errorKey = AnswerInput.PREFIX + questionId;
                if (question == null) {
                    question = findQuestion(questionId);
                    if (question == null) {
                        addError(errorKey, "Question doesn't exist");
                        return null;  //quit now
                    }
                }
                if (st.hasMoreTokens()) {
                    //this must be a multiple choice question
                    try {
                        answerId = Long.parseLong(st.nextToken());
                    } catch (NumberFormatException e) {
                        log.debug("numberformat trying to get answer for multiple choice");
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() != Question.MULTIPLE_CHOICE) {
                        log.debug("param has answerid but it's not multiple choice");
                        addError(errorKey, "Invalid answer.");
                    } else if (findAnswer(answerId, question) == null) {
                        log.debug("can't find multiple choice answer");
                        addError(errorKey, "Invalid answer.");
                    }
                } else {
                    //only when it's a multiple choice question should there be multiple answers
                    if (values.length > 1) {
                        log.debug("not multiple choice, but there are multiple answers");
                        addError(errorKey, "Invalid answer.");
                    }
                    if (question.getStyleId() == Question.SINGLE_CHOICE) {
                        try {
                            answerId = Long.parseLong(values[i]);
                        } catch (NumberFormatException e) {
                            log.debug("numberformat trying to get answer for single choice");
                            addError(errorKey, "Invalid answer.");
                        }
                        if (findAnswer(answerId, question) == null) {
                            log.debug("can't find single choice answer");
                            addError(errorKey, "Invalid answer.");
                        }
                    }
                }
                SurveyResponse response = new SurveyResponse();
                response.setQuestionId(question.getId());
                response.setUserId(getUser().getId());
                if (question.isFreeForm()) {
                    String text = StringUtils.checkNull(values[i]).trim();
                    if (text.length() != 0) {
                        response.setText(StringUtils.checkNull(values[i]));
                        response.setFreeForm(true);
                        ret.add(response);
                    }
                } else {
                    response.setAnswerId(answerId);
                    response.setFreeForm(false);
                    ret.add(response);
                }
            }
        }
        log.debug("q: " + question.getId() + "required: " + question.isRequired() + " ret: " + ret.size());
        if (question.isRequired() && ret.isEmpty()) {
            addError(errorKey, "Please respond to this question.");
        }
        return ret;
    }

    private Question findQuestion(long questionId) {
        Question q = null;
        boolean found = false;
        for (Iterator it = questionInfo.iterator(); it.hasNext() && !found;) {
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

    private void setDefaults(List responses) {
        SurveyResponse r = null;
        for (Iterator it = responses.iterator(); it.hasNext();) {
            r = (SurveyResponse) it.next();
            if (findQuestion(r.getQuestionId()).getStyleId() == Question.MULTIPLE_CHOICE) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId() + "," + r.getAnswerId(), "true");
            } else if (r.isFreeForm()) {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), r.getText());
            } else {
                setDefault(AnswerInput.PREFIX + r.getQuestionId(), new Long(r.getAnswerId()));
            }
        }
    }


}


